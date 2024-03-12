`define Offset(__ofs) (__ofs) * 8 + 7 : (__ofs) * 8
`define Byte(__ofs) chunk[`Offset(__ofs)]
`define Padding 'h80

`define Carry(__ofs)                                                                                  \
  if (`Byte((__ofs)) == max + 1)                                                              \
    begin                                                                                             \
      `SetMin(__ofs);                                                                   \
      if (`Byte((__ofs) + 1) == `Padding || `Byte((__ofs) + 1) == 'h00)               \
        begin                                                                                         \
          `SetMin(__ofs + 1);                                                           \
          `SetPaddingAndSize(__ofs + 2);                                                      \
        end                                                                                           \
      else                                                                                            \
        `Increment((__ofs) + 1);                                  \
    end                                                                                               \

`define IsMax(__ofs) (`Byte(__ofs) == max)
`define SetMin(__ofs) `Byte(__ofs) <= min
`define SetPadding(__ofs) `Byte(__ofs) <= `Padding; paddingOffset <= __ofs
`define SetSize(__size) chunk[479:448] <= ((__size) * 8)
`define SetPaddingAndSize(__ofs) `SetPadding(__ofs); `SetSize(__ofs)
`define Increment(__ofs) `Byte(__ofs) <= `Byte(__ofs) + 1

module Md5PrintableChunkGenerator(
	input wire clk,
	input wire reset,
	input wire [7:0] min,
	input wire [7:0] max,
	output reg [511:0] chunk = 0
);

reg [7:0] paddingOffset = 0;

