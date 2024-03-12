module async_bfifo_reg #(
    	parameter RAM_STYLE  = "distributed",              // Specify RAM style: auto/block/distributed
	parameter DWID       = 18, 
	parameter AWID       = 10, 
	parameter AFULL_TH   = 4, 
	parameter AEMPTY_TH  = 4, 
	parameter DBG_WID    = 32 
) (
  //write clock domain
  input 					wclk,                          // write clock
  input 					wrst,                          // write reset
  input 					wen,                           // Write enable
  input  [DWID-1:0]   	    wdata,                         // RAM input data
  output                    nfull,                         // 
  output                    nafull,                        // 
  output                    woverflow,                     // 
  output [AWID:0]           cnt_free,                      // the counter used in fifo for read clock domain 
  //read clock domain
  input                     rclk,                          // Read clock
  input                     rrst,                          // Read reset 
  input                     ren,                           // Read Enable
  output [DWID-1:0]         rdata,                         // RAM output data
  output                    nempty,                        // 
  output                    naempty,                       // 
  output                    roverflow,                     // 
  output [AWID:0]           cnt_used ,                     // the counter used in fifo for write clock domain
  output [DBG_WID-1:0]      dbg                            // debug signal
);

wire [AWID-1 : 0] waddr_wclk;
wire [AWID-1 : 0] waddr_rclk;
wire [AWID-1 : 0] raddr_wclk;
wire [AWID-1 : 0] raddr_rclk;

//////////////////////////////////////////////////////////////////////////////////
//      mem instance
//////////////////////////////////////////////////////////////////////////////////
async_sdp_ram #(
        .RAM_STYLE   ( RAM_STYLE   ),
	.DWID        ( DWID        ), 
	.AWID        ( AWID        ), 
	.DBG_WID     ( DBG_WID     ) 
) inst_async_sdp_ram (
    .wclk    (  wclk        ),         // Write clock
    .rclk    (  rclk        ),         // Read clock
    .waddr   (  waddr_wclk  ),         // Write address bus, width determined from RAM_DEPTH
    .wen     (  wen         ),         // Write enable
    .wdata   (  wdata       ),         // RAM input data
    .raddr   (  raddr_rclk  ),         // Read address bus, width determined from RAM_DEPTH
    .ren     (  ren         ),         // Read Enable, for additional power savings, disable when not in use
    .rdata   (  rdata       ),         // RAM output data
    .dbg     (              )          // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//     waddr logic instance 
//////////////////////////////////////////////////////////////////////////////////
fifo_addr_logic #(
	.AWID (AWID)
	)
inst_waddr(
	.clk         (wclk      ),
	.rst         (wrst      ),
	.enb         (nfull     ),
	.inc         (wen       ),
	.addr        (waddr_wclk)
	);

//////////////////////////////////////////////////////////////////////////////////
//     raddr logic instance 
//////////////////////////////////////////////////////////////////////////////////
fifo_addr_logic #(
	.AWID (AWID)
	)
inst_raddr(
	.clk         (rclk      ),
	.rst         (rrst      ),
	.enb         (nempty    ),
	.inc         (ren       ),
	.addr        (raddr_rclk)
	);

//////////////////////////////////////////////////////////////////////////////////
//     full logic instance
//////////////////////////////////////////////////////////////////////////////////
fifo_full_logic #(
	.AWID        ( AWID       ),
	.AFULL_TH    ( AFULL_TH   )
	)
inst_full_logic(
	.wclk        ( wclk       ),
	.wrst        ( wrst       ),
	.wen         ( wen        ),
	.waddr       ( waddr_wclk ),
	.raddr       ( raddr_wclk ),
	.nfull       ( nfull      ),
	.nafull      ( nafull     ),
	.woverflow   ( woverflow  ),
	.cnt_free    ( cnt_free   )
	);

