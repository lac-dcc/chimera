//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          Mode_Choose
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        模式选择
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module Mode_Choose
(
	//global clock
	input				clk,  		//100MHz
	input				rst_n,		//global reset
	
	//user interface
	input				key_flag,		//key down flag
	input		[3:0]	key_value,		//key control data
	
	output	reg	  [3:0]	out_a,	//Sobel Grade output
	output	reg	        out_b	//lcd pwn signal, l:valid
);

//---------------------------------
//Sobel Threshold adjust with key.
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		out_a<=1'b0;
        out_b<=1'b0;
    end
	else if(key_flag)
		begin
		case(key_value)	//{Sobel_Threshold--, Sobel_Threshold++}
        4'b0100:	out_a <= (out_a == 4'd0)  ? 4'd0  : out_a - 1'b1;
		4'b1000:	out_a <= (out_a == 4'd7) ? 4'd7 : out_a + 1'b1;
        /*4'b0100:	begin
                        out_a	<= 1'b1;
                        out_b<=1'b0;
                    end
		4'b1000:	begin
                        out_a	<= 1'b0;
                        out_b<=1'b1;
                    end
        4'b1100:	begin
                        out_a	<= 1'b0;
                        out_b<=1'b0;
                    end*/
		default:;
		endcase
		end
	/*else
        begin
            out_a <= out_a;
            out_b <= out_b;
        end*/
end

endmodule
