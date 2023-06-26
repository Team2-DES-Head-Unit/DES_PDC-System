# **DES Project - PDC System**
## Implementation of Park Distance Control System for the PiRacer  
</br>


# Index
#### [Introduction](#introduction-1)
#### [Background Information](#background-information-1)
#### [Project Goals & Objectives](#project-goals-and-objectives)
#### [Technical Requirements](#technical-requirements-1)
#### [System Architecture](#system-architecture-1)
#### [Software Design](#software-design-1)
#### [Implementation](#implementation-1)
#### [Project Timeline](#project-timeline-1)
#### [Collaboration and Teamwork](#collaboration-and-teamwork-1)
#### [Mentorship and Support](#mentorship-and-support-1)
#### [Reflection and Self-Assessment](#reflection-and-self-assessment-1)
#### [Results](#results-1)
#### [Submission](#submission-1)
#### [References](#references-1)
</br>

# Introduction

The goal of this project is to enhance the Piracer by integrating a Park Distance Control (PDC) system, running on a Raspberry Pi (RPi) inside the head unit. The PDC system will utilize ultrasonic sensors to detect the distance between the vehicle and any obstacles, and provide an audible response to the driver. In addition, the full stack feature development will be integrated into the existing Yocto image, creating a comprehensive and fully functional system. The project aims to provide hands-on experience in developing and integrating advanced driver-assistance features, as well as provide a deeper understanding of the software and hardware involved in modern vehicles. The following sections will provide further details on the technical requirements, system architecture, software design, implementation, results, and references for this project.  
</br>


# Background Information

The field of automotive engineering has seen a significant shift in recent years towards incorporating more advanced technologies into vehicles. With the rise of embedded systems, sensors, and the Internet of Things (IoT), it has become possible to add features to vehicles that were previously thought impossible. One such feature is the Park Distance Control (PDC) system. PDC is a system that uses ultrasonic sensors to measure the distance between a vehicle and obstacles, and provides visual and audible alerts to the driver to assist with parking.

The purpose of this project is to implement a PDC system on a Raspberry Pi (RPi) that is integrated into the head unit of the PiRacer. The RPi will use ultrasonic sensors to measure the distance between the PiRacer and any obstacles, and provide visual and audible feedback to the driver to assist with parking. This project will also involve the development of full-stack features for the PDC system, including the integration of the ultrasonic sensors, the RPi, and the existing Yocto image.  
</br>


# Project Goals and Objectives

Project Goals:

* To design and implement a Park Distance Control (PDC) system for the piracer, which will make use of ultrasonic sensors to measure the distance between the car and any obstacles in its path.
* To integrate the full-stack feature development of the PDC system into the existing Yocto image running on the Raspberry Pi inside the head unit.
* To provide an audible response to the driver, indicating the distance to obstacles, thereby enhancing safety and convenience while parking.

Project Objectives:

* To research and evaluate the feasibility of using ultrasonic sensors for PDC system.
* To design and implement a complete software architecture for the PDC system, including all required communication protocols, drivers, and libraries.
* To test and validate the PDC system to ensure accurate measurement of distance and smooth integration with the existing Yocto image.
* To refine and improve the system based on the results of testing, making necessary updates and improvements to meet the project goals.

</br>


# Technical Requirements

the following technical requirements must be considered for the implementation of the Park Distance Control (PDC) system:

1. Hardware Requirements:
    * RPi: The project requires a Raspberry Pi as the main processing unit.
    * Ultrasonic sensors: A set of ultrasonic sensors will be used to measure the distance between the car and any objects in front of it.
    * CAN bus: The CAN bus will be used to connect the ultrasonic sensors to the RPi for data transfer.
    * Yocto: The Yocto project will be used as the base for building the required software stack for the RPi.
2. Software Requirements:
    * Operating System: A custom Linux-based operating system will be developed using Yocto, which will run on the RPi.
    * CAN driver: A CAN driver will be implemented on the Yocto image to enable communication between the ultrasonic sensors and the RPi over the CAN bus.
    * Ultrasonic sensor driver: A custom driver will be implemented to interface the ultrasonic sensors with the RPi.
    * Park Distance Control (PDC) software: A software application will be developed that implements the PDC functionality and integrates it with the existing head unit software.
