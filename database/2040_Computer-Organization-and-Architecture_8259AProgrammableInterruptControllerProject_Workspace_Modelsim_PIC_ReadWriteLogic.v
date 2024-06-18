// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License


/*
   ReadWriteLogic Module

   This Verilog module represents a basic control logic for handling read and write operations
   with associated control signals. It includes outputs for various command words related to
   interrupt controller configuration.

   Module Ports:
   - Input Ports:
     - Read: Read control signal.
     - Write: Write control signal.
     - A0: Address bit 0.
     - CS: Chip Select control signal.
     - dataBuffer: 8-bit data input.
	 - OCW3_change_ACK
	 -

   - Output Ports:
     - ICW1: Initialization Command Word 1 (8 bits).
     - ICW2: Initialization Command Word 2 (8 bits).
     - ICW3: Initialization Command Word 3 (8 bits).
     - ICW4: Initialization Command Word 4 (8 bits).
     - OCW1: Operation Command Word 1 (8 bits).
     - OCW2: Operation Command Word 2 (8 bits).
     - OCW3: Operation Command Word 3 (8 bits).
     - read_cmd_to_ctrl_logic : command signal for control logic to tell it to active read status from IRR 
       OR ISR registers 
	 - read_cmd_to_ctrl_logic
	 - read_cmd_imr_to_ctrl_logic
	 - OCW3_change
	 - read_flag
	 - write_flag

   Module Behavior:
   - The module is sensitive to the falling edge of the Write control signal.
   - When CS is low, the module performs specific operations based on the control signals.
   - The actual logic for ICWs, OCWs, and other operations are implemented inside the module.

   Usage:
   - Instantiate this module in your design, connecting the required signals.
   
   Author: Ahmed Khaled Abdelmaksod Ebrahim
   Date: 21 DEC 2023
*/

module ReadWriteLogic(
    input Read,								// Input : Read cmd from Processor to read informations from PIC as(Interrupt vector,ISR,IRR,IMR)
    input write,							// INput : Used to enable writing in the internal data buffer  
    input A0,								// Input : Address bit 0 used in determinding the type of input cmd(ICW1,ICW2,ICW3,ICW4,OCW1,OCW2,OCW3) 
    input CS,								// Input : Used to enable the pic to write or read	
    input [7:0]dataBuffer,					// Input : the internal data bus 
    input OCW2_change_ACK,					// Input : used to ack that the flag arrived to reset it again

    output reg write_flag = 1'b0, 			// Output : used to enable data buffer to take data from data bus cpu to release it on the internal bus
    output reg [7:0]ICW1,					// Output : Initialization Command Word 1 (8 bits).				
    output reg [7:0]ICW2,					// Output : Initialization Command Word 2 (8 bits).
    output reg [7:0]ICW3,					// Output : Initialization Command Word 3 (8 bits).
    output reg [7:0]ICW4,					// Output : Initialization Command Word 4 (8 bits).
    output reg [7:0]OCW1 = 8'b0,					// Output : Operation Command Word 1 (8 bits).
    output reg [7:0]OCW2 = 8'b00100000,					// Output : Operation Command Word 2 (8 bits).
    output reg [7:0]OCW3 = 8'b0,					// Output : Operation Command Word 3 (8 bits).
    output reg read_cmd_to_ctrl_logic,		// Output : read cmd to ctrl logic to read ISR or IRR
    output reg read_cmd_imr_to_ctrl_logic, 	// Output : read cmd to ctrl logic to read IMR
    output reg OCW2_change,					// Output : flag to indicate that OCW2 changed
	output reg read_flag=1'b0				// Output : used to enable data buffer to take data from  the internal bus  to release it on data bus cpu 
    
);
reg flag = 0;
reg [2:0]counter = 1;
reg temp=0;
reg writeTemp = 0;
reg readTemp = 0;


/*
    ICW1 -> A0 -> 0 $ D0 -> 1
    ICW2 -> A0 -> 1
	ICW3 -> ICW1[1] = 0

    OSW1 -> A0 -> 1
    OSW2 -> A0 -> 0    D4 -> 0 $ D3 -> 0
    OSW3 -> A0 -> 0    D4 -> 0 $ D3 -> 1
*/


always @(negedge write) begin
    write_flag = 1'b1;
    writeTemp = ~writeTemp;
end

always @(negedge Read) begin
    read_flag = 1'b1;
    readTemp = ~readTemp;
end

// Block used to extract command words from CPU
always @(writeTemp) begin
#1
    if(CS == 1'b0)
    begin
		// ICW1
        if(flag == 0 && A0 == 0 && counter == 1 && dataBuffer[4] == 1 &&temp==0)
        begin
            ICW1 = dataBuffer;
            counter= counter +1;
			flag=0;
			temp=1;
        end
		// ICW2
        if(flag == 0 && A0 == 1 && counter == 2&&temp==0)
        begin
            ICW2 = dataBuffer;
            counter = counter + 1;
            if(ICW1[1] == 1 && ICW1[0] == 0)
            begin
                flag = 1;
            end
            else
            begin
                flag = 0;
            end
			if((ICW1[1] == 1) && (ICW1[0] == 1))
			begin
				counter = 4;
			end
			temp=1;
        end
		// ICW3
        if((counter == 3)&&(flag == 0)&&temp==0)
        begin
            ICW3 = dataBuffer;
            counter = counter + 1;
            if(ICW1[0] == 1)
            begin
                flag = 0;
            end
            else
            begin
                flag = 1;
            end
			temp=1;
        end
        // ICW4
        if((ICW1[0] == 1) &&( counter == 4)&&(flag == 0)&&(A0 == 1)&&temp==0)
        begin
            ICW4 = dataBuffer;
            counter = counter + 1;
            flag = 1;
			temp=1;
        end
		// OCW1
        if((A0 == 1) && (flag == 1)&&temp==0)
        begin
            OCW1 = dataBuffer;
			temp=1;
        end
        // OCW2
        if(A0 == 0 && dataBuffer[4] == 0 && dataBuffer[3] == 0 && flag == 1&&temp==0)
        begin
            OCW2 = dataBuffer;
			temp=1;
        end
		// OCW3
        if(A0 == 0 && dataBuffer[4] == 0 && dataBuffer[3] == 1 && flag == 1&&temp==0)
        begin
            OCW3 = dataBuffer;
        end
		temp = 0;
    end
end
// RD -> 0 && A0 -> 1 // read imr
// block to handle reading operation
always @(readTemp)
begin
    if(CS == 0)
    begin
        if(A0 == 1'b0)
        begin
            read_cmd_to_ctrl_logic <= 1'b1;
            read_cmd_imr_to_ctrl_logic <= 1'b0;
        end
        else
        begin
            read_cmd_to_ctrl_logic <= 1'b0;
            read_cmd_imr_to_ctrl_logic <= 1'b1;
        end
    end
end
// block to reset the write flag
always @(posedge write) begin
    write_flag = 1'b0;
end

// block to reset the read flag
always @(posedge Read)
begin
	read_flag = 1'b0;
    if(CS == 0)
    begin
        read_cmd_to_ctrl_logic <= 1'b0;
        read_cmd_imr_to_ctrl_logic <= 1'b0;
    end
end
/*
always@(write_flag_ACK)
begin
    write_flag <= 1'b0;
end
*/
// block to handle OCW2_Change flag
always @(OCW2) begin
    OCW2_change <=1'b1;
end
// block to reset the OCW2_change flag 
always@(OCW2_change_ACK)begin
    OCW2_change <= 1'b0;
end


endmodule

