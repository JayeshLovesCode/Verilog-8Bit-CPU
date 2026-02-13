//This is the Instruction Register which stores the instruction that is being executed currently.
//It takes in the instruction from the main memory and then sends it to the FSM and then the FSM generates the control signals.
//It is 16 bit long.
//It has Opcode ( 4 bits), DWord - Destination Word (4 bits), SXWord - WordX (4 bits) and SYWord - WordY (4 bits).

//The FSM has to check if 