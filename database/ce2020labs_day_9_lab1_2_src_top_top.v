// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

//`include "config.vh"
//`define RESOLUTION "640x480"

module top
# (
    parameter clk_mhz = 50, //not used. just reminder
				  INITIAL = 6'b111111, //Initial value of RAM and decoder's buffer
				  RAM_RESOLUTION_H = 80, // number of RAM regs in a row
	 parameter RESOLUTION_H =640,
	 parameter RESOLUTION_V =480,
	 parameter V_TOP = 	  	10,
	 parameter V_SYNC = 	  	2,
	 parameter V_BOTTOM =  	33,
	 parameter H_FRONT =	  	16,
	 parameter H_SYNC =	  	96,
	 parameter H_BACK = 	  	48,
				  DATA_WIDTH = 6,
				  RAMLENGTH  = 800,
				  CURSOR_SIZE = 4 //Isnt changable yet...
)
(
    input        clk,
    input        reset_n,
    
    input  [3:0] key_sw,
    output [3:0] led,
    
    output [7:0] abcdefgh,
    output [3:0] digit,

    output       buzzer,

    output       hsync,
    output       vsync,
    output [2:0] rgb
);
	localparam X_WIRE_WIDTH = $clog2 (RESOLUTION_H+H_FRONT+H_SYNC+H_BACK),
				  Y_WIRE_WIDTH = $clog2 (RESOLUTION_V+V_BOTTOM+V_SYNC+V_TOP),
				  ADDR_WIDTH	= $clog2 (RAMLENGTH);
				  

    assign led       = key_sw;
    assign abcdefgh  = 8'hff;
    assign digit     = 4'hf;
    assign buzzer    = 1'b1;

    //------------------------------------------------------------------------
	 
	 wire enable,pllclk,fifoempty,fifofull,display_on,fifopush,fifopop,ROMready;
	 // webuf - write enable for framebuffer and decoder;
	 //rinwire - r component of rgb pixel, which supposed to be written to memory
	
	 wire [2:0] RGBfifo,ROM_RGB;
	
	 wire [X_WIRE_WIDTH - 1:0] hpos,hpos_to_fb,hposfifo,ROM_hpos;

	 wire [Y_WIRE_WIDTH - 1:0] vpos,vpos_to_fb,vposfifo,ROM_vpos;

	 wire [DATA_WIDTH-1:0] datainbuf_R,datainbuf_G,datainbuf_B,dataoutbuf_R, dataoutbuf_G, dataoutbuf_B;

	 wire [ADDR_WIDTH:0]resetcnt;
	 
	
	//pll pll(.areset(~reset_n),.inclk0(clk),.c0(pllclk));
	
	//pll - to be able to work with high resolutions, the clock value must be set higher than reference clk;
	
    vga
    # (
        .HPOS_WIDTH ( X_WIRE_WIDTH    ),
        .VPOS_WIDTH ( Y_WIRE_WIDTH    ),
        
		  .H_DISPLAY( RESOLUTION_H ),
        .H_FRONT	(	H_FRONT		),
        .H_SYNC   (	H_SYNC		),
        .H_BACK   (	H_BACK		),
        .V_DISPLAY(	RESOLUTION_V),
        .V_BOTTOM (	V_BOTTOM		),
        .V_SYNC   (	V_SYNC		),
        .V_TOP    (	V_TOP			)
    )
    i_vga
    (
        .clk        ( clk     ), 
        .reset      ( ~reset_n   ),
        .hsync      ( hsync      ),
        .vsync      ( vsync      ),
        .display_on ( display_on ),
        .hpos       ( hpos    	),
        .vpos       ( vpos    	),
		  .enable	  ( enable		)
    );
	 
//	vgasprites
//	#(.CURSOR_SIZE(CURSOR_SIZE),
//	  .H_DISPLAY(RESOLUTION_H),  // Horizontal display width
//     .V_DISPLAY(RESOLUTION_V),   // Vertical display height
//	  .HPOS_WIDTH(X_WIRE_WIDTH),
//	  .VPOS_WIDTH(Y_WIRE_WIDTH)
//	)
//	sprites
//	( 
//	.clk(pllclk), 
//	.reset(~reset_n), 
//	.enable(enable), 
//	.display_on(display_on),
//	.hpos(pixel_x_wire),
//   .vpos(pixel_y_wire),
//	.key_sw(key_sw_cursor),
//	.rgbout(rgb),
//	.cursor_xpos(cursor_xpos),
//	.cursor_ypos(cursor_ypos),
//	.rfromFB(rout)
//	);
	
