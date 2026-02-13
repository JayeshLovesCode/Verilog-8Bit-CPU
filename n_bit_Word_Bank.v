//This contains the n-bit_Data_Latch 
//It is represented as m X n-bit-word 
//where m is the number of the n-bit-Data_Latch and n is the word size it is the number of bits the n-bit-Data-Latch holds.
//In this CPUdesign we use word size as 32 bits and m as 16.
//The [A_0] is read as the the value stored in the address A_0.
//
//It takes in the address bits in our case it is 4 bits because we have 16 n-bit-Data_Latch.
//The address bits are given to Word Bank by a m bit address Bus.
//The Word Bank also takes in Read and Write signals which says if we are writing or reading from the specific Word addressed by the address bus.
//The Word bank also takes in a clock signal because it has latches and obviously works on the falling edge of the clock.
//If we have to write in the n-bit-Data_Latch then we have to say what the data is.
//The Word Bank also takes in another input that is the the 32 bits of data that we want to write in the n-bit-Data_Latch.
//The data to be written is given by a n bit data bus in our case 32 bit data bus.
//
//@Inputs : Read(R), Word Select Signal(WS), Clock(clk), Write(W), 32 bit data bus(Data)
//
//Note that the Word Bank cant read and write at the same time.
//This is because the Output of the data latch is given by Q which travels though just one bus no matter if we are writing or reading.
//One Bus Cant hold 2 values at the same time. But This has to be done outside this module
