// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps
module InstructionMemory(Address, Instruction);
    input wire [31:0] Address;
	output wire [31:0] Instruction;

	parameter MEM_SIZE = 512;
	reg [31:0] data [MEM_SIZE - 1:0];	

	assign Instruction = data[Address[10:2]];
	
	integer i;
	initial begin
		//data[9'd0] <= 32'h20040020;
		data[9'd0] <= 32'h20040074;

		data[9'd1] <= 32'h20050000;
		data[9'd2] <= 32'h20060004;
		data[9'd3] <= 32'h20070190;
		data[9'd4] <= 32'h00865022;
		data[9'd5] <= 32'h20080000;
		data[9'd6] <= 32'h20020000;
		data[9'd7] <= 32'h0148582a;
		data[9'd8] <= 32'h1560000f;
		data[9'd9] <= 32'h20090000;
		data[9'd10] <= 32'h0126582a;
		data[9'd11] <= 32'h11600008;
		data[9'd12] <= 32'h01096020;
		data[9'd13] <= 32'h01856820;
		data[9'd14] <= 32'h81ae0000;
		data[9'd15] <= 32'h01276820;
		data[9'd16] <= 32'h81af0000;
		data[9'd17] <= 32'h15cf0002;
		data[9'd18] <= 32'h21290001;
		data[9'd19] <= 32'h0810000a;
		data[9'd20] <= 32'h15260001;
		data[9'd21] <= 32'h20420001;
		data[9'd22] <= 32'h21080001;
		data[9'd23] <= 32'h08100007;
		data[9'd24] <= 32'h200c4000;
		data[9'd25] <= 32'h000c6400;
		data[9'd26] <= 32'h218c000c;
		data[9'd27] <= 32'had820000;
		data[9'd28] <= 32'h20100000;
		data[9'd29] <= 32'h00104302;
		data[9'd30] <= 32'h31080003;
		data[9'd31] <= 32'h20090000;
		data[9'd32] <= 32'h11090006;
		data[9'd33] <= 32'h21290001;
		data[9'd34] <= 32'h11090007;
		data[9'd35] <= 32'h21290001;
		data[9'd36] <= 32'h11090009;
		data[9'd37] <= 32'h21290001;
		data[9'd38] <= 32'h1109000b;
		data[9'd39] <= 32'h20110100;
		data[9'd40] <= 32'h304a000f;
		data[9'd41] <= 32'h08100035;
		data[9'd42] <= 32'h20110200;
		data[9'd43] <= 32'h304a00f0;
		data[9'd44] <= 32'h000a5102;
		data[9'd45] <= 32'h08100035;
		data[9'd46] <= 32'h20110400;
		data[9'd47] <= 32'h304a0f00;
		data[9'd48] <= 32'h000a5202;
		data[9'd49] <= 32'h08100035;
		data[9'd50] <= 32'h20110800;
		data[9'd51] <= 32'h304af000;
		data[9'd52] <= 32'h000a5042;
		data[9'd53] <= 32'h20090000;
		data[9'd54] <= 32'h1149001e;
		data[9'd55] <= 32'h20090001;
		data[9'd56] <= 32'h1149001e;
		data[9'd57] <= 32'h20090002;
		data[9'd58] <= 32'h1149001e;
		data[9'd59] <= 32'h20090003;
		data[9'd60] <= 32'h1149001e;
		data[9'd61] <= 32'h20090004;
		data[9'd62] <= 32'h1149001e;
		data[9'd63] <= 32'h20090005;
		data[9'd64] <= 32'h1149001e;
		data[9'd65] <= 32'h20090006;
		data[9'd66] <= 32'h1149001e;
		data[9'd67] <= 32'h20090007;
		data[9'd68] <= 32'h1149001e;
		data[9'd69] <= 32'h20090008;
		data[9'd70] <= 32'h1149001e;
		data[9'd71] <= 32'h20090009;
		data[9'd72] <= 32'h1149001e;
		data[9'd73] <= 32'h2009000a;
		data[9'd74] <= 32'h1149001e;
		data[9'd75] <= 32'h2009000b;
		data[9'd76] <= 32'h1149001e;
		data[9'd77] <= 32'h2009000c;
		data[9'd78] <= 32'h1149001e;
		data[9'd79] <= 32'h2009000d;
		data[9'd80] <= 32'h1149001e;
		data[9'd81] <= 32'h2009000e;
		data[9'd82] <= 32'h1149001e;
		data[9'd83] <= 32'h2009000f;
		data[9'd84] <= 32'h1149001e;
		data[9'd85] <= 32'h200b003f;
		data[9'd86] <= 32'h08100074;
		data[9'd87] <= 32'h200b0006;
		data[9'd88] <= 32'h08100074;
		data[9'd89] <= 32'h200b005b;
		data[9'd90] <= 32'h08100074;
		data[9'd91] <= 32'h200b004f;
		data[9'd92] <= 32'h08100074;
		data[9'd93] <= 32'h200b0066;
		data[9'd94] <= 32'h08100074;
		data[9'd95] <= 32'h200b006d;
		data[9'd96] <= 32'h08100074;
		data[9'd97] <= 32'h200b007d;
		data[9'd98] <= 32'h08100074;
		data[9'd99] <= 32'h200b0007;
		data[9'd100] <= 32'h08100074;
		data[9'd101] <= 32'h200b007f;
		data[9'd102] <= 32'h08100074;
		data[9'd103] <= 32'h200b006f;
		data[9'd104] <= 32'h08100074;
		data[9'd105] <= 32'h200b0077;
		data[9'd106] <= 32'h08100074;
		data[9'd107] <= 32'h200b007c;
		data[9'd108] <= 32'h08100074;
		data[9'd109] <= 32'h200b0039;
		data[9'd110] <= 32'h08100074;
		data[9'd111] <= 32'h200b005e;
		data[9'd112] <= 32'h08100074;
		data[9'd113] <= 32'h200b0079;
		data[9'd114] <= 32'h08100074;
		data[9'd115] <= 32'h200b0071;
		data[9'd116] <= 32'h022b9020;
		data[9'd117] <= 32'h200c4000;
		data[9'd118] <= 32'h000c6400;
		data[9'd119] <= 32'h218c0010;
		data[9'd120] <= 32'had920000;
		data[9'd121] <= 32'h22100001;
		data[9'd122] <= 32'h0810001d;
		for (i = 9'd123; i < MEM_SIZE; i = i + 1) begin
         	data[i] <= 0;
        end
	end 

endmodule