//////////////////////////////////////////////////////////////////////////////////
//     empty logic instance
//////////////////////////////////////////////////////////////////////////////////
fifo_empty_logic #(
	.AWID        ( AWID       ),
	.AEMPTY_TH   ( AEMPTY_TH  )
	)
inst_empty_logic(
	.rclk       ( rclk       ),
	.rrst       ( rrst       ),
	.ren        ( ren        ),
	.raddr      ( raddr_rclk ),
	.waddr      ( waddr_rclk ),
	.nempty     ( nempty     ),
	.naempty    ( naempty    ),
	.roverflow  ( roverflow  ),
	.cnt_used   ( cnt_used   )
	);

//////////////////////////////////////////////////////////////////////////////////
//     waddr clock-domain-cross process instance
//////////////////////////////////////////////////////////////////////////////////
fifo_addr_cdc_tf #(
	.AWID   ( AWID )
	)
inst_waddr_cdc_tf(
	.clk_in        ( wclk       ),
	.rst_in        ( wrst       ),
	.clk_out       ( rclk       ),
	.rst_out       ( rrst       ),
	.addr_in    ( waddr_wclk ),
	.addr_out   ( waddr_rclk )
	);

//////////////////////////////////////////////////////////////////////////////////
//     raddr clock-domain-cross process instance
//////////////////////////////////////////////////////////////////////////////////
fifo_addr_cdc_tf #(
	.AWID   ( AWID )
	)
inst_raddr_cdc_tf(
	.clk_in        ( rclk       ),
	.rst_in        ( rrst       ),
	.clk_out       ( wclk       ),
	.rst_out       ( wrst       ),
	.addr_in    ( raddr_rclk ),
	.addr_out   ( raddr_wclk )
	);

//////////////////////////////////////////////////////////////////////////////////
//  debug sig
//////////////////////////////////////////////////////////////////////////////////
assign dbg = { 28'h0, woverflow, roverflow, nafull, nempty };

endmodule

module async_convert #(
	parameter DWID       = 10,
	parameter DLY_NUM    = 2 
) (
  input 					clk_in,                    // clock old 
  input 					rst_in,                    // reset old
  input 					clk_out,                   // clock new
  input 					rst_out,                   // reset new
  input  [DWID-1:0]			din,                       // addr in a clock domain
  output [DWID-1:0]			dout                       // new addr in a new clock domain
);

//////////////////////////////////////////////////////////////////////////////////
//     signal declare
//////////////////////////////////////////////////////////////////////////////////
reg [DWID-1:0]      din_reg;
reg [DWID*DLY_NUM-1:0] din_dly;

