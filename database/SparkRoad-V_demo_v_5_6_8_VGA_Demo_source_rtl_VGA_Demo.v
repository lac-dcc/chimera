`timescale 1ns/1ns
module VGA_Demo
( 
	input  wire			clk_24m,
	input  wire			rst_n,
	
	//lcd interface
	output wire			vga_clk,	//lcd pixel clock			
	output wire			vga_hs,		//lcd horizontal sync 
	output wire			vga_vs,		//lcd vertical sync

    output wire			vga_de,		//lcd data enable
    
	output wire [7:0]  	vga_r,		//lcd red data
	output wire [7:0]	vga_g,		//lcd green data
	output wire [7:0]	vga_b		//lcd blue data
);

wire	clk_vga;
wire	[11:0]	lcd_xpos;		//lcd horizontal coordinate
wire	[11:0]	lcd_ypos;		//lcd vertical coordinate
wire	[23:0]	lcd_data;		//lcd data

//sync global clock and reset signal 
Clk_div	u0_PLL
(
	.clk			(clk_24m	), 
	.rst_n			(rst_n		),	

	.clk_div		(clk_vga	)
);

//VGA driver timing
Driver u1_Driver
(
// Input
	.clk			(clk_vga				),		
	.rst_n			(rst_n					),  
	.lcd_data		(lcd_data				),
// Output 	
	.lcd_dclk		(vga_clk				),		    	
	.lcd_hs			(vga_hs					),		
	.lcd_vs			(vga_vs					),
	.lcd_en			(vga_de					),		
	.lcd_rgb		({vga_r, vga_g ,vga_b}	),	
	.lcd_xpos		(lcd_xpos				),	
	.lcd_ypos		(lcd_ypos				)
);

//lcd data simulation
Display	u2_Display
(
// Input
	.clk			(clk_vga		),		
	.rst_n			(rst_n			), 	
	.lcd_xpos		(lcd_xpos		),	
	.lcd_ypos		(lcd_ypos		),
// Output 	
	.lcd_data		(lcd_data		)
);

endmodule