3. Functional Requirements:
    * Distance measurement: The software must be able to measure the distances between the car and objects in front of it accurately.
    * Audible response: The software must provide an audible response to the driver to indicate the distance between the car and an object.
    * Display integration: The PDC functionality must be integrated into the existing head unit software and displayed on the screen.
    * Inter-Process Communication (IPC): The PDC software must be able to communicate with other components in the head unit using a suitable IPC mechanism such as vsomeip or autosar.
4. Non-Functional Requirements:
    * Performance: The PDC software must be able to process distance measurements in real-time, with low latency.
    * Reliability: The software must be robust and reliable, with minimal downtime.
    * Maintainability: The code must be well-documented and easy to maintain, with a modular design.

By meeting these technical requirements, the PDC system will be able to provide the necessary functionality to the head unit and enable the driver to have a clear understanding of the distance between their car and any obstacles.  
</br>


# System Architecture

The system architecture for the Park Distance Control (PDC) system consists of several components that work together to provide an accurate and reliable measurement of the distance between the vehicle and an object. The following are the key components of the system architecture:

1. Ultrasonic Sensors: These sensors emit and receive high-frequency sound waves that are used to measure the distance between the vehicle and an object. The sensors will be placed at the front and rear of the vehicle to detect objects in the path of the vehicle.
2. Raspberry Pi (RPi): This single-board computer will be used as the central processing unit for the PDC system. The RPi will process the signals from the ultrasonic sensors and provide the necessary control signals to the head unit.
3. Head Unit: This unit will serve as the main interface for the PDC system and will display the distance between the vehicle and an object on a display screen. The head unit will also provide an audible response to the driver in the form of a beep or tone to indicate the distance between the vehicle and an object.
4. Inter-Process Communication (IPC): To enable communication between the head unit and the RPi, a suitable IPC mechanism such as vsomeip/autosar will be used.
5. CAN Bus: The Controller Area Network (CAN) bus will be used to transmit data between the RPi and the head unit. The CAN bus will allow the RPi to send information about the distance between the vehicle and an object to the head unit, which will then be displayed to the driver.

The components of the system architecture will work together to provide an accurate and reliable measurement of the distance between the vehicle and an object. The RPi will process the signals from the ultrasonic sensors and provide the necessary control signals to the head unit, which will display the distance to the driver. The IPC and CAN bus will facilitate communication between the head unit and the RPi.  
</br>


# Software Design

The software design for the Park Distance Control (PDC) system implementation consists of the following components:

1. Sensor Interface: The ultrasonic sensors will be integrated with the existing setup and connected to the Raspberry Pi (RPi) for data collection.
2. Data Processing: The data collected from the sensors will be processed by the RPi to determine the distance between the sensors and any obstacle in the path.
3. User Interface: The user interface of the PDC system will be integrated with the existing head unit application running on the RPi. The user will be able to access the PDC feature through the head unit's GUI, with visual and audible distance indications.
4. Sound Output: An audible response feature will be added to the PDC system, to provide the driver with additional feedback on the proximity of obstacles.
5. Inter-Process Communication (IPC): To enable communication between the different components of the system, IPC protocols such as vsomeip or AUTOSAR can be used.
6. Control Unit: The RPi will act as the control unit, managing the PDC system and ensuring that the correct information is displayed to the user through the head unit's GUI.

The software design will be implemented using a modular approach, with well-defined interfaces between the different components to ensure ease of maintenance and future development. The Yocto image for the RPi will be used as the development platform, allowing for seamless integration with the existing setup.  
</br>


# Implementation

The implementation of the park distance control system will involve several steps, each with its own technical details:

