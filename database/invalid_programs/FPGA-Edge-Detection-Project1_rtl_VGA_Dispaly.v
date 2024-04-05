//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          VGA_Dispaly
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        VGA_Dispaly VGA显示
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
`timescale      1ns/1ps


`include "Lcd_Para.v"	
module VGA_Dispaly(
	input 					clk,        //25Mhz
	input 					rst_n,		
	input 			[11:0]	lcd_x,
	input 			[11:0]	lcd_y,
    input        	[11:0] 	hcnt,
    input        	[11:0] 	vcnt,
	input 			[15:0]	dina,
    input 			[3:0]	out_a,
    input                   rfifo_rd_ready,
    input       [11:0]      x_min,
    input       [11:0]      x_max,
    input       [11:0]      y_min,
    input       [11:0]      y_max,
    output                  disp_en,
	output 	  reg   	[15:0] 	lcd_data
    );
`define	LCD_ADDR_AHEAD		 9'd2	//lcd address ahead, it is very important
assign  disp_en = ((hcnt >= `H_SYNC + `H_BACK - 2 && hcnt < `H_SYNC + `H_BACK + `H_DISP - 2) &&
						(vcnt >= `V_SYNC + `V_BACK  && vcnt < `V_SYNC + `V_BACK + `V_DISP))? 1'b1: 1'b0;

//assign  disp_en =(lcd_x >= `H_START && lcd_x < `H_END && lcd_y >= `V_START && lcd_y < `V_END)?
                  //1'b1: 1'b0;
wire    [15:0]  lcd_data_r;
//assign  lcd_data_r =(disp_en == 1'b1)? dina:16'd0;



//--------------------------------------------------------------
/****************************************************************
			Display : "Hello World*^_^*", 32*16 = 512 (Char: 32 * 64)    256字节即可
****************************************************************/
wire	vip_area =	(lcd_x >= 8 && lcd_x < 264) && (lcd_y >= 0 && lcd_y < 64); //64
							
wire	[8:0]	vip_addr = lcd_x[8:0] - (9'd8 - `LCD_ADDR_AHEAD);	//32*16 = 512
wire	[63:0]	vip_data0;
wire	[63:0]	vip_data1;							
wire	[63:0]	vip_data2;
wire	[63:0]	vip_data3;
wire	[63:0]	vip_data4;							
wire	[63:0]	vip_data5;	
wire	[63:0]	vip_data6;
wire	[63:0]	vip_data7;								
vip_char	u_vip_char 
(
	.clock		(clk),
	.address	(vip_addr),
	.q			(vip_data0)
);
vip_char1	u_vip_char1
(
	.clock		(clk),
	.address	(vip_addr),
	.q			(vip_data1)
);
vip_char2	u_vip_char2
(
	.clock		(clk),
	.address	(vip_addr),
	.q			(vip_data2)
);
vip_char3	u_vip_char3 
(
	.clock		(clk),
	.address	(vip_addr),
	.q			(vip_data3)
);
vip_char4	u_vip_char4
(
	.clock		(clk),
	.address	(vip_addr),
	.q			(vip_data4)
);
vip_char5	u_vip_char5
(
	.clock		(clk),
	.address	(vip_addr),
	.q			(vip_data5)
);
vip_char6	u_vip_char6
(
	.clock		(clk),
	.address	(vip_addr),
	.q			(vip_data6)
);
vip_char7	u_vip_char7
(
	.clock		(clk),
	.address	(vip_addr),
	.q			(vip_data7)
);
always @(*)begin
    if(out_a==4'd7)
        begin
        if(lcd_y == y_min && lcd_x >= x_min && lcd_x <= x_max)
            lcd_data <= `RED;
        else if(lcd_y == y_max && lcd_x >= x_min && lcd_x <= x_max)
            lcd_data <= `RED;
        else if(lcd_x == x_min && lcd_y >= y_min && lcd_y <= y_max)
            lcd_data <= `RED;
        else if(lcd_x == x_max && lcd_y >= y_min && lcd_y <= y_max)
            lcd_data <= `RED;
        else if(vip_area == 1'b1)
        begin
            if(vip_data7[6'd63-lcd_y[5:0]] == 1'b1)	
                lcd_data <= `BLUE;
            else
                begin                           
                if(disp_en)
                    lcd_data <= dina;
                else
                    lcd_data <= `RED;
                end
        end
        else if(disp_en)
            lcd_data <= dina;
        else 
            lcd_data <= 0;
        end
    else
    begin           

                if(vip_area == 1'b1)
                    begin
                    case(out_a)
                    4'd0:	
                    begin
                            if(vip_data0[6'd63-lcd_y[5:0]] == 1'b1)	lcd_data <= `BLUE;
                            else
                            begin                           
                            if(disp_en)
                                lcd_data <= dina;
                            else
                                lcd_data <= `RED;
                            end
                    end
                    4'd1:                
                    begin
                            if(vip_data1[6'd63-lcd_y[5:0]] == 1'b1)	lcd_data <= `BLUE;
                            else
                            begin 
                             if(disp_en)
                                lcd_data <= dina;
                            else
                                lcd_data <= `RED;
                            end
                    end
                    4'd2:
                    begin
                            if(vip_data2[6'd63-lcd_y[5:0]] == 1'b1)	lcd_data <= `BLUE;
                            else
                            begin 
                             if(disp_en)
                                lcd_data <= dina;
                            else
                                lcd_data <= `RED;
                            end
                    end
                    4'd3:
                    begin
                            if(vip_data3[6'd63-lcd_y[5:0]] == 1'b1)	lcd_data <= `BLUE;
                            else
                            begin 
                             if(disp_en)
                                lcd_data <= dina;
                            else
                                lcd_data <= `RED;
                            end
                    end
                    4'd4:
                     begin
                            if(vip_data4[6'd63-lcd_y[5:0]] == 1'b1)	lcd_data <= `BLUE;
                            else
                            begin 
                             if(disp_en)
                                lcd_data <= dina;
                            else
                                lcd_data <= `RED;
                            end
                    end
                    4'd5:
                    begin
                            if(vip_data5[6'd63-lcd_y[5:0]] == 1'b1)	lcd_data <= `BLUE;
                            else
                            begin 
                             if(disp_en)
                                lcd_data <= dina;
                            else
                                lcd_data <= `RED;
                            end
                    end
                    4'd6:
                    begin
                            if(vip_data6[6'd63-lcd_y[5:0]] == 1'b1)	lcd_data <= `BLUE;
                            else
                            begin 
                             if(disp_en)
                                lcd_data <= dina;
                            else
                                lcd_data <= `RED;
                            end
                    end                  
                    default:;
                    endcase	
                end 
                else
                begin
                     if(disp_en)
                       lcd_data <= dina;
                     else
                       lcd_data <= 0;
                end
        
    end
    
end

	
endmodule
		
		
		
		
		
	
