`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 3 (PreLab)
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: 4-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU behaviorally, so that it supports addition,  subtraction,
// AND, OR, and set on less than (SLT). The 'ALUResult' will output the 
// corresponding result of the operation based on the 32-Bit inputs, 'A', and 
// 'B'. The 'Zero' flag is high when 'ALUResult' is '0'. The 'ALUControl' signal 
// should determine the function of the ALU based on the table below:-
// Op   | 'ALUControl' value
// ==========================
// ADD  | 0010
// SUB  | 0110
// AND  | 0000
// OR   | 0001
// SLT  | 0111
//
// NOTE:-
// SLT (i.e., set on less than): ALUResult is '32'h000000001' if A < B.
// 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input   [3:0]   ALUControl; // control bits for ALU operation
	input   [31:0]  A, B;	    // inputs

	integer temp,i,x;
	reg [31:0] y;
	reg sign;
	output  reg [31:0]  ALUResult;	// answer
	output  reg     Zero;	    // Zero=1 if ALUResult == 0

    /* Please fill in the implementation here... */


    always @(ALUControl,A,B)
    begin
		case (ALUControl)
			0: // AND
				ALUResult <= A & B;
			1: // OR
				ALUResult <= A | B;
			2: // ADD
				ALUResult <= A + B;
			6: // SUB
				ALUResult <= A + (~B + 1);
			7: begin // SLT
				if (A[31] != B[31]) begin
					if (A[31] > B[31]) begin
						ALUResult <= 1;
					end else begin
						ALUResult <= 0;
					end
				end else begin
					if (A < B)
					begin
						ALUResult <= 1;
					end
					else
					begin
						ALUResult <= 0;
					end
				end
			end
			3: // NOR
				ALUResult <= ~(A | B);
			8: begin // unoccupied
			end
			9: // MUL
				ALUResult <= A * B;
			10: // SLL
				ALUResult <= A << (B);
			11: begin // SGT - Set Greater Than
				if (A[31] != B[31]) begin
					if (A[31] > B[31]) begin
						ALUResult <= 0;
					end else begin
						ALUResult <= 1;
					end
				end else begin
					if (A <= B)
					begin
						ALUResult <= 0;
					end
					else
					begin
						ALUResult <= 1;
					end
				end
			end
			12: begin // CLO/CLZ
				x = B;
				temp = 32;
				for (i = 31; i >= 0; i = i - 1) begin
						if (A[i] == x) begin
							temp = 31 - i;
							i = -2;
						end
				end
				ALUResult <= temp;
			end
			13: begin // ROTR & SRL
				y = A;
				for (i = B[4:0];i > 0; i = i - 1) begin
					if (B[5] == 1)
						y = {y[0],y[31:1]};
					else
						y = {1'b0,y[31:1]};
				end
				ALUResult <= y;
			end
			4: // XOR
				ALUResult <= A^B;
			14: // SLTU
				ALUResult <= A < B;
			5: begin // Sign Extension
				if (B == 0) begin // Byte	
					if (A[7]==1)
					begin
						ALUResult  <= {24'hffffff , A};
					end
					else 
					begin
						ALUResult <= A;
					end					
				end else if (B == 1) begin // Half word
					if (A[15]==1)
					begin
						ALUResult <= {16'hffff , A};
					end
					else 
					begin
						ALUResult <= A;
					end
				end					
			end
			15: begin // SRA
				y = A;
				for (i = B; i > 0; i = i - 1) begin
					y = {y[31],y[31:1]};
				end
				ALUResult <= y;
			end
		endcase
	end


	always @(ALUResult) begin
		if (ALUResult == 0) begin
			Zero <= 1;
		end else begin
			Zero <= 0;
		end
	
	end

endmodule