1. Integration of Ultrasonic Sensors: The first step is to integrate the ultrasonic sensors with the piracer. This will require precise measurements and calculations to ensure that the sensors are positioned correctly and have the correct range and accuracy.
2. Development of Driver Layer: The next step will be to develop the driver layer, which will interface with the ultrasonic sensors and receive the distance readings. This layer will need to be designed with fault-tolerance in mind to ensure reliable operation of the park distance control system.
3. Implementation of Algorithm: Once the driver layer is in place, the algorithm for the park distance control system can be implemented. This will involve processing the distance readings from the sensors to determine the presence and proximity of obstacles, and using this information to trigger the audible response and display the information on the head unit display.
4. Integration with Head Unit: The final step is to integrate the park distance control system with the head unit. This will require the development of the user interface for the system, including the display of the distance readings and the provision of the audible response.

Each of these steps will require a high degree of technical expertise, as well as a solid understanding of the underlying hardware and software systems involved. It will be important to take a systematic and thorough approach to each step to ensure that the park distance control system operates reliably and effectively.  
</br>


# Project Timeline

The following is a tentative timeline for the implementation of the Park Distance Control (PDC) system on the RPi inside the head unit of the Piracer:

1. Initial research and planning: 3 days

    This stage involves reviewing existing literature and documentation on PDC systems, ultrasonic sensors, Yocto image, and determining the best approach for integration with the existing system.

2. Procurement of hardware and software components: 2 days

    This stage involves ordering ultrasonic sensors, necessary cables and connectors, as well as acquiring the necessary software components such as the Yocto image and IPC libraries.

3. Hardware setup: 2 days

    This stage involves mounting the ultrasonic sensors on the Piracer, connecting them to the RPi, and ensuring that the sensors are functioning correctly.

4. Software integration: 3 weeks

    This stage involves integrating the PDC software into the existing Yocto image, adding the audible response feature, and testing to ensure that the PDC system is working correctly.

5. User interface design and implementation: 1 weeks

    This stage involves designing the user interface for the PDC system and integrating it into the head unit of the Piracer.

6. System testing: 1 weeks

    This stage involves testing the PDC system under various conditions to ensure that it is working correctly and meets the desired specifications.

7. Documentation and final touches: 2 days

    This stage involves documenting the steps taken in the implementation process, as well as making any necessary final adjustments to the PDC system.


This timeline assumes that there will not be any major obstacles or delays during the implementation process and is subject to change if necessary. The goal is to complete the implementation of the PDC system within 7 weeks.  
</br>


# Collaboration and Teamwork

Students will be working in teams of maximum four to complete this project. Each team member will be assigned specific tasks and responsibilities, and will be expected to contribute to the overall success of the project. Teams will be required to submit regular progress reports and to meet with the instructor for check-ins and feedback.  
</br>


# Mentorship and Support

Students will be provided with mentorship and support from the instructor throughout the project. The instructor will be available for questions and guidance, and will hold regular check-ins and progress reports to provide feedback and support.  
</br>


# Reflection and Self-Assessment

Students will be encouraged to reflect on their own learning and progress throughout the project. This will be done through self-assessment exercises and through feedback from the instructor and other team members.  
</br>


# Results

After the successful implementation of the PDC system, the PiRacer will be able to provide drivers with accurate and real-time information about the distance between the vehicle and obstacles in the surrounding environment. This will improve the parking experience and provide a safer and more convenient solution for drivers.  
</br>


# Submission

Turn in a github repository with following information:

* Detailed technical specifications of the ultrasonic sensors used in the project.
* Schematics and wiring diagrams for the park distance control system.
* Source code for the park distance control system, including any necessary libraries and dependencies.
* Test results and performance data for the park distance control system.
* A list of online resources and tutorials used in the project.
* Any additional material that supports the understanding of the project and provides context to the reader.

</br>


# References

Raspberry Pi Foundation. (2021). Raspberry Pi Documentation. https://www.raspberrypi.org/documentation/

Yocto Project. (2021). Yocto Project Documentation. https://www.yoctoproject.org/documentation/

Inter-Process Communication. (2021). Wikipedia. https://en.wikipedia.org/wiki/Inter-process_communication

Controller Area Network. (2021). Wikipedia. https://en.wikipedia.org/wiki/Controller_Area_Network




Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
