// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns/1ps
module BasicTestMemory
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
      output reg [31:0] 		  MemInstOut, // Instruction from memory	
      output wire [DisplayBufferSize-1:0] DisplayBuffer
      ); 

   reg [31:0] 				  mem [1023:0];
   reg [7:0] 				  dispMem [DisplayBufferSize/8:0];

   
   genvar 				  i;
   generate
       for (i = 0; i < DisplayBufferSize/8; i = i + 1) begin
	   assign DisplayBuffer[(i+1)*8 - 1 : i*8] = dispMem[DisplayBufferSize/8-i-1][7:0];
       end
   endgenerate

   initial begin
       mem[0] = 32'ha01ff800;
       mem[1] = 32'h903ff800;
       mem[2] = 32'h80410800;
       mem[3] = 32'ha4620800;
       mem[4] = 32'hb0811000;
       mem[5] = 32'hb0000800;
       mem[6] = 32'ha8000800;
       mem[7] = 32'hb0000800;
       mem[8] = 32'ha8001000;
       mem[9] = 32'hb0000800;
       mem[10] = 32'ha8001800;
       mem[11] = 32'hb0000800;
       mem[12] = 32'ha8002000;
       mem[13] = 32'h641f03fc;
       mem[14] = 32'ha8a40800;
       mem[15] = 32'hb0c30800;
       mem[16] = 32'ha4e22800;
       mem[17] = 32'hb1011800;
       mem[18] = 32'h81252800;
       mem[19] = 32'h85290800;
       mem[20] = 32'h81433800;
       mem[21] = 32'ha5681800;
       mem[22] = 32'hb1865000;
       mem[23] = 32'hb58c4800;
       mem[24] = 32'hb0000800;
       mem[25] = 32'ha8002800;
       mem[26] = 32'hb0000800;
       mem[27] = 32'ha8003000;
       mem[28] = 32'hb0000800;
       mem[29] = 32'ha8003800;
       mem[30] = 32'hb0000800;
       mem[31] = 32'ha8004000;
       mem[32] = 32'hb0000800;
       mem[33] = 32'ha8004800;
       mem[34] = 32'hb0000800;
       mem[35] = 32'ha8005000;
       mem[36] = 32'hb0000800;
       mem[37] = 32'ha8005800;
       mem[38] = 32'hb0000800;
       mem[39] = 32'ha8006000;
       mem[40] = 32'h641f03fc;
       mem[41] = 32'h81a73000;
       mem[42] = 32'h81c92800;
       mem[43] = 32'ha9ea2800;
       mem[44] = 32'haa0f3800;
       mem[45] = 32'h82108000;
       mem[46] = 32'h82246800;
       mem[47] = 32'h824f7800;
       mem[48] = 32'h86526000;
       mem[49] = 32'ha6720800;
       mem[50] = 32'h96919000;
       mem[51] = 32'h8293a000;
       mem[52] = 32'hb0000800;
       mem[53] = 32'ha8006800;
       mem[54] = 32'hb0000800;
       mem[55] = 32'ha8007000;
       mem[56] = 32'hb0000800;
       mem[57] = 32'ha8007800;
       mem[58] = 32'hb0000800;
       mem[59] = 32'ha8008000;
       mem[60] = 32'hb0000800;
       mem[61] = 32'ha8008800;
       mem[62] = 32'hb0000800;
       mem[63] = 32'ha8009000;
       mem[64] = 32'hb0000800;
       mem[65] = 32'ha8009800;
       mem[66] = 32'hb0000800;
       mem[67] = 32'ha800a000;
       mem[68] = 32'h641f03fc;
       mem[69] = 32'hb2b0a000;
       mem[70] = 32'hb2b53800;
       mem[71] = 32'hbab5a000;
       mem[72] = 32'hbab54800;
       mem[73] = 32'h86b1a800;
       mem[74] = 32'h9ad3a000;
       mem[75] = 32'h82d6a800;
       mem[76] = 32'ha6f41800;
       mem[77] = 32'hb3061000;
       mem[78] = 32'hb3251800;
       mem[79] = 32'h87397800;
       mem[80] = 32'h8744c000;
       mem[81] = 32'h8746d000;
       mem[82] = 32'h836e6800;
       mem[83] = 32'hb39bd800;
       mem[84] = 32'hb79cd800;
       mem[85] = 32'h8381e000;
       mem[86] = 32'hb3afb800;
       mem[87] = 32'hbbbdb800;
       mem[88] = 32'h83bd7000;
       mem[89] = 32'ha3dde000;
       mem[90] = 32'habde1000;
       mem[91] = 32'hb0000800;
       mem[92] = 32'ha800a800;
       mem[93] = 32'hb0000800;
       mem[94] = 32'ha800b000;
       mem[95] = 32'hb0000800;
       mem[96] = 32'ha800b800;
       mem[97] = 32'hb0000800;
       mem[98] = 32'ha800c000;
       mem[99] = 32'hb0000800;
       mem[100] = 32'ha800c800;
       mem[101] = 32'hb0000800;
       mem[102] = 32'ha800d000;
       mem[103] = 32'hb0000800;
       mem[104] = 32'ha800d800;
       mem[105] = 32'hb0000800;
       mem[106] = 32'ha800e000;
       mem[107] = 32'hb0000800;
       mem[108] = 32'ha800e800;
       mem[109] = 32'hb0000800;
       mem[110] = 32'ha800f000;
       mem[111] = 32'h641f03fc;
       mem[112] = 32'he43f0003;
       mem[113] = 32'he8410004;
       mem[114] = 32'he462ffff;
       mem[115] = 32'he063000f;
       mem[116] = 32'hc0830010;
       mem[117] = 32'hb0000800;
       mem[118] = 32'ha8000800;
       mem[119] = 32'hb0000800;
       mem[120] = 32'ha8001000;
       mem[121] = 32'hb0000800;
       mem[122] = 32'ha8001800;
       mem[123] = 32'hb0000800;
       mem[124] = 32'ha8002000;
       mem[125] = 32'h641f03fc;
       mem[126] = 32'hc4a4ffe0;
       mem[127] = 32'hd0c5003f;
       mem[128] = 32'hc0c6007e;
       mem[129] = 32'hd4e60080;
       mem[130] = 32'hc4e7ff02;
       mem[131] = 32'hd91f0007;
       mem[132] = 32'he50801fe;
       mem[133] = 32'hd12801fe;
       mem[134] = 32'hc12903ff;
       mem[135] = 32'hd54903fe;
       mem[136] = 32'he94a07ff;
       mem[137] = 32'hd96a07fe;
       mem[138] = 32'he96b0fff;
       mem[139] = 32'hf18b0001;
       mem[140] = 32'he98c0001;
       mem[141] = 32'hb0000800;
       mem[142] = 32'ha8002800;
       mem[143] = 32'hb0000800;
       mem[144] = 32'ha8003000;
       mem[145] = 32'hb0000800;
       mem[146] = 32'ha8003800;
       mem[147] = 32'hb0000800;
       mem[148] = 32'ha8004000;
       mem[149] = 32'hb0000800;
       mem[150] = 32'ha8004800;
       mem[151] = 32'hb0000800;
       mem[152] = 32'ha8005000;
       mem[153] = 32'hb0000800;
       mem[154] = 32'ha8005800;
       mem[155] = 32'hb0000800;
       mem[156] = 32'ha8006000;
       mem[157] = 32'h641f03fc;
       mem[158] = 32'hc1bfffff;
       mem[159] = 32'hf5ad0012;
       mem[160] = 32'hc1cd4000;
       mem[161] = 32'hc1ee0001;
       mem[162] = 32'hc1ef7fff;
       mem[163] = 32'hc21fffff;
       mem[164] = 32'hf610000f;
       mem[165] = 32'hc63f4000;
       mem[166] = 32'hf631000e;
       mem[167] = 32'hf2510001;
       mem[168] = 32'hc2520001;
       mem[169] = 32'hf2720001;
       mem[170] = 32'hc2730001;
       mem[171] = 32'hb0000800;
       mem[172] = 32'ha8006800;
       mem[173] = 32'hb0000800;
       mem[174] = 32'ha8007000;
       mem[175] = 32'hb0000800;
       mem[176] = 32'ha8007800;
       mem[177] = 32'hb0000800;
       mem[178] = 32'ha8008000;
       mem[179] = 32'hb0000800;
       mem[180] = 32'ha8008800;
       mem[181] = 32'hb0000800;
       mem[182] = 32'ha8009000;
       mem[183] = 32'hb0000800;
       mem[184] = 32'ha8009800;
       mem[185] = 32'hb0000800;
       mem[186] = 32'ha800a000;
       mem[187] = 32'h641f03fc;
       mem[188] = 32'hc69f0001;
       mem[189] = 32'hfa94001f;
       mem[190] = 32'hf694000b;
       mem[191] = 32'hfab4000c;
       mem[192] = 32'hf2b5000d;
       mem[193] = 32'hc2b51fff;
       mem[194] = 32'he2d5ffff;
       mem[195] = 32'hf2d60001;
       mem[196] = 32'hc2d60001;
       mem[197] = 32'hf2f60001;
       mem[198] = 32'hc6f7ffff;
       mem[199] = 32'he71f03ff;
       mem[200] = 32'hf318000f;
       mem[201] = 32'heb187fff;
       mem[202] = 32'hc73f0001;
       mem[203] = 32'hf7390006;
       mem[204] = 32'hc75f0001;
       mem[205] = 32'hf75a0005;
       mem[206] = 32'hc77f0001;
       mem[207] = 32'hf77b0004;
       mem[208] = 32'hc79f0001;
       mem[209] = 32'hf79c0003;
       mem[210] = 32'hc7bf0001;
       mem[211] = 32'hf7bd0002;
       mem[212] = 32'hc7df0001;
       mem[213] = 32'hf7de0001;
       mem[214] = 32'hb0000800;
       mem[215] = 32'ha800a800;
       mem[216] = 32'hb0000800;
       mem[217] = 32'ha800b000;
       mem[218] = 32'hb0000800;
       mem[219] = 32'ha800b800;
       mem[220] = 32'hb0000800;
       mem[221] = 32'ha800c000;
       mem[222] = 32'hb0000800;
       mem[223] = 32'ha800c800;
       mem[224] = 32'hb0000800;
       mem[225] = 32'ha800d000;
       mem[226] = 32'hb0000800;
       mem[227] = 32'ha800d800;
       mem[228] = 32'hb0000800;
       mem[229] = 32'ha800e000;
       mem[230] = 32'hb0000800;
       mem[231] = 32'ha800e800;
       mem[232] = 32'hb0000800;
       mem[233] = 32'ha800f000;
       mem[234] = 32'h641f03fc;
       mem[235] = 32'h605f0000;
       mem[236] = 32'hb0000800;
       mem[237] = 32'ha8001000;
       mem[238] = 32'h60610005;
       mem[239] = 32'hb0000800;
       mem[240] = 32'ha8001800;
       mem[241] = 32'h641f03fc;
       mem[242] = 32'h83fff800;
       mem[243] = 32'h83fff800;
       mem[244] = 32'h83fff800;
       mem[245] = 32'h83fff800;
       mem[246] = 32'h83fff800;
       mem[247] = 32'h83fff800;
       mem[248] = 32'h83fff800;
       mem[249] = 32'h83fff800;
       mem[250] = 32'h83fff800;
       mem[251] = 32'h83fff800;
       mem[252] = 32'hffffffff;
       mem[253] = 32'hffffffff;
       mem[254] = 32'hffffffff;
       mem[255] = 32'hffffffff;
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

