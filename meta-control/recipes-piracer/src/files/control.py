import socket
import struct
from piracer.vehicles import PiRacerStandard
from piracer.gamepads import ShanWanGamepad

# ControlData 구조체와 동일한 메모리 레이아웃
# 'f'는 float, 'B'는 uint8_t에 해당
def create_control_data(throttle, steering, gear_state, indicator_state):
    return struct.pack(
        'ffBBBBBB',  # 'ff' for two floats (throttle, steering), 'BBBBBB' for uint8_t fields
        throttle, steering,
        gear_state['P'], gear_state['D'], gear_state['R'], gear_state['N'],
        indicator_state['l'], indicator_state['r']
    )

if __name__ == '__main__':
    shanwan_gamepad = ShanWanGamepad()
    piracer = PiRacerStandard()

    # Basic gear state is Park state
    gear_state = {
        'P': 1,
        'D': 0,
        'R': 0,
        'N': 0
    }

    # Basic indicator state
    indicator_state = {
        'l': 0,
        'r': 0
    }

    # 소켓 생성 및 연결
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        client_socket.connect(('localhost', 65432))  # C++ 서버의 IP와 포트로 연결 시도
        print("Connected to server successfully!")
    except socket.error as e:
        print(f"Failed to connect to server: {e}")

    try:
        while True:
            # Read data from gamepad
            gamepad_input = shanwan_gamepad.read_data()
            x, y, a, b, l, r = gamepad_input.button_x, gamepad_input.button_y, gamepad_input.button_a, gamepad_input.button_b, gamepad_input.button_l1, gamepad_input.button_r1

            # Select gear from the gamepad button
            if x:
                gear_state = {'P': 1, 'D': 0, 'R': 0, 'N': 0}
            elif y:
                gear_state = {'P': 0, 'D': 1, 'R': 0, 'N': 0}
            elif a:
                gear_state = {'P': 0, 'D': 0, 'R': 1, 'N': 0}
            elif b:
                gear_state = {'P': 0, 'D': 0, 'R': 0, 'N': 1}

            # Select indicator from the L1, R1 Button
            if l:
                if indicator_state['l'] == 1:
                    indicator_state['l'] = 0
                else:
                    indicator_state['l'] = 1
                    indicator_state['r'] = 0

            if r:
                if indicator_state['r'] == 1:
                    indicator_state['r'] = 0
                else:
                    indicator_state['r'] = 1
                    indicator_state['l'] = 0

            print(gear_state, indicator_state)

            # Make throttle and steering value
            throttle = gamepad_input.analog_stick_right.y * 0.5
            steering = -gamepad_input.analog_stick_left.x

            # 1. Reverse movement is disabled even if the joystick is pulled backward
            # 2. If the gear state is P or N, the joystick doesn't work
            if throttle < 0 or gear_state['P'] == 1 or gear_state['N'] == 1:
                throttle = 0

            # If the gear state is R, the car goes back even when the joystick is pushed forward
            if gear_state['R'] == 1 and throttle > 0:
                throttle = -throttle

            print(f'throttle={throttle}, steering={steering}')

            # 차량 제어
            piracer.set_throttle_percent(-throttle)
            piracer.set_steering_percent(steering)

            # ControlData 구조체로 직렬화한 후 소켓을 통해 전송
            control_data = create_control_data(throttle, steering, gear_state, indicator_state)
            client_socket.sendall(control_data)

    except KeyboardInterrupt:
        print("Vehicle control stopped by user")

    finally:
        client_socket.close()

