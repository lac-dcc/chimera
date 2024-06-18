// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

module InstructionMemory
(
	input [63:0] programCounter,
	output reg [31:0] CPU_Instruction
);

	reg [8:0] instructionMemoryData[63:0];

	initial begin
		// Test for datapath
		// LDUR X10, [X1,#40]
		instructionMemoryData[0] = 'b11111000;
		instructionMemoryData[1] = 'b01000010;
		instructionMemoryData[2] = 'b10000000;
		instructionMemoryData[3] = 'b00101010;

		//SUB X11, X2, X3
		instructionMemoryData[4] = 'b11001011;
		instructionMemoryData[5] = 'b00000011;
		instructionMemoryData[6] = 'b00000000;
		instructionMemoryData[7] = 'b01001011;

		// ADD X12, X3, X4
		instructionMemoryData[8] = 'b10001011;
		instructionMemoryData[9] = 'b00000100;
		instructionMemoryData[10] = 'b00000000;
		instructionMemoryData[11] = 'b01101100;

		//LDUR X13, [X1,#48]
		instructionMemoryData[12] = 'b11111000;
		instructionMemoryData[13] = 'b01000011;
		instructionMemoryData[14] = 'b00000000;
		instructionMemoryData[15] = 'b00101101;

		//ADD X14, X5, X6
		instructionMemoryData[16] = 'b10001011;
		instructionMemoryData[17] = 'b00000110;
		instructionMemoryData[18] = 'b00000000;
		instructionMemoryData[19] = 'b10101110;
		
		
		
		// Test for Forwarding unit
		// SUB X2, X1,X3
		instructionMemoryData[20] = 8'hcb;
		instructionMemoryData[21] = 8'h03;
		instructionMemoryData[22] = 8'h00;
		instructionMemoryData[23] = 8'h22;

		// AND X12,X2,X5
		instructionMemoryData[24] = 8'h8a;
		instructionMemoryData[25] = 8'h05;
		instructionMemoryData[26] = 8'h00;
		instructionMemoryData[27] = 8'h4c;

		// ORR X13, X6, X2
		instructionMemoryData[28] = 8'haa;
		instructionMemoryData[29] = 8'h02;
		instructionMemoryData[30] = 8'h00;
		instructionMemoryData[31] = 8'hcd;

		//ADD X14, X2, X2
		instructionMemoryData[32] = 8'h8b;
		instructionMemoryData[33] = 8'h02;
		instructionMemoryData[34] = 8'h00;
		instructionMemoryData[35] = 8'h4e;

		//STUR X15, [X2,#100]
		instructionMemoryData[36] = 8'hf8;
		instructionMemoryData[37] = 8'h06;
		instructionMemoryData[38] = 8'h40;
		instructionMemoryData[39] = 8'h4f;
		
		
		
		//Test for Hazard Detection	
		//SUB X2, X1, X3
		instructionMemoryData[40] = 8'hcb;
		instructionMemoryData[41] = 8'h03;
		instructionMemoryData[42] = 8'h00;
		instructionMemoryData[43] = 8'h22;

		// AND X4, X2, X5
		instructionMemoryData[44] = 8'h8a;
		instructionMemoryData[45] = 8'h05;
		instructionMemoryData[46] = 8'h00;
		instructionMemoryData[47] = 8'h44;

		// ORR X8, X2, X6
		instructionMemoryData[48] = 8'haa;
		instructionMemoryData[49] = 8'h06;
		instructionMemoryData[50] = 8'h00;
		instructionMemoryData[51] = 8'h48;

		// ADD X9, X4, X2
		instructionMemoryData[52] = 8'h8b;
		instructionMemoryData[53] = 8'h02;
		instructionMemoryData[54] = 8'h00;
		instructionMemoryData[55] = 8'h89;

		// SUB X1, X6, X7
		instructionMemoryData[56] = 8'hcb;
		instructionMemoryData[57] = 8'h07;
		instructionMemoryData[58] = 8'h00;
		instructionMemoryData[59] = 8'hc1;		
	end

	always @(programCounter) begin
		CPU_Instruction[8:0] = instructionMemoryData[programCounter+3];
		CPU_Instruction[16:8] = instructionMemoryData[programCounter+2];
		CPU_Instruction[24:16] = instructionMemoryData[programCounter+1];
		CPU_Instruction[31:24] = instructionMemoryData[programCounter];
	end
endmodule
