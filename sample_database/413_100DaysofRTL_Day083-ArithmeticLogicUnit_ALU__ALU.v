// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module ALU(
		input [7:0] a,b,
		input [3:0] sel,
		output reg [15:0] result,
		output reg e_bit
		);

always@(*)
begin
	case(sel)
	
	4'b0000: begin   {e_bit,result}<= a+b;       $display("1-Addition operation");        end
	
	4'b0001: begin   {e_bit,result}<= a-b;       $display("2-Subtraction operation");     end
	
	4'b0010: begin   result<= a*b;               $display("3-Multiplication operation");  end
	
	4'b0011: begin   result<= a/b;               $display("4-Division operation"); 	      end
	
	4'b0100: begin   result<=a<<1;               $display("5-Left Shift operation");      end
	
	4'b0101: begin   result<=a>>1;               $display("6-Right Shift operation");     end
	
	4'b0110: begin   result<=a<<1; e_bit <=a[7];	 
	                 result[0]<=e_bit;           $display("7-Left Rotation operation");   end
	
	4'b0111: begin   result<=a>>1; e_bit <=a[0];  
			         result[7]<=e_bit;           $display("8-Right Rotation operation");  end
	
	4'b1000 : begin  result <= a&b;              $display("9-AND operation");             end
	
	4'b1001 : begin  result <= a|b;              $display("10-OR operation");             end
	
	4'b1010 : begin  result <= ~(a&b);           $display("11-NAND operation");           end
	
	4'b1011 : begin  result <= ~(a|b);           $display("12-NOR operation");            end
	
	4'b1100 : begin  result <= a ^ b;            $display("13-XOR operation");            end
	
	4'b1101 : begin  result <= a ~^ b;           $display("14-XNOR operation");           end
	
	4'b1110 : begin  result <= (a>b)? 1'b1:1'b0; $display("15-Equality operation");       end
	
	4'b1111 : begin  result <= ~a + 8'b00000001; $display("16-2's Compliment operation"); end 
	
	endcase
end

endmodule

