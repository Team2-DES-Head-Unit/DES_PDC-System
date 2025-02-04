#include "server.h"
#include "get_battery.h"

std::shared_ptr<vsomeip::application> app = vsomeip::runtime::get()->create_application("service-sample");

Server server;
ControlData received_data;
int i2c_fd;

void on_message_from_client_1(const std::shared_ptr<vsomeip::message> &_request) {
    std::cout << "SERVER: Request Received from Client 1!" << std::endl;

    std::shared_ptr<vsomeip::payload> its_payload = _request->get_payload();
    const vsomeip::byte_t* data_ptr = its_payload->get_data();

    //    ControlData received_data;
    std::memcpy(&received_data, data_ptr, sizeof(ControlData));

    server.updateGui(received_data);

    std::cout << "Received throttle: " << received_data.throttle << ", steering: "
              << received_data.steering << std::endl;
    std::cout << "Gear P: " << static_cast<int>(received_data.gear_P)
              << ", D: " << static_cast<int>(received_data.gear_D)
              << ", R: " << static_cast<int>(received_data.gear_R)
              << ", N: " << static_cast<int>(received_data.gear_N) << std::endl;
    std::cout << "Indicator Left: " << static_cast<int>(received_data.indicator_left)
              << ", Right: " << static_cast<int>(received_data.indicator_right) << std::endl;
//    std::cout << "Battery percentage: " << static_cast<int>(received_data.battery_percentage) << std::endl;
}

void on_request_from_client_2(const std::shared_ptr<vsomeip::message> &_request) {
    std::shared_ptr<vsomeip::message> response_to_client_2 = vsomeip::runtime::get()->create_response(_request);
    std::shared_ptr<vsomeip::payload> response_payload = vsomeip::runtime::get()->create_payload();

//    ControlData received_data = {};
    std::vector<vsomeip::byte_t> payload_data(reinterpret_cast<vsomeip::byte_t*>(&received_data),
                                              reinterpret_cast<vsomeip::byte_t*>(&received_data) + sizeof(ControlData));
    response_payload->set_data(payload_data);
    response_to_client_2->set_payload(response_payload);
    app->send(response_to_client_2);
}

void on_mode_request_from_client(const std::shared_ptr<vsomeip::message> &_request) {
    std::shared_ptr<vsomeip::payload> mode_payload = _request->get_payload();
    const vsomeip::byte_t* mode_data_ptr = mode_payload->get_data();
    int mode = mode_data_ptr[0];

    std::cout << "SERVER: Mode received from Client: " << static_cast<int>(mode) << std::endl;

    server.setMode(mode);
}


void start_server() {
    app->init();
    app->register_message_handler(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID_1, SAMPLE_METHOD_ID, on_message_from_client_1);
    app->register_message_handler(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID_2, SAMPLE_METHOD_ID, on_request_from_client_2);
    app->register_message_handler(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID_2, SAMPLE_MODE_METHOD_ID, on_mode_request_from_client);

    app->offer_service(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID_1);
    app->offer_service(SAMPLE_SERVICE_ID, SAMPLE_INSTANCE_ID_2);

    app->start();
}
