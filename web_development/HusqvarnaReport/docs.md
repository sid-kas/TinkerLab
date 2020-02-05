Husqvarna Drilling Process Automation (Report)
=================

## Project key progress milestones
> ### Before Summer'19:
+ Integrated accelerometer and Time of Flight(T.O.F) sensors on the raspberry pi hat [ref](todo:refer_to_image_or_document_here)

+ Developed realtime material detection algorithm *in tensorflow* based on accelerometer and rate of descent data (low accuracy) #Nov'18

+ Decoded xbee protocols around december, read more on [protocols@excel](./excel_sheets/xbee_command_protocol.xlsx) #Dec'18

+ ZeroMQ based microservices in python ( data aquisiotion, material detetction, Automatic Controller, terminal client )  #Dec'18

+ Controlled AD10 and recorded data from AD10 #Jan'19

+ Combined multiple frequency data collection (AD10, T.O.F sensor, accelerometer) using SQLite database #Feb'19

+ Created data visualization tools based on SQLite+ python dash , read more [here@docx](reports/2019_V11.docx) #March'19

+ Upgraded and Trained the realtime material detection algorithm using data from AD10 , read more [here@docx](reports/2019_V14.docx)  #April'19

+ Developed a reinforcement learning algorithm for discrete control *in tensorflow* ([DQfd@arxiv](https://arxiv.org/pdf/1704.03732.pdf)) 

+ Tested DQfd algorithm on virtual environment ([LaunarLander](https://gym.openai.com/envs/LunarLander-v2/)) from openAI gym, read more [here@docx](reports/2019_V18.docx) #April'19

+ Integrated microservices with android app with manual/auto mode #May'19

+ Simple automatic control based on a filter (worked with simgle bar profile) #May'19

+ Microservice architecture of the old python code base 
    

+ Created a concept for automatic Drill, watch video [here@mp4](https://www.dropbox.com/sh/1rvhb8859ccriw0/AAA_-14XlxxO4m5BopD_jF9Ea?dl=0) and slides [here@ppt](https://chalmersindustriteknik.sharepoint.com/:p:/r/sites/Digitalisering/Delade%20dokument/Husqvarna/Presentations/Presentation%20for%20RN%20May2019.pptx?d=wc4670aa8c3e54a099c80c5c25ab654de&csf=1&e=Hscvj9)

+ Planned to rebuild the AD10

> ### After Summer'19

+ Designed new Software architecture for the future AD10 replacement, keeping flexibity and scalabilíty in mind. #July-Aug'19

+ Created [Protocol Buffers](https://developers.google.com/protocol-buffers/docs/javatutorial) based data containers and implemented persistence storage and data acquisition (in a simulated environement).#Aug'19 

+ Added [gRPC](https://grpc.io/) based framework allowing clients to control the harware via the server and also to subscribe to data streamed from the server using gRPC schema. #Aug-Sep'19

+ Designed and partially implemented a cloud based distributed file storage system for three types of data files created by the framework (raw sensor data, processed data, trained models) with support for statical information on files/file system usage. #Sep'19

+ Implemented realtime and saved data plotter for visualizing the data on the client and server side. #Sep'19

+ Built a *sensor board* based on [IMU](todo:link)(Accelerometer/magenetometer) and [digital halleffect](todo:addlink) sensor to record rpm of the DrillBit and the feeder. #Sep-Oct'19

+ Added support to control (old logic) the AD10 (using Time of Filght sensor, xbee interface) #Oct'19
 
+ Planned on a strategy to control the new hardware (before Nov'19) in threee steps:
    + Record the rpm from the drill bit using the *sensor board*. Develop a controller using the rpm data as the fundemental input.
    + Create an drillbit rpm *estimator* using machine learning based on data collected from the new hardware and the *sensor board*.
    + Replace rpm from *sensor board* with estimated rpm from the machine learning *estimator*  in the controller.

## Updated strategy in response to new requirements (hardware and sofware)

> ### updates on hardware

+ The AD10 had built in logic for fail-safe and feeder control which severely limited the options for developing the AutomaticControl based on AI. The new hardware on the other hand doesn't have any of these constraints.

+ The new hardware replacement requires the Automatic Drill Controller (AI) to implement the feeder fail-safes and control logic.

+ Latency in old radio control via xbee was high (permited max.10Hz update rate) but the new hardware permits much lower latency (permits milli second scale)

+ The new hardware provides data on the feeder motor speed which is'nt available on the AD10.

> ### New Software architecture

+ In response to the updates in hardware and communication a new sofware system architecture is designed keeping flexibility and scalability in mind.

+ The new framework is centered around unsing [gRPC](https://grpc.io/) for comunication and [protocol buffers](https://developers.google.com/protocol-buffers/docs/javatutorial) for seriazation (in place of [ZeroMQ](https://zeromq.org/languages/python/) and [custom serializer](https://www.json.org/)) since this reduces development time and minimizes required tests if communication schema is updated.

+ The data rate of the new hardware is considerably higher, only meta data is stored in the database. The time series data is stored in a file (accumulated protobuf containers) based starage system (previously all data was stored in one table). 

+ The new framework supports easy integration of new hardware or simulated hardware types. This functionality is important because the specification for the new hardware is not complete yet.
