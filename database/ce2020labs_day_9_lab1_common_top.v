// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
# (
    parameter clk_mhz = 50, //not used. just reminder
				  INITIAL = 6'b111111, //Initial value of RAM and decoder's buffer
				  RAM_RESOLUTION_H = 80, // number of RAM regs in a row
				  RESOLUTION_H = 1280,
				  RESOLUTION_V = 960,
				  V_BOTTOM = 1,
              V_SYNC   = 3,
              V_TOP    = 30,
				  H_FRONT  =  80,
              H_SYNC   =  136,
              H_BACK   =  216,
				  DATA_WIDTH = 6,
				  RAMLENGTH  = 800,
				  CURSOR_SIZE = 4, //Isnt changable yet...
				  FIFODEPTH=10
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
	 
	 wire [X_WIRE_WIDTH+Y_WIRE_WIDTH+1:0]tofifo,fromfifo;
	 wire [X_WIRE_WIDTH - 1:0] fromfifo_x = fromfifo[X_WIRE_WIDTH+Y_WIRE_WIDTH+1:Y_WIRE_WIDTH+1];
	 wire [Y_WIRE_WIDTH - 1:0] fromfifo_y = fromfifo[Y_WIRE_WIDTH:1];
	 wire fromfifo_r = fromfifo[0:0];
	 wire [2:0] key_sw_cursor={key_sw[2:0]}; // rout - r component of rgb pixel, which is read from memory
	 wire enable,pllclk,fifoempty,fifofull,display_on,rin_wire,webuf,fifopush,fifopop,rout;
	 // webuf - write enable for framebuffer and decoder;
	 //rinwire - r component of rgb pixel, which supposed to be written to memory
	
	 wire [X_WIRE_WIDTH - 1:0]cursor_xpos, pixel_x_wire;
	 //pixel_x_wire - vga's active pixel x coordinate
	 wire [Y_WIRE_WIDTH - 1:0]cursor_ypos,pixel_y_wire;
	 //pixel_y_wire - vga's active pixel y coordinate
	 wire [DATA_WIDTH-1:0] datainbuf_R,datainbuf_G,datainbuf_B,dataoutbuf_R, dataoutbuf_G, dataoutbuf_B;
	 // datainbuf - word of pixels for writing to memory
	 //dataoutbuf - word of pixels, is read from memory
	 wire [ADDR_WIDTH-1:0] addrbuf_wire; //memory cell address
	 wire [ADDR_WIDTH:0]resetcnt;
	 
	 wire [X_WIRE_WIDTH-1:0]paintpos_h_wire; //x coordinate for memory write
	 wire [Y_WIRE_WIDTH-1:0]paintpos_v_wire; //y coordinate for memory write
	
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
        .clk        ( pllclk        ), 
        .reset      ( ~reset_n   ),
        .hsync      ( hsync      ),
        .vsync      ( vsync      ),
        .display_on ( display_on ),
        .hpos       ( pixel_x_wire    ),
        .vpos       ( pixel_y_wire    ),
		  .enable	  ( enable		)
    );
	 
	vgasprites
	#(.CURSOR_SIZE(CURSOR_SIZE),
	  .H_DISPLAY(RESOLUTION_H),  // Horizontal display width
     .V_DISPLAY(RESOLUTION_V),   // Vertical display height
	  .HPOS_WIDTH(X_WIRE_WIDTH),
	  .VPOS_WIDTH(Y_WIRE_WIDTH)
	)
	sprites
	( 
	.clk(pllclk), 
	.reset(~reset_n), 
	.enable(enable), 
	.display_on(display_on),
	.hpos(pixel_x_wire),
   .vpos(pixel_y_wire),
	.key_sw(key_sw_cursor),
	.rgbout(rgb),
	.cursor_xpos(cursor_xpos),
	.cursor_ypos(cursor_ypos),
	.rfromFB(rout)
	);
	
		brush // module for painting pixels on the screen
    # (
       .HPOS_WIDTH  ( X_WIRE_WIDTH    ),
       .VPOS_WIDTH  ( Y_WIRE_WIDTH    ),
		 .H_DISPLAY   ( RESOLUTION_H	  ),
		 .V_DISPLAY	  ( RESOLUTION_V	  ),
		 .INITIAL_VALUE(INITIAL			  )
    )
    brush
    (
        .clk(pllclk),
		  .reset(~reset_n),
		  .enable(enable),
		  .key_sw(~key_sw[3]),
		  .cursor_xpos(cursor_xpos),
		  .cursor_ypos(cursor_ypos),
		  .tofifo(tofifo), // fifo data structure:{[XPOS][YPOS][Rdata]}
		  .push(fifopush),
		  .pop(fifopop),
		  .empty(fifoempty),
		  .full(fifofull),
		  .webuf(webuf)
    );
	 
	 flip_flop_fifo
	 #(.HPOS_WIDTH(X_WIRE_WIDTH),
		.VPOS_WIDTH(Y_WIRE_WIDTH),
		.depth(FIFODEPTH)
		)
	 FIFO
	 (
			.clk			(pllclk),
			.push			(fifopush),
			.pop			(fifopop),
			.write_data	(tofifo),
			.read_data	(fromfifo),
			.empty		(fifoempty),
			.full			(fifofull)
	);
	 
	 
	 other_memcoderdecoder  // module for interpreting requests to memory
	 #(
	 .RAM_INITIAL_VALUE(INITIAL),
	 .RESOLUTION_H(RESOLUTION_H),
	 .RESOLUTION_V(RESOLUTION_V),
	 .RAM_RESOLUTION_H(RAM_RESOLUTION_H),
	 .DATA_WIDTH(DATA_WIDTH),
	 .X_WIDTH(X_WIRE_WIDTH),
	 .Y_WIDTH(Y_WIRE_WIDTH),
	 .ADDR_WIDTH(ADDR_WIDTH)
	 )
	 bufcodec
	 (
	 .clk (pllclk),
	 .reset(~reset_n),
	 .hpos (pixel_x_wire),
	 .vpos (pixel_y_wire),
	 .paintpos_h(fromfifo_x),
	 .paintpos_v(fromfifo_y),
	 .datafrommem(dataoutbuf),
	 .rin(fromfifo_r),
	 .we(webuf),
	 .rout(rout),
	 .datatomem(datainbuf),
	 .addr(addrbuf_wire),
	 .memenable(enable)
	 );
	 
	 other_single_port_ram21 // framebuffer - RAM
	 #(
	 .RAMLENGTH(RAMLENGTH),
	 .RAM_INITIAL_VALUE(INITIAL),
	 .DATA_WIDTH(DATA_WIDTH),
	 .ADDR_WIDTH(ADDR_WIDTH)
	 )
	 framebuf
	 (
		 .clk		(pllclk),
		 .we		(webuf),
		 .data	(datainbuf),
		 .addr	(addrbuf_wire),
		 .q		(dataoutbuf),
		 .resetcnt(resetcnt),
		 .memenable(enable)
	 );
