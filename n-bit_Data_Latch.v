//This stores n-bit data and it has a OE and CE. 
//It takes in the n bit data and goes to a decoder and then assigns each bit to each individual D flip flop.
//The OE, CE and clock must be connected to to all individual D flip flops.
//Note that the latch updates memory on falling edge and does operations on rising edge.
//Returns Q the n bits currently stored in the Latch and Q_bar the n bits stored in the latch but inverted.
//Takes in the n bit data, clock, OE and CE.