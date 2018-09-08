# Memory_Tester_Game
Language: Verilog
Tools: Intel Quartus, ModelSim
Hardware: Altera DE2-115 FPGA

Functionalities achived:
RAM/ROM memories to successfully implement authentication function (login/logout and password reset operation)
Counting the manual button press pulses against the internal clock to generate random numbers and randome sequence of numbers
Timer functionality by implementing hand-shake protocol which is also reconfigurable to different time scales
Score tracking, level tracking and team highest score recording was achieved
Involved constructing multiple state machines to pass from authentication to game and then levels in the game.
Hardware re-utilization by efficient logic realization.
Single button used for login, logout, password confirmation, password reset button, answer upload button, new password load button

Folders:
src: Contains all the code files including mif files
sim: Contains simulation results
syn: Quartus Synthesis files
doc: Includes Design Document

Note: Simulation results of timer couldn't be included as the real word time scale in seconds in much larger than the internal clock operating at nanoseconds. The results were clearly out of scale to display on screen.
