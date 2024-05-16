module Md5ChunkGenerator(
	input wire clk,
   input wire reset,
	output reg [511:0] chunk
);

reg [511:0] chunkInternal = 0;
reg [7:0] paddingOffset = 0;

`define PaddingCondition(__ofs)                                                                               \
    else if (paddingOffset == __ofs && chunkInternal[(__ofs-1)*8+7:(__ofs-1)*8] == 0)                         \
      begin                                                                                                   \
        paddingOffset = __ofs + 1;                                                                            \
        chunkInternal[479:448] = paddingOffset * 8;                                                                   \
      end                                                                                                     \
      
        
        
`define PaddingCase(__ofs) __ofs: chunk[__ofs * 8 + 7 : __ofs * 8] = 'h80;

always @(posedge clk or posedge reset)
   if (reset)
      begin
         chunkInternal = 0;
         paddingOffset = 0;
      end
   else
      begin
        if (paddingOffset == 0) 
          begin
            chunkInternal[479:448] = 8;
           paddingOffset = 1;
         end  	   
       `PaddingCondition(1)
       `PaddingCondition(2)
       `PaddingCondition(3)
       `PaddingCondition(4)
       `PaddingCondition(5)
       `PaddingCondition(6)
       `PaddingCondition(7)
       `PaddingCondition(8)
       `PaddingCondition(9)
       `PaddingCondition(10)
       `PaddingCondition(11)
       `PaddingCondition(12)
       `PaddingCondition(13)
       `PaddingCondition(14)
       `PaddingCondition(15)
       `PaddingCondition(16)
       `PaddingCondition(17)
       `PaddingCondition(18)
       `PaddingCondition(19)
       `PaddingCondition(20)
       `PaddingCondition(21)
       `PaddingCondition(22)
       `PaddingCondition(23)
       `PaddingCondition(24)
       `PaddingCondition(25)
       `PaddingCondition(26)
       `PaddingCondition(27)
       `PaddingCondition(28)
       `PaddingCondition(29)
       `PaddingCondition(30)
       `PaddingCondition(31)
       `PaddingCondition(32)
       
         chunk = chunkInternal;
         case (paddingOffset)
           
       `PaddingCase(1)
       `PaddingCase(2)
       `PaddingCase(3)
       `PaddingCase(4)
       `PaddingCase(5)
       `PaddingCase(6)
       `PaddingCase(7)
       `PaddingCase(8)
       `PaddingCase(9)
       `PaddingCase(10)
       `PaddingCase(11)
       `PaddingCase(12)
       `PaddingCase(13)
       `PaddingCase(14)
       `PaddingCase(15)
       `PaddingCase(16)
       `PaddingCase(17)
       `PaddingCase(18)
       `PaddingCase(19)
       `PaddingCase(20)
       `PaddingCase(21)
       `PaddingCase(22)
       `PaddingCase(23)
       `PaddingCase(24)
       `PaddingCase(25)
       `PaddingCase(26)
       `PaddingCase(27)
       `PaddingCase(28)
       `PaddingCase(29)
       `PaddingCase(30)
       `PaddingCase(31)
       `PaddingCase(32)
         endcase
         chunkInternal = chunkInternal + 1;
      end

endmodule