`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 3 + Lab 12
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a memory and initilize it by reading from a test data.  
// The 'WriteData' value is written into the address 
// in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData,BHW,ExtendSign); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
	input [1:0] BHW;
    input Clk,ExtendSign;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address

    reg 	[31:0] 	Memory[0:63];	// stack pointer initialization depends on this
      
   		always 	@(posedge Clk)		   //Memory write
   		begin
   		
			if (MemWrite==1) begin
				case (BHW)
					0: begin
						case (Address[1:0])
							0:
								Memory[Address>>2] = {Memory[Address>>2][31:8],WriteData[7:0]};
							1:
								Memory[Address>>2] = {Memory[Address>>2][31:16],WriteData[7:0],Memory[Address>>2][7:0]};
							2:
								Memory[Address>>2] = {Memory[Address>>2][31:24],WriteData[7:0],Memory[Address>>2][15:0]};
							3:
								Memory[Address>>2] = {WriteData[7:0],Memory[Address>>2][23:0]};
						endcase
					end
					1: begin
						case (Address[1])
							0:
								Memory[Address>>2] = {Memory[Address>>2][31:16],WriteData[15:0]};
							1:
								Memory[Address>>2] = {WriteData[15:0],Memory[Address>>2][15:0]};
						endcase
					end
					2: begin
						Memory[Address>>2] = WriteData;
					end
				endcase
   				// Memory[Address>>2] = WriteData;
			end
   		end
   		
   		always @(Address or MemRead)
   		begin	
   			if	(MemRead == 1) begin
				case (BHW)
					0: begin // BYTE
						case (Address[1:0]) // 31:24,23:16,15:8,7:0
							0: begin
								if (ExtendSign && Memory[Address>>2][7])
									ReadData <= {24'hffffff,Memory[Address>>2][7:0]};
								else 
									ReadData <= {24'b0,Memory[Address>>2][7:0]};
							end
							1: begin
								if (ExtendSign && Memory[Address>>2][15])
									ReadData <= {24'hffffff,Memory[Address>>2][15:8]};
								else 
									ReadData <= {24'b0,Memory[Address>>2][15:8]};
							end
							2: begin
								if (ExtendSign && Memory[Address>>2][23])
									ReadData <= {24'hffffff,Memory[Address>>2][23:16]};
								else 
									ReadData <= {24'b0,Memory[Address>>2][23:16]};
							end
							3: begin
								if (ExtendSign && Memory[Address>>2][31])
									ReadData <= {24'hffffff,Memory[Address>>2][31:24]};
								else 
									ReadData <= {24'b0,Memory[Address>>2][31:24]};
							end
						endcase
					end
					1: begin // HALFWORD
						case (Address[1])
							0: begin
								if (ExtendSign && Memory[Address>>2][15])
									ReadData <= {16'hffff,Memory[Address>>2][15:0]};
								else 
									ReadData <= {16'b0,Memory[Address>>2][15:0]};
							end	
							1: begin
								if (ExtendSign && Memory[Address>>2][31])
									ReadData <= {16'hffff,Memory[Address>>2][31:16]};
								else 
									ReadData <= {16'b0,Memory[Address>>2][31:16]};
							end
						endcase
					end
					2: begin // WORD
						ReadData <= Memory[Address>>2];
					end
				endcase
   			end else 
   				ReadData <= 32'h00000000;
					
					//$display("%h",Memory[Address]);
   		end 
   		
			initial begin
				$readmemh("test_data.txt",Memory);
			
			end
            // initialize memory by reading hex values  
   	    // Input file must have the exact name "test_data.txt" with the following format:
            // first line is number of rows for frame data (i)
            // second line is number of columns for frame data (j)
            // third line is number of rows for window data (k)
            // fourth line is number of columns for window data (l)
            // followed by i*j number of pixel values for frame data
            // followed by k*l number of pixel values for window data
		//
            // Notes: 
            // 1-make sure to adjust the "Memory" size based on your test input
            //   for 16x16 and 8x8 test case your memory  will have 4 values for size 
            //   information, 256 for frame, 64 for window (total of 324). 
            //   Memory[0:323]
            // 2-watch out for wild characters at the end of the last entry in your test file

            // insert your code here for reading from test data ! Be careful, this step is done only once 
            // right before starting the vbsme code. 
            
                        
	    		

endmodule