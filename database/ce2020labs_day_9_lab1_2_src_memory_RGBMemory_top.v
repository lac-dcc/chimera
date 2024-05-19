// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module RGBMemory_top
#(
	parameter  RAMLENGTH=800, //RAMLENGTH*DATAWIDTH = 4800 = 80x60 RAM RESOLUTION
				  DATA_WIDTH=6,
				  V_BOTTOM = 1,
              V_SYNC   = 3,
              V_TOP    = 30,
				  H_FRONT  =  80,
              H_SYNC   =  136,
              H_BACK   =  216,
				  RESOLUTION_H = 1280,
				  RESOLUTION_V = 960,
				  X_WIRE_WIDTH = $clog2 (RESOLUTION_H+H_FRONT+H_SYNC+H_BACK),
				  Y_WIRE_WIDTH = $clog2 (RESOLUTION_V+V_BOTTOM+V_SYNC+V_TOP),
				  ADDR_WIDTH	= $clog2 (RAMLENGTH)
)
(
//input we,
input display_on,clk, memreset, reset_n,
input [ADDR_WIDTH-1:0] resetcnt,
input [2:0]RGBin,
input [X_WIRE_WIDTH-1:0] hpos ,
input [Y_WIRE_WIDTH-1:0] vpos ,
input fifoempty,

output [2:0] RGB
);

wire [DATA_WIDTH-1:0] writeR_data, writeG_data, writeB_data, R_data, G_data, B_data;
wire [ADDR_WIDTH-1:0] addrbuf_wire;
wire we;
				  
RGBmemcoderdecoderv2  // module for interpreting requests to memory
#(
.RESOLUTION_H(RESOLUTION_H),
.DATA_WIDTH(DATA_WIDTH),
.X_WIDTH(X_WIRE_WIDTH),
.Y_WIDTH(Y_WIRE_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
)
FBCODEC
(
.clk (clk),
.reset(reset_n),
.hpos (hpos),
.vpos (vpos),
.datafromR(R_data),
.datafromG(G_data),
.datafromB(B_data),
.RGBin(RGBin),
.display_on(display_on),
.we(we),
.RGB(RGB),
.Rdatatomem(writeR_data),
.Gdatatomem(writeG_data),
.Bdatatomem(writeB_data),
.addr(addrbuf_wire),
.memenable(memreset),
.fifoempty(fifoempty)
);


single_port_ram 
#(
.RAMLENGTH(RAMLENGTH),
.DATA_WIDTH(DATA_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
)
R_MEMORY
(
.we(we), .clk(clk),
.memenable(memreset),
.data(writeR_data),
.addr(addrbuf_wire),
.resetcnt(resetcnt),
.q(R_data)
);



single_port_ram 
#(
.RAMLENGTH(RAMLENGTH),
.DATA_WIDTH(DATA_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
)
G_MEMORY
(
.we(we), .clk(clk),
.memenable(memreset),
.data(writeG_data),
.addr(addrbuf_wire),
.resetcnt(resetcnt),
.q(G_data)
);



single_port_ram 
#(
.RAMLENGTH(RAMLENGTH),
.DATA_WIDTH(DATA_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
)
B_MEMORY
(
.we(we), .clk(clk),
.memenable(memreset),
.data(writeB_data),
.addr(addrbuf_wire),
.resetcnt(resetcnt),
.q(B_data)
);

endmodule