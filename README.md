# smart-water-level-sensor-simulation
The system monitors the water 
level of a tank and automatically controls a pump to maintain the 
water level within safe thresholds. The project demonstrates the 
application of digital design principles and finite state machines 
(FSM) using Verilog, verified through simulation on GTKWave. 

The Smart Water Level Controller is implemented as a Finite State 
Machine (FSM) that transitions between different states based on the 
water level sensor input.
The key components of the circuit include: 

• Sensor inputs to detect water levels (represented by digital signals). 

• A control logic block (FSM) that determines when to turn the pump 
ON or OFF. 

• Output signals to control the pump and an alarm system. 

The FSM typically has three main states:
LOW, MEDIUM, and HIGH. 
When the water level is below the low threshold, the pump turns ON. 
When it exceeds the high threshold, the pump turns OFF, preventing 
overflow. 


Output

<img width="1020" height="569" alt="image" src="https://github.com/user-attachments/assets/341a33e4-903c-4d0a-99ea-312802d1761f" />


Simulation Results (GTKWave) 

The simulation was performed using the Icarus Verilog compiler 
(`iverilog`) and GTKWave for waveform analysis. The waveform 
confirms the correct functioning of the FSM: 

• When the level is below the low threshold → Pump ON. 

• When the level reaches the high threshold → Pump OFF.

• When the water level remains between thresholds → Pump 
maintains its previous state. 

The GTKWave simulation demonstrates proper synchronization 
between input signals (level changes) and outputs (pump and alarm).

<img width="1009" height="505" alt="image" src="https://github.com/user-attachments/assets/de62efd8-df81-4819-b166-741ca895029d" />


Conclusion 

This project successfully demonstrates the design and simulation of a 
Smart Water Level Controller using Verilog HDL. The design utilizes a 
finite state machine to automatically manage water levels, ensuring 
efficient control and protection against overflow. The simulation results 
validate the accuracy of the design and confirm the correct behavior of 
the system.
