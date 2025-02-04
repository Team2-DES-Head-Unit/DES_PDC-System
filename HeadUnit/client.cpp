#include "client.h"

std::shared_ptr<vsomeip::application> app = vsomeip::runtime::get()->create_application("client-2");

Client client;

void on_response(const std::shared_ptr<vsomeip::message> &_response) {
    std::cout << "CLIENT 2: Response received from Server!" << std::endl;

    std::shared_ptr<vsomeip::payload> its_payload = _response->get_payload();
    const vsomeip::byte_t* data_ptr = its_payload->get_data();
    std::vector<vsomeip::byte_t> response_data(data_ptr, data_ptr + its_payload->get_length());

    ControlData received_data;
    std::memcpy(&received_data, response_data.data(), sizeof(ControlData));

    client.updateGui(received_data);

    std::cout << "Received throttle: " << received_data.throttle << ", steering: "
              << received_data.steering << std::endl;
    std::cout << "Gear P: " << static_cast<int>(received_data.gear_P)
              << ", D: " << static_cast<int>(received_data.gear_D)
              << ", R: " << static_cast<int>(received_data.gear_R)
              << ", N: " << static_cast<int>(received_data.gear_N) << std::endl;
    std::cout << "Indicator Left: " << static_cast<int>(received_data.indicator_left)
              << ", Right: " << static_cast<int>(received_data.indicator_right) << std::endl;
}

void send_request_to_server() {
    while (true) {
        std::shared_ptr<vsomeip::message> request = vsomeip::runtime::get()->create_request();
        request->set_service(SAMPLE_SERVICE_ID);
        request->set_instance(SAMPLE_INSTANCE_ID);
        request->set_method(SAMPLE_METHOD_ID);

        std::shared_ptr<vsomeip::payload> its_payload = vsomeip::runtime::get()->create_payload();
        std::vector<vsomeip::byte_t> payload_data(8, 0x00);
        its_payload->set_data(payload_data);
        request->set_payload(its_payload);

        app->send(request);

        std::cout << "CLIENT 2: Request sent to Server, waiting for response..." << std::endl;

        std::this_thread::sleep_for(std::chrono::milliseconds(200));
    }
}

void Client::send_mode_to_server(int mode) {
    std::shared_ptr<vsomeip::message> mode_request = vsomeip::runtime::get()->create_request();
    mode_request->set_service(SAMPLE_SERVICE_ID);
    mode_request->set_instance(SAMPLE_INSTANCE_ID);
    mode_request->set_method(SAMPLE_MODE_METHOD_ID);

    std::shared_ptr<vsomeip::payload> mode_payload = vsomeip::runtime::get()->create_payload();
    std::vector<vsomeip::byte_t> payload_data = { mode };
    mode_payload->set_data(payload_data);
    mode_request->set_payload(mode_payload);

    app->send(mode_request);

    std::cout << "CLIENT: Mode " << static_cast<int>(mode) << " sent to Server." << std::endl;
}

void start_client(){
    try{
        app->init();
        app->register_message_handler(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID, SAMPLE_METHOD_ID, on_response);

        std::thread request_thread(send_request_to_server);

        app->start();
        request_thread.join();
    } catch (const std::exception &e){
        std::cerr << "exception occurs at start_client : " << e.what() << std::endl;
    }
}