//	 
//	 other_single_port_ram_GREEN // framebuffer - RAM
//	 #(
//	 .RAMLENGTH(RAMLENGTH),
//	 .RAM_INITIAL_VALUE(INITIAL),
//	 .DATA_WIDTH(DATA_WIDTH),
//	 .ADDR_WIDTH(ADDR_WIDTH)
//	 )
//	 framebuf_GREEN
//	 (
//		 .clk		(pllclk),
//		 .we		(webuf),
//		 .resetcnt(resetcnt),
//		 .data_G	(datainbuf_G),
//		 .addr	(addrbuf_wire),
//		 .qG		(dataoutbuf_G),
//		 .memenable(enable)
//	 );
//
//	 other_single_port_ram_BLUE // framebuffer - RAM
//	 #(
//	 .RAMLENGTH(RAMLENGTH),
//	 .RAM_INITIAL_VALUE(INITIAL),
//	 .DATA_WIDTH(DATA_WIDTH),
//	 .ADDR_WIDTH(ADDR_WIDTH)
//	 )
//	 framebuf_BLUE
//	 (
//		 .clk		(pllclk),
//		 .we		(webuf),
//		 .resetcnt(resetcnt),
//		 .data_B	(datainbuf_B),
//		 .addr	(addrbuf_wire),
//		 .qB		(dataoutbuf_B),
//		 .memenable(enable)
//	 );
	 
	 memsyncreset
	 #(.ADDR_WIDTH(ADDR_WIDTH),
	 .RAMLENGTH(RAMLENGTH))
	 memsyncreset
	 (.clk(clk), 
	 .memreset(~reset_n),
	 .resetcnt(resetcnt),
	 .memenable(enable)
	 );
	 
	
endmodule