//////////////////////////////////////////////////////////////////////////////////
//     the data is clocked by old clock
//////////////////////////////////////////////////////////////////////////////////
always@( posedge clk_in or posedge rst_in ) begin
		if( rst_in==1'b1 ) begin
				din_reg <= 0;
		end
		else begin
				din_reg <= din;
		end
end

//////////////////////////////////////////////////////////////////////////////////
//     the data is clocked by new clock
//////////////////////////////////////////////////////////////////////////////////
always@( posedge clk_out or posedge rst_out ) begin
		if( rst_out==1'b1 ) begin
				din_dly <= 0;
		end
		else begin
				din_dly <= { din_dly[DWID*(DLY_NUM-1)-1:0], din_reg };
		end
end

assign dout = din_dly[ DWID*DLY_NUM-1 : DWID*(DLY_NUM-1) ];

endmodule


module async_sdp_ram #(
    parameter RAM_STYLE = "block",                  // Specify RAM style: auto/block/distributed
	parameter DWID      = 18, 
	parameter AWID      = 10, 
	parameter DBG_WID   = 32 
) (
  input 					wclk,                          // Write clock
  input 					rclk,                          // Read clock
  input  [AWID-1:0]	waddr,                         // Write address bus, width determined from RAM_DEPTH
  input 					wen,                           // Write enable
  input  [DWID-1:0]   	wdata,                         // RAM input data
  input  [AWID-1:0]   raddr,                         // Read address bus, width determined from RAM_DEPTH
  input                     ren,                           // Read Enable, for additional power savings, disable when not in use
  output [DWID-1:0]      rdata,                         // RAM output data
  output [DBG_WID-1:0]      dbg                            // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//      mem instance
//////////////////////////////////////////////////////////////////////////////////
generate
if( RAM_STYLE=="block" ) begin : bram
xilinx_simple_dual_port_2_clock_bram #(
    .RAM_WIDTH(DWID),                  // Specify RAM data width
    .RAM_DEPTH(2**AWID),            // Specify RAM depth (number of entires)
    .RAM_PERFORMANCE("LOW_LATENCY"),      // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    .INIT_FILE("")                        // Specify name/location of RAM initialization file if using one (leave blank if not)
  ) inst_async_sdp_ram (
    .addra(waddr),    // Write address bus, width determined from RAM_DEPTH
    .addrb(raddr),    // Read address bus, width determined from RAM_DEPTH
    .dina(wdata),      // RAM input data, width determined from DWIDTH
    .clka(wclk),      // Write clock
    .clkb(rclk),      // Read clock
    .wea(wen),        // Write enable
    .enb(ren),        // Read Enable, for additional power savings, disable when not in use
    .rstb(1'b0),         // Output reset (does not affect memory contents)
    .regceb(1'b0),       // Output register enable
    .doutb(rdata)     // RAM output data, width determined from DWIDTH
  );
end
else if( RAM_STYLE=="distributed" ) begin : dram
xilinx_simple_dual_port_2_clock_dram #(
    .RAM_WIDTH(DWID),                  // Specify RAM data width
    .RAM_DEPTH(2**AWID),            // Specify RAM depth (number of entires)
    .RAM_PERFORMANCE("LOW_LATENCY"),      // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    .INIT_FILE("")                        // Specify name/location of RAM initialization file if using one (leave blank if not)
  ) inst_async_sdp_ram (
    .addra(waddr),    // Write address bus, width determined from RAM_DEPTH
    .addrb(raddr),    // Read address bus, width determined from RAM_DEPTH
    .dina(wdata),      // RAM input data, width determined from DWIDTH
    .clka(wclk),      // Write clock
    .clkb(rclk),      // Read clock
    .wea(wen),        // Write enable
    .enb(ren),        // Read Enable, for additional power savings, disable when not in use
    .rstb(1'b0),         // Output reset (does not affect memory contents)
    .regceb(1'b0),       // Output register enable
    .doutb(rdata)     // RAM output data, width determined from DWIDTH
  );
end
else begin : auto
xilinx_simple_dual_port_2_clock_ram #(
    .RAM_WIDTH(DWID),                  // Specify RAM data width
    .RAM_DEPTH(2**AWID),            // Specify RAM depth (number of entires)
    .RAM_PERFORMANCE("LOW_LATENCY"),      // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    .INIT_FILE("")                        // Specify name/location of RAM initialization file if using one (leave blank if not)
  ) inst_async_sdp_ram (
    .addra(waddr),    // Write address bus, width determined from RAM_DEPTH
    .addrb(raddr),    // Read address bus, width determined from RAM_DEPTH
    .dina(wdata),      // RAM input data, width determined from DWIDTH
    .clka(wclk),      // Write clock
    .clkb(rclk),      // Read clock
    .wea(wen),        // Write enable
    .enb(ren),        // Read Enable, for additional power savings, disable when not in use
    .rstb(1'b0),         // Output reset (does not affect memory contents)
    .regceb(1'b0),       // Output register enable
    .doutb(rdata)     // RAM output data, width determined from DWIDTH
  );
end

endgenerate

//////////////////////////////////////////////////////////////////////////////////
//     debug process 
//////////////////////////////////////////////////////////////////////////////////
assign dbg = 32'h0;

endmodule

