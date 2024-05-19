// This program was cloned from: https://github.com/chsasank/ARM7
// License: MIT License

//This is shifter module used for data processing instructions and some other instructions

module bshift(instr_bit_25,imm_value, Rm, Rs, operand2, cin, c_to_alu, direct_data, use_shifter);
	parameter n=32;
	input [n-1:0] direct_data;
	input use_shifter;
	input instr_bit_25; // bit no. 25 in the instr
	input [11:0] imm_value; // bits 11-0 in instr
	input [n-1:0] Rm;
	input [n-1:0] Rs;
	output [n-1:0] operand2; // operand 2 for ALU
	input cin;
	output reg c_to_alu;
	
	wire instr_bit_25;
	wire [11:0] imm_value;
	reg [n-1:0] in;
	reg [n-1:0] out;
	reg [7:0] shiftby; // no. bits to be shifted
	reg [n-1:0] junk;
	
	assign operand2 =(use_shifter==1)?out:direct_data ;
	
	always @* begin 
		
		if (instr_bit_25) begin
			// right rotate 32 bit zero extended imm_value[7:0] by 2*(top 4 bits of imm_value)
			in[n-1:8] = 0;
			in[7:0] = imm_value[7:0];
			shiftby[0]=0;
			shiftby[7:4]=4'd0;
			shiftby[4:1] = imm_value[11:8];
			{junk,out} = {in,in} >> shiftby[7:0];
			if(shiftby[7:0]==0) c_to_alu = cin;
			else c_to_alu = out[31];
		end
		
		else begin // 10 cases here.
			// logical shift left by Immediate. This one is for 2 cases.
			if(imm_value[6:4] == 0) begin
				in = Rm;
				{c_to_alu,out} = {cin ,in} << imm_value[11:7];
				// C flag
			end
			// logical shift left by register
			if(imm_value[6:4] == 3'd1) begin
				in = Rm;
				shiftby[7:0] = Rs[7:0];
				{c_to_alu,out} = {cin,in} << shiftby[7:0];
			
			end
			
			// logical shift right by immediate
			if(imm_value[6:4] == 3'd2) begin
				in = Rm;
				{out, c_to_alu} = {in,cin} >> imm_value[11:7];
			
			end
			
			// logical shift right by register
			if(imm_value[6:4] == 3'd3) begin
				in = Rm;
				shiftby[7:0] = Rs[7:0];
				{out, c_to_alu} = {in,cin} >> shiftby[7:0];
			
			end
			
			//Arithmetic shift right by immediate
			if(imm_value[6:4] == 3'd4) begin
				in = Rm;
				//out[7] = in[7]; // preserves sign
				if(in[n-1]){junk,out, c_to_alu} = {32'hFFFFFFFF,in,cin} >> imm_value[11:7];
				else {out, c_to_alu} = {in,cin} >> imm_value[11:7];
			end
			
			//Arithmetic Shift Right by Register
			if(imm_value[6:4] == 3'd5) begin
				in = Rm;
				shiftby[7:0] = Rs[7:0];
				if(in[n-1]) {junk,out, c_to_alu} = {32'hFFFFFFFF,in,cin} >> shiftby[7:0];
				else {out,c_to_alu} = {in,cin} >> shiftby[7:0];
			end
			
			// Rotate Right by immediate
			if((imm_value[6:4] == 3'd6)&&(imm_value[11:7]!=5'd0)) begin
				in = Rm;
				{junk,out,c_to_alu} = {in,in,cin} >> imm_value[11:7];
			end
			
			//Rotate Right by Register
			if(imm_value[6:4] == 3'd7) begin
				in=Rm;
				shiftby[7:0] = Rs[7:0];
				{junk,out,c_to_alu} = {in,in,cin} >> shiftby[4:0]; // [4:0] because.. if input is given as 100 it is enough to shift with 4 .. i.e 100mod 32
			end
			
			// RRX
			
			if((imm_value[6:4] == 3'd6)&&(imm_value[11:7]==5'd0)) begin
				in= Rm;
				{out, c_to_alu} = {cin, in};
			end
		
		end
	end
endmodule 