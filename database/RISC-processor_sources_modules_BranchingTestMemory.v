`timescale 1ns/1ps
module BranchingTestMemory
  #(
    parameter DisplayBufferSize = 256 
    )(
      input wire 			  clk,
  
      input wire [31:0] 		  InstAdd, // Address to fetch instruction from
      input wire [31:0] 		  DataAdd, // Address to fetch data from
      input wire [31:0] 		  MemDataContent,
  
      input wire 			  DataReadEn, // Enables output from memory
      input wire 			  DataWriteEn, // Enables writing to memory at end of cur. cycle

      input wire 			  MEMTYPE, // Enables writing to memory at end of cur. cycle
  
      output reg [31:0] 		  MemDataOut, // Data from memory
      output reg [31:0] 		  MemInstOut,// Instruction from memory	
      output wire [DisplayBufferSize-1:0] DisplayBuffer
      );
   
   reg [31:0] 				  mem [10230:0];
   reg [7:0] 				  dispMem [DisplayBufferSize/8:0];
   
   
   genvar 				  i;
   generate
       for (i = 0; i < DisplayBufferSize/8; i = i + 1) begin
	   assign DisplayBuffer[(i+1)*8 - 1 : i*8] = dispMem[DisplayBufferSize/8-i-1][7:0];
       end
   endgenerate
   
   initial begin
       mem[0] = 32'h77df000a;
       mem[1] = 32'h77ff0003;
       mem[2] = 32'h6ffe0000;
       mem[3] = 32'hc3e00000;
       mem[4] = 32'h77fffffe;
       mem[5] = 32'hd01e0004;
       mem[6] = 32'h77e00002;
       mem[7] = 32'h801ef800;
       mem[8] = 32'h77fffffa;
       mem[9] = 32'hc0210001;
       mem[10] = 32'h6ffe0000;
       mem[11] = 32'h781ffff7;
       mem[12] = 32'hd01f0000;
       mem[13] = 32'h7400fff5;
       mem[14] = 32'hd81f0000;
       mem[15] = 32'h7400fff3;
       mem[16] = 32'hd41f0001;
       mem[17] = 32'h7400fff1;
       mem[18] = 32'hd01fffff;
       mem[19] = 32'h7800ffef;
       mem[20] = 32'hd81fffff;
       mem[21] = 32'h7800ffed;
       mem[22] = 32'hd41fffff;
       mem[23] = 32'h7800ffeb;
       mem[24] = 32'hc03f0001;
       mem[25] = 32'hf021001f;
       mem[26] = 32'hc4410001;
       mem[27] = 32'ha4611000;
       mem[28] = 32'hd063ffff;
       mem[29] = 32'h7403ffe5;
       mem[30] = 32'h98611000;
       mem[31] = 32'h7403ffe3;
       mem[32] = 32'h98620800;
       mem[33] = 32'h7803ffe1;
       mem[34] = 32'h801ff800;
       mem[35] = 32'h7800ffdf;
       mem[36] = 32'hc01f0000;
       mem[37] = 32'h7800ffdd;
       mem[38] = 32'hc01f0000;
       mem[39] = 32'hc03f0001;
       mem[40] = 32'hc05f0002;
       mem[41] = 32'hc07f0003;
       mem[42] = 32'hc09f0004;
       mem[43] = 32'hc0bf0005;
       mem[44] = 32'hc0df0006;
       mem[45] = 32'hc0ff0007;
       mem[46] = 32'hc11f0008;
       mem[47] = 32'hc13f0009;
       mem[48] = 32'hc15f000a;
       mem[49] = 32'hc17f000b;
       mem[50] = 32'hc19f000c;
       mem[51] = 32'hc1bf000d;
       mem[52] = 32'hc1df000e;
       mem[53] = 32'hc1ff000f;
       mem[54] = 32'hc21f0010;
       mem[55] = 32'hc23f0011;
       mem[56] = 32'hc25f0012;
       mem[57] = 32'hc27f0013;
       mem[58] = 32'hc29f0014;
       mem[59] = 32'hc2bf0015;
       mem[60] = 32'hc2df0016;
       mem[61] = 32'hc2ff0017;
       mem[62] = 32'hc31f0018;
       mem[63] = 32'hc33f0019;
       mem[64] = 32'hc35f001a;
       mem[65] = 32'hc37f001b;
       mem[66] = 32'hc39f001c;
       mem[67] = 32'hc3bf001d;
       mem[68] = 32'hc3df001e;
       mem[69] = 32'hc3ff001f;
       mem[70] = 32'hd0000000;
       mem[71] = 32'h7400ffbb;
       mem[72] = 32'hd0010001;
       mem[73] = 32'h7400ffb9;
       mem[74] = 32'hd0020002;
       mem[75] = 32'h7400ffb7;
       mem[76] = 32'hd0030003;
       mem[77] = 32'h7400ffb5;
       mem[78] = 32'hd0040004;
       mem[79] = 32'h7400ffb3;
       mem[80] = 32'hd0050005;
       mem[81] = 32'h7400ffb1;
       mem[82] = 32'hd0060006;
       mem[83] = 32'h7400ffaf;
       mem[84] = 32'hd0070007;
       mem[85] = 32'h7400ffad;
       mem[86] = 32'hd0080008;
       mem[87] = 32'h7400ffab;
       mem[88] = 32'hd0090009;
       mem[89] = 32'h7400ffa9;
       mem[90] = 32'hd00a000a;
       mem[91] = 32'h7400ffa7;
       mem[92] = 32'hd00b000b;
       mem[93] = 32'h7400ffa5;
       mem[94] = 32'hd00c000c;
       mem[95] = 32'h7400ffa3;
       mem[96] = 32'hd00d000d;
       mem[97] = 32'h7400ffa1;
       mem[98] = 32'hd00e000e;
       mem[99] = 32'h7400ff9f;
       mem[100] = 32'hd00f000f;
       mem[101] = 32'h7400ff9d;
       mem[102] = 32'hd0100010;
       mem[103] = 32'h7400ff9b;
       mem[104] = 32'hd0110011;
       mem[105] = 32'h7400ff99;
       mem[106] = 32'hd0120012;
       mem[107] = 32'h7400ff97;
       mem[108] = 32'hd0130013;
       mem[109] = 32'h7400ff95;
       mem[110] = 32'hd0140014;
       mem[111] = 32'h7400ff93;
       mem[112] = 32'hd0150015;
       mem[113] = 32'h7400ff91;
       mem[114] = 32'hd0160016;
       mem[115] = 32'h7400ff8f;
       mem[116] = 32'hd0170017;
       mem[117] = 32'h7400ff8d;
       mem[118] = 32'hd0180018;
       mem[119] = 32'h7400ff8b;
       mem[120] = 32'hd0190019;
       mem[121] = 32'h7400ff89;
       mem[122] = 32'hd01a001a;
       mem[123] = 32'h7400ff87;
       mem[124] = 32'hd01b001b;
       mem[125] = 32'h7400ff85;
       mem[126] = 32'hd01c001c;
       mem[127] = 32'h7400ff83;
       mem[128] = 32'hd01d001d;
       mem[129] = 32'h7400ff81;
       mem[130] = 32'hd01e001e;
       mem[131] = 32'h7400ff7f;
       mem[132] = 32'h781fff7e;
       mem[133] = 32'hc23f0228;
       mem[134] = 32'hf021001f;
       mem[135] = 32'ha6218800;
       mem[136] = 32'h6f910000;
       mem[137] = 32'h741fff79;
       mem[138] = 32'hf39c0001;
       mem[139] = 32'hf79c0001;
       mem[140] = 32'hd2fc0224;
       mem[141] = 32'h7417ff75;
       mem[142] = 32'h7f000064;
       mem[143] = 32'h7f200064;
       mem[144] = 32'h8358c800;
       mem[145] = 32'hd37affff;
       mem[146] = 32'h741bff70;
       mem[147] = 32'h8358c000;
       mem[148] = 32'h875ac800;
       mem[149] = 32'hd37affff;
       mem[150] = 32'h741bff6c;
       mem[151] = 32'h8359c800;
       mem[152] = 32'h875ac000;
       mem[153] = 32'h781aff69;
       mem[154] = 32'hc23f0001;
       mem[155] = 32'hc6510001;
       mem[156] = 32'h7812ff66;
       mem[157] = 32'hc17f0f0f;
       mem[158] = 32'hc19f7f00;
       mem[159] = 32'ha1ab6000;
       mem[160] = 32'hd1cd0f00;
       mem[161] = 32'h740eff61;
       mem[162] = 32'ha5ab6000;
       mem[163] = 32'hd1cd7f0f;
       mem[164] = 32'h740eff5e;
       mem[165] = 32'ha9ab6000;
       mem[166] = 32'hd1cd700f;
       mem[167] = 32'h740eff5b;
       mem[168] = 32'hc37f0001;
       mem[169] = 32'hf39b0020;
       mem[170] = 32'hd3bc0001;
       mem[171] = 32'h741dff57;
       mem[172] = 32'hf39b001f;
       mem[173] = 32'hfb5c0011;
       mem[174] = 32'hd33ac000;
       mem[175] = 32'h7419ff53;
       mem[176] = 32'hf75c0011;
       mem[177] = 32'hd33a4000;
       mem[178] = 32'h7419ff50;
       mem[179] = 32'hc3df0000;
       mem[180] = 32'hc03f0000;
       mem[181] = 32'h20000000;
       mem[182] = 32'hf3de0001;
       mem[183] = 32'hf7de0001;
       mem[184] = 32'hd01e02d8;
       mem[185] = 32'h7400ff49;
       mem[186] = 32'h68000000;
       mem[187] = 32'h70000000;
       mem[188] = 32'h9c000000;
       mem[189] = 32'hac000000;
       mem[190] = 32'hbc000000;
       mem[191] = 32'hdc000000;
       mem[192] = 32'hec000000;
       mem[193] = 32'hfc000000;
       mem[194] = 32'hd0010009;
       mem[195] = 32'h7400ff3f;
       mem[196] = 32'hc09f03d4;
       mem[197] = 32'h7d20002d;
       mem[198] = 32'he809ffff;
       mem[199] = 32'h64040000;
       mem[200] = 32'h641f03d8;
       mem[201] = 32'h64040008;
       mem[202] = 32'h641f03e0;
       mem[203] = 32'h60c40000;
       mem[204] = 32'h7ca00027;
       mem[205] = 32'h90062800;
       mem[206] = 32'h7400ff34;
       mem[207] = 32'h60ff03d8;
       mem[208] = 32'h90072800;
       mem[209] = 32'h7400ff31;
       mem[210] = 32'h61040008;
       mem[211] = 32'h90082800;
       mem[212] = 32'h7400ff2e;
       mem[213] = 32'h613f03e0;
       mem[214] = 32'h90092800;
       mem[215] = 32'h7400ff2b;
       mem[216] = 32'h801fa000;
       mem[217] = 32'h80200000;
       mem[218] = 32'h80400000;
       mem[219] = 32'h80600000;
       mem[220] = 32'h80800000;
       mem[221] = 32'h80a11000;
       mem[222] = 32'h80a32800;
       mem[223] = 32'h80a42800;
       mem[224] = 32'hd00500a0;
       mem[225] = 32'h7400ff21;
       mem[226] = 32'h781f0000;
       mem[227] = 32'h80200000;
       mem[228] = 32'h80400000;
       mem[229] = 32'h80600000;
       mem[230] = 32'h80800000;
       mem[231] = 32'h80a11000;
       mem[232] = 32'h80a32800;
       mem[233] = 32'h80a42800;
       mem[234] = 32'hd0051c60;
       mem[235] = 32'h7400ff17;
       mem[236] = 32'hc01f03b8;
       mem[237] = 32'h6fe00000;
       mem[238] = 32'h741fff14;
       mem[239] = 32'hd01e03bc;
       mem[240] = 32'h7400ff12;
       mem[241] = 32'hc3ff0000;
       mem[242] = 32'h77fffffe;
       mem[243] = 32'haaaaaaaa;
       mem[244] = 32'h55555555;
       mem[245] = 32'h00000000;
       mem[246] = 32'h00000000;
       mem[247] = 32'h00000000;
       mem[248] = 32'h00000000;
       mem[249] = 32'hffffffff;
       mem[250] = 32'hffffffff;
       mem[251] = 32'hffffffff;
       
   end
   
   
   always @(posedge clk) begin
       //#1
       if (DataWriteEn) begin
           if (MEMTYPE) begin
               dispMem[DataAdd] = MemDataContent;

           end else begin
               mem[DataAdd/4] = MemDataContent;
               
           end
       end
   end

   always @(mem, DataAdd, InstAdd, MEMTYPE) begin
       //#2
       MemInstOut = mem[InstAdd/4];

       if (MEMTYPE) begin
           MemDataOut = dispMem[DataAdd];       
       end else begin
           MemDataOut = mem[DataAdd/4];
       end
   end
endmodule // BasicTestMemory