//		brush // module for painting pixels on the screen
//    # (
//       .HPOS_WIDTH  ( X_WIRE_WIDTH    ),
//       .VPOS_WIDTH  ( Y_WIRE_WIDTH    ),
//		 .H_DISPLAY   ( RESOLUTION_H	  ),
//		 .V_DISPLAY	  ( RESOLUTION_V	  ),
//		 .INITIAL_VALUE(INITIAL			  )
//    )
//    brush
//    (
//        .clk(pllclk),
//		  .reset(~reset_n),
//		  .enable(enable),
//		  .key_sw(~key_sw[3]),
//		  .cursor_xpos(cursor_xpos),
//		  .cursor_ypos(cursor_ypos),
//		  .tofifo(tofifo), // fifo data structure:{[XPOS][YPOS][Rdata]}
//		  .push(fifopush),
//		  .pop(fifopop),
//		  .empty(fifoempty),
//		  .full(fifofull),
//		  .webuf(webuf)
//    );
	 
	 ROM_top
	 #(.X_WIRE_WIDTH(X_WIRE_WIDTH),
		.Y_WIRE_WIDTH(Y_WIRE_WIDTH),
		.RAMLENGTH(RAMLENGTH),
		.RAM_DATAWIDTH(DATA_WIDTH)
		)
		ROM
		(
		.clk			(clk),
		.rst			(~reset_n),
		.ROMready	(ROMready),
		.display_on (display_on),
		.fifofull	(fifofull),
		.enable		(enable),
		.hpos			(ROM_hpos),
		.vpos			(ROM_vpos),
		.RGB			(ROM_RGB)
		);
	 
	 
	 FIFO_top
	 #(.HPOS_WIDTH(X_WIRE_WIDTH),
		.VPOS_WIDTH(Y_WIRE_WIDTH)
		)
	 FIFO
	 (
			.clk			(clk),
			.rst			(~reset_n),
			.push			(fifopush),
			.toppop		(fifopop),
			.hpos_write	(ROM_hpos),
			.vpos_write	(ROM_vpos),
			.RGB_write	(ROM_RGB),
			.hpos_read	(hposfifo),
			.vpos_read	(vposfifo),
			.RGB_read   (RGBfifo),
			.full			(fifofull),
			.empty		(fifoempty)
	);
	 
	 
	 RGBMemory_top
	 #(
		.RAMLENGTH(RAMLENGTH), //RAMLENGTH*DATAWIDTH = 4800 = 80x60 RAM RESOLUTION
		.DATA_WIDTH(DATA_WIDTH),
		.X_WIRE_WIDTH(X_WIRE_WIDTH),
		.Y_WIRE_WIDTH(Y_WIRE_WIDTH),
		.ADDR_WIDTH(ADDR_WIDTH),
		.RESOLUTION_H(RESOLUTION_H),
		.RESOLUTION_V(RESOLUTION_V)
	 )
	 FrameBuffer
	 (
		.display_on(display_on),
		.clk(clk),
		.memreset(enable),
		.reset_n(~reset_n),
		.resetcnt(resetcnt),
		.RGBin(RGBfifo),
		.hpos(hpos_to_fb),
		.vpos(vpos_to_fb),
		.RGB(rgb),
		.fifoempty(fifoempty)
	 );
	 
	 memsyncreset
	 #(
	 .ADDR_WIDTH(ADDR_WIDTH),
	 .RAMLENGTH(RAMLENGTH)
	 )
	 memsyncreset
	 (
	 .clk(clk), 
	 .memreset(~reset_n),
	 .resetcnt(resetcnt),
	 .memenable(enable)
	 );
	 
	 assign hpos_to_fb = (display_on) ? hpos : hposfifo;
	 assign vpos_to_fb = (display_on) ? vpos : vposfifo;
	 assign fifopop = ~display_on&&~fifoempty;
	 assign fifopush = display_on&&~fifofull&&ROMready;
	
endmodule
