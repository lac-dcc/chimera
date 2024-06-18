// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

//`include "config.vh"
//`define RESOLUTION "640x480"

module top
# (
					clk_mhz = 50, //not used. just reminder
				  INITIAL = 6'b111111, //Initial value of RAM and decoder's buffer
				  RAM_RESOLUTION_H = 80, // number of RAM regs in a row
					RESOLUTION_H =640,
					RESOLUTION_V =480,
					V_TOP = 	  	10,
					V_SYNC = 	  	2,
					V_BOTTOM =  	33,
					H_FRONT =	  	16,
					H_SYNC =	  	96,
					H_BACK = 	  	48,
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
	 wire [3:0] BTN,BTN_POSEDGE,BTN_NEGEDGE;
	 wire enable,pllclk,fifoempty,fifofull,display_on,fifopush,fifopop;
	 reg ROMready=0;
	 // webuf - write enable for framebuffer and decoder;
	 //rinwire - r component of rgb pixel, which supposed to be written to memory
	
	 wire [2:0] RGBfifo,FB_RGB,brush_RGB;//ROM_RGB;
	
	 wire [X_WIRE_WIDTH - 1:0] hpos,hpos_to_fb,hposfifo,brush_hpos;//ROM_hpos;

	 wire [Y_WIRE_WIDTH - 1:0] vpos,vpos_to_fb,vposfifo,brush_vpos;//ROM_vpos;

	 wire [DATA_WIDTH-1:0] datainbuf_R,datainbuf_G,datainbuf_B,dataoutbuf_R, dataoutbuf_G, dataoutbuf_B;

	 wire [ADDR_WIDTH:0]resetcnt;
	 
	
	pll pll(.areset(~reset_n),.inclk0(clk),.c0(pllclk));
	
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
        .clk        ( pllclk     ), 
        .reset      ( ~reset_n   ),
        .hsync      ( hsync      ),
        .vsync      ( vsync      ),
        .display_on ( display_on ),
        .hpos       ( hpos    	),
        .vpos       ( vpos    	),
		  .enable	  ( enable		)
    );
	 
	 button_debouncer Debouncer
	 (
	  .clk			( pllclk		), 
	  .reset			( ~reset_n 	),
	  .RAW_BTN		( ~key_sw	),
	  .BTN			(	BTN		),
	  .BTN_POSEDGE	(BTN_POSEDGE),
	  .BTN_NEGEDGE	(BTN_NEGEDGE)
	 );
	 
	 brush
	 #(
	 .RESOLUTION_H   ( RESOLUTION_H ),
	 .RESOLUTION_V   ( RESOLUTION_V ),
	 .HPOS_WIDTH	  ( X_WIRE_WIDTH ),
	 .VPOS_WIDTH 	  ( Y_WIRE_WIDTH )
	 )
	 Painting_Brush
	 (
			.clk		  		( pllclk		),
			.reset	  		( ~reset_n 	),
			.BTN		  		( BTN			), // [2:0]movedirection=[2:0]key_sw
			.BTN_POSEDGE	(BTN_POSEDGE),
			.display_on		(display_on	),
			.hpos		  		( hpos		),
			.vpos		  		( vpos		),
			.FB_RGB	  		( FB_RGB		),
			.memenable		( enable ),
			.rgb		  		( rgb			),
			.writergb		( brush_RGB ),
			.fifopush  		( fifopush	),
			.fifofull		( fifofull	),
			.writecounter_x( brush_hpos),
			.writecounter_y( brush_vpos)
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

	 
//	 ROM_top
//	 #(.X_WIRE_WIDTH(X_WIRE_WIDTH),
//		.Y_WIRE_WIDTH(Y_WIRE_WIDTH),
//		.RAMLENGTH(RAMLENGTH),
//		.RAM_DATAWIDTH(DATA_WIDTH)
//		)
//		ROM
//		(
//		.clk			(pllclk),
//		.rst			(~reset_n),
//		.ROMready	(ROMready),
//		.display_on (display_on),
//		.fifofull	(fifofull),
//		.enable		(enable),
//		.hpos			(ROM_hpos),
//		.vpos			(ROM_vpos),
//		.RGB			(ROM_RGB)
//		);
	 
	 
	 FIFO_top
	 #(.HPOS_WIDTH(X_WIRE_WIDTH),
		.VPOS_WIDTH(Y_WIRE_WIDTH)
		)
	 FIFO
	 (
			.clk			(pllclk	  ),
			.rst			(~reset_n  ),
			.push			(fifopush  ),
			.toppop		(fifopop	  ),
			.hpos_write	(brush_hpos),
			.vpos_write	(brush_vpos),
			.RGB_write	(brush_RGB ),
			.hpos_read	(hposfifo  ),
			.vpos_read	(vposfifo  ),
			.RGB_read   (RGBfifo	  ),
			.full			(fifofull  ),
			.empty		(fifoempty )
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
		.clk(pllclk),
		.memreset(enable),
		.reset_n(~reset_n),
		.resetcnt(resetcnt),
		.RGBin(RGBfifo),
		.hpos(hpos_to_fb),
		.vpos(vpos_to_fb),
		.RGB(FB_RGB),
		.fifoempty(fifoempty)
	 );
	 
	 memsyncreset
	 #(
	 .ADDR_WIDTH(ADDR_WIDTH),
	 .RAMLENGTH(RAMLENGTH)
	 )
	 memsyncreset
	 (
	 .clk(pllclk), 
	 .memreset(~reset_n),
	 .resetcnt(resetcnt),
	 .memenable(enable)
	 );
	 
	 assign hpos_to_fb = (display_on) ? hpos : hposfifo;
	 assign vpos_to_fb = (display_on) ? vpos : vposfifo;
	 assign fifopop = ~display_on&&~fifoempty;
	 //assign fifopush = display_on&&~fifofull&&ROMready;
	
endmodule
