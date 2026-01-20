# My 8-Bit CPU Project

I built this 8-bit CPU in Logisim to learn how a computer actually processes data. I started by making an ALU and a Register File, and then I added a Program Counter and a ROM to automate the instructions.

## How I Connected It

I wired the components so that data flows in a loop through the system:

* **Program Counter (PC):** I connected this to the Address input of the ROM. It tells the ROM which line of code to read.
* **ROM:** I used a 256x24 bit ROM. It stores the 24-bit binary instructions I wrote.
* **Splitter:** I attached this to the Data output of the ROM. It breaks the 24 bits into smaller groups of wires that go to the control pins of the ALU and Register File.
* **ALU and Register File:** I connected the ALU output directly back into the Register File data input. This lets the result of a math operation get saved into a register immediately.

### 8-bit Data Path Loop
I created a feedback loop between the storage and the math unit so the CPU can process data continuously:
* **Reading:** The Registers send two 8-bit values to the ALU based on the addresses from the ROM.
* **Processing:** The ALU performs the math operation on those two numbers.
* **Saving:** The output of the ALU is wired directly back into the Register data input so the result is saved on the same clock tick.

<img width="669" height="276" alt="Data path" src="https://github.com/user-attachments/assets/f79880aa-f73b-45bf-8b89-717af54d1e79" />


### CPU Core Overview
<img width="1082" height="595" alt="cpu core" src="https://github.com/user-attachments/assets/0bfe2c67-6f80-4d7e-b419-4042f122b05e" />

## Instruction Layout

I used a 24-bit instruction format to control all the pins at once:

* **Bits 0–2:** ALU OpCode (tells the ALU to add, subtract, etc.).
* **Bits 3–4:** Read Address A (chooses the first register to read).
* **Bits 5–6:** Read Address B (chooses the second register to read).
* **Bits 7–8:** Write Address (chooses which register to save the result in).
* **Bit 9:** Write Enable (turns on the "save" function for the registers).
* **Bit 10:** Jump Enable (tells the PC to skip to a new address).
* **Bits 11–18:** Jump Address (the actual address the PC jumps to).
* **Bits 19–23:** Unused (Reserved for future hardware).

## Challenges Faced

* **ROM Size:** I had to decide on the right ROM dimensions. I chose 24 bits wide and specifically did not go with 16 bits. 16 bits was too small to fit all the control signals for my ALU and registers while still having enough room for a full 8-bit Jump Address.
* **PC Design:** I needed a counter that could increment every time the clock ticked to keep the program moving. I tried designing this using shift registers, but that design did not work for a CPU. I needed a way to add 1 to the address and jump to new locations instantly. I ended up using a Standard Register with an Adder instead.

### PC (Program Counter)
<img width="723" height="220" alt="PC" src="https://github.com/user-attachments/assets/2e55d601-3f70-475a-8ca0-dad8623aa736" />

### ALU and Registers
<img width="1365" height="695" alt="ALU" src="https://github.com/user-attachments/assets/40876faf-41b1-4e13-95c1-f5d5af1c4f42" />

<img width="992" height="476" alt="REGISTER" src="https://github.com/user-attachments/assets/14db6931-bd1e-4e22-8cc1-2d0ec34bb774" />


## Future Plans

**Conditional Jumps:** I am going to add an "IF" condition logic gate. This will make it so the CPU only jumps if a certain condition is met (like the ALU result being zero) instead of jumping every time.
* **Data Memory:** I plan to add a RAM module so the CPU can store a lot more data than the four registers currently allow.