always @(posedge clk or posedge reset)
	begin
		if (reset)
			begin
				chunk <= 0;
				paddingOffset <= 0;
			end
		else
			begin
				if (paddingOffset == 0) 
					begin
						`SetMin(0);
						`SetPaddingAndSize(1);
					end  	      
				else
					begin 
					  
    
    
    
                   if (`IsMax(0))
                     begin
                       `SetMin(0);
                       
                       if (paddingOffset == 0 + 1)
                         begin
                           `SetMin(0 + 1);
                           `SetPaddingAndSize(0 + 2);
                         end
                       else
                         begin
                         
                         if (`IsMax(1))
                           begin
                             `SetMin(1);
                             
                             if (paddingOffset == 1 + 1)
                               begin
                                 `SetMin(1 + 1);
                                 `SetPaddingAndSize(1 + 2);
                               end
                             else
                               begin
                                 
                                 if (`IsMax(2))
                                   begin
                                     `SetMin(2);
                                     
                                     if (paddingOffset == 2 + 1)
                                       begin
                                         `SetMin(2 + 1);
                                         `SetPaddingAndSize(2 + 2);
                                       end
                                     else
                                       begin
                                           
                                           if (`IsMax(3))
                                             begin
                                               `SetMin(3);
                                               
                                               if (paddingOffset == 3 + 1)
                                                 begin
                                                   `SetMin(3 + 1);
                                                   `SetPaddingAndSize(3 + 2);
                                                 end
                                               else
                                                 begin
                                                       
                                                       if (`IsMax(4))
                                                         begin
                                                           `SetMin(4);
                                                           
                                                           if (paddingOffset == 4 + 1)
                                                             begin
                                                               `SetMin(4 + 1);
                                                               `SetPaddingAndSize(4 + 2);
                                                             end
                                                           else
                                                             begin
                                                                     
                                                                     if (`IsMax(5))
                                                                       begin
                                                                         `SetMin(5);
                                                                         
                                                                         if (paddingOffset == 5 + 1)
                                                                           begin
                                                                             `SetMin(5 + 1);
                                                                             `SetPaddingAndSize(5 + 2);
                                                                           end
                                                                         else
                                                                           begin
                                                                                     
                                                                                     if (`IsMax(6))
                                                                                       begin
                                                                                         `SetMin(6);
                                                                                         
                                                                                         if (paddingOffset == 6 + 1)
                                                                                           begin
                                                                                             `SetMin(6 + 1);
                                                                                             `SetPaddingAndSize(6 + 2);
                                                                                           end
                                                                                         else
                                                                                           begin
                                                                                                       
                                                                                                       if (`IsMax(7))
                                                                                                         begin
                                                                                                           `SetMin(7);
                                                                                                           
                                                                                                           if (paddingOffset == 7 + 1)
                                                                                                             begin
                                                                                                               `SetMin(7 + 1);
                                                                                                               `SetPaddingAndSize(7 + 2);
                                                                                                             end
                                                                                                           else
                                                                                                             begin
                                                                                                                           
                                                                                                                           if (`IsMax(8))
                                                                                                                             begin
                                                                                                                               `SetMin(8);
                                                                                                                               
                                                                                                                               if (paddingOffset == 8 + 1)
                                                                                                                                 begin
                                                                                                                                   `SetMin(8 + 1);
                                                                                                                                   `SetPaddingAndSize(8 + 2);
                                                                                                                                 end
                                                                                                                               else
                                                                                                                                 begin
                                                                                                                                                 
                                                                                                                                                 if (`IsMax(9))
                                                                                                                                                   begin
                                                                                                                                                     `SetMin(9);
                                                                                                                                                     
                                                                                                                                                     if (paddingOffset == 9 + 1)
                                                                                                                                                       begin
                                                                                                                                                         `SetMin(9 + 1);
                                                                                                                                                         `SetPaddingAndSize(9 + 2);
                                                                                                                                                       end
                                                                                                                                                     else
                                                                                                                                                       begin
                                                                                                                                                                         
                                                                                                                                                                         if (`IsMax(10))
                                                                                                                                                                           begin
                                                                                                                                                                             `SetMin(10);
                                                                                                                                                                             
                                                                                                                                                                             if (paddingOffset == 10 + 1)
                                                                                                                                                                               begin
                                                                                                                                                                                 `SetMin(10 + 1);
                                                                                                                                                                                 `SetPaddingAndSize(10 + 2);
                                                                                                                                                                               end
                                                                                                                                                                             else
                                                                                                                                                                               begin
                                                                                                                                                                                                   
                                                                                                                                                                                                   if (`IsMax(11))
                                                                                                                                                                                                     begin
                                                                                                                                                                                                       `SetMin(11);
                                                                                                                                                                                                       
                                                                                                                                                                                                       if (paddingOffset == 11 + 1)
                                                                                                                                                                                                         begin
                                                                                                                                                                                                           `SetMin(11 + 1);
                                                                                                                                                                                                           `SetPaddingAndSize(11 + 2);
                                                                                                                                                                                                         end
                                                                                                                                                                                                       else
                                                                                                                                                                                                         begin
                                                                                                                                                                                                                               
                                                                                                                                                                                                                               if (`IsMax(12))
                                                                                                                                                                                                                                 begin
                                                                                                                                                                                                                                   `SetMin(12);
                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                   if (paddingOffset == 12 + 1)
                                                                                                                                                                                                                                     begin
                                                                                                                                                                                                                                       `SetMin(12 + 1);
                                                                                                                                                                                                                                       `SetPaddingAndSize(12 + 2);
                                                                                                                                                                                                                                     end
                                                                                                                                                                                                                                   else
                                                                                                                                                                                                                                     begin
                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                             if (`IsMax(13))
                                                                                                                                                                                                                                                               begin
                                                                                                                                                                                                                                                                 `SetMin(13);
                                                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                 if (paddingOffset == 13 + 1)
                                                                                                                                                                                                                                                                   begin
                                                                                                                                                                                                                                                                     `SetMin(13 + 1);
                                                                                                                                                                                                                                                                     `SetPaddingAndSize(13 + 2);
                                                                                                                                                                                                                                                                   end
                                                                                                                                                                                                                                                                 else
                                                                                                                                                                                                                                                                   begin
                                                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                                             if (`IsMax(14))
                                                                                                                                                                                                                                                                                               begin
                                                                                                                                                                                                                                                                                                 `SetMin(14);
                                                                                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                                                 if (paddingOffset == 14 + 1)
                                                                                                                                                                                                                                                                                                   begin
                                                                                                                                                                                                                                                                                                     `SetMin(14 + 1);
                                                                                                                                                                                                                                                                                                     `SetPaddingAndSize(14 + 2);
                                                                                                                                                                                                                                                                                                   end
                                                                                                                                                                                                                                                                                                 else
                                                                                                                                                                                                                                                                                                   begin
                                                                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                               if (`IsMax(15))
                                                                                                                                                                                                                                                                                                                                 begin
                                                                                                                                                                                                                                                                                                                                   `SetMin(15);
                                                                                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                                   if (paddingOffset == 15 + 1)
                                                                                                                                                                                                                                                                                                                                     begin
                                                                                                                                                                                                                                                                                                                                       `SetMin(15 + 1);
                                                                                                                                                                                                                                                                                                                                       `SetPaddingAndSize(15 + 2);
                                                                                                                                                                                                                                                                                                                                     end
                                                                                                                                                                                                                                                                                                                                   else
                                                                                                                                                                                                                                                                                                                                     begin
                                                                                                                                                                                                                                                                                                                                       chunk <= 0;
                                                                                                                                                                                                                                                                                                                                     end
                                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                 end
                                                                                                                                                                                                                                                                                                                               else
                                                                                                                                                                                                                                                                                                                                 begin
                                                                                                                                                                                                                                                                                                                                   `Increment(15);
                                                                                                                                                                                                                                                                                                                                 end
                                                                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                   end
                                                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                               end
                                                                                                                                                                                                                                                                                             else
                                                                                                                                                                                                                                                                                               begin
                                                                                                                                                                                                                                                                                                 `Increment(14);
                                                                                                                                                                                                                                                                                               end
                                                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                   end
                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                               end
                                                                                                                                                                                                                                                             else
                                                                                                                                                                                                                                                               begin
                                                                                                                                                                                                                                                                 `Increment(13);
                                                                                                                                                                                                                                                               end
                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                     end
                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                 end
                                                                                                                                                                                                                               else
                                                                                                                                                                                                                                 begin
                                                                                                                                                                                                                                   `Increment(12);
                                                                                                                                                                                                                                 end
                                                                                                                                                                                                                               
                                                                                                                                                                                                         end
                                                                                                                                                                                                         
                                                                                                                                                                                                     end
                                                                                                                                                                                                   else
                                                                                                                                                                                                     begin
                                                                                                                                                                                                       `Increment(11);
                                                                                                                                                                                                     end
                                                                                                                                                                                                   
                                                                                                                                                                               end
                                                                                                                                                                               
                                                                                                                                                                           end
                                                                                                                                                                         else
                                                                                                                                                                           begin
                                                                                                                                                                             `Increment(10);
                                                                                                                                                                           end
                                                                                                                                                                         
                                                                                                                                                       end
                                                                                                                                                       
                                                                                                                                                   end
                                                                                                                                                 else
                                                                                                                                                   begin
                                                                                                                                                     `Increment(9);
                                                                                                                                                   end
                                                                                                                                                 
                                                                                                                                 end
                                                                                                                                 
                                                                                                                             end
                                                                                                                           else
                                                                                                                             begin
                                                                                                                               `Increment(8);
                                                                                                                             end
                                                                                                                           
                                                                                                             end
                                                                                                             
                                                                                                         end
                                                                                                       else
                                                                                                         begin
                                                                                                           `Increment(7);
                                                                                                         end
                                                                                                       
                                                                                           end
                                                                                           
                                                                                       end
                                                                                     else
                                                                                       begin
                                                                                         `Increment(6);
                                                                                       end
                                                                                     
                                                                           end
                                                                           
                                                                       end
                                                                     else
                                                                       begin
                                                                         `Increment(5);
                                                                       end
                                                                     
                                                             end
                                                             
                                                         end
                                                       else
                                                         begin
                                                           `Increment(4);
                                                         end
                                                       
                                                 end
                                                 
                                             end
                                           else
                                             begin
                                               `Increment(3);
                                             end
                                           
                                       end
                                       
                                   end
                                 else
                                   begin
                                     `Increment(2);
                                   end
                                 
                               end
                               
                           end
                         else
                           begin
                             `Increment(1);
                           end
                         
                         end
                         
                     end
                   else
                     begin
                       `Increment(0);
                     end
    

      

					end
			end
	end
	
endmodule


