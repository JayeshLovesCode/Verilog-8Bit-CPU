//This Consists of the Control FSM, Registers, ALU amd Internal Data Bus.
//This is connected to the main memory by Inter Connection Data Bus
//For Adding, Subtracting, AND, OR and XOR operations takes 4 clock cycles or 4 States of FSM, Decode, E0, E1 and E2.
//For RY, NOP and NOT operations takes 3 clock cycles or 3 States of FSM, Decode, E1 and E2.


//In Decode State: Checks if it is a OneSourceOP or not - Checks if the operation needs 2 word [Done in FSM].
//The instruction is sent to the FSM and then the FSM generates what the next state should be.
//It checks it based on Opcode.


//In E0: Read the W1 and Write it in T1

//During the rising edge of clock:
//The FSM generates the 4 bit Address to say which value to read from the Word Bank(W1).
//It also generates the WordR to say we are reading from the Word Bank.
//Now the output of the Word Bank goes to the internal Data bus.
//The FSM produces the T1OE and T1CE to say if we are writing in the T1 or reading from the T1.

//During the falling edge of clock:
//The value is Latched in T1.


//In E1: Read W2, Perform the operation and Write the result in T2

//During the rising edge of clock:
//The FSM generates the 4 bit Address to say which value to read from the Word Bank(W2).
//Now the Second value is stored in sent Internal Data bus and then to ALU and the value stored in T1 is also sent to ALU.
//The FSM produces the Opr to say which operation to perform in the ALU.

//During the falling edge of clock:
//The result of the ALU is Latched in T2.


//In E2: Write the result in T2 to the Word Bank

//During the rising edge of clock:
//The FSM generates the 4 bit Address to say in which word we have to save our result(W3).
//The FSM produces the WordW to say that we are writing in the Word Bank.
//The value stored in T2 is sent to the internal Data bus.

//During the falling edge of clock:
//The value from the internal Data bus is Latched to the Word Bank.

//Note that for RY, NOP and NOT operations we dont need to read the second value from the Word Bank and perform the operation in the ALU.
//so we can skip E0 and directly go to E1 and then E1.
//Also note that the ALU must be in NOP mode whenever we are not using it.

//It gets the instruction from the IR and then goes to the FSM and then the FSM generates the control signals.