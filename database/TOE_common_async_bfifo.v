module async_bfifo #(
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
  output [AWID:0]           cnt_used ,                     // the counter used in fifo for write clock domain
  //read clock domain
  input                     rclk,                          // Read clock
  input                     rrst,                          // Read reset 
  input                     ren,                           // Read Enable
  output [DWID-1:0]         rdata,                         // RAM output data
  output                    nempty,                        // 
  output                    naempty,                       // 
  output                    roverflow,                     // 
  output [AWID:0]           cnt_free,                      // the counter used in fifo for read clock domain 
  output [DBG_WID-1:0]      dbg                            // debug signal
);



//////////////////////////////////////////////////////////////////////////////////
//  signal declare
//////////////////////////////////////////////////////////////////////////////////
wire                     old_ren        ;                     // Read Enable
wire  [DWID-1:0]         old_rdata      ;                     // RAM output data
wire                     old_nempty     ;                     // 
wire                     old_naempty    ;                     // 
wire                     old_roverflow  ;                     // 
 
//////////////////////////////////////////////////////////////////////////////////
//  old fifo
//////////////////////////////////////////////////////////////////////////////////
async_bfifo_reg #(
  .RAM_STYLE   ( RAM_STYLE   ),
  .DWID        ( DWID        ),
  .AWID        ( AWID        ),
  .AFULL_TH    ( AFULL_TH    ),
  .AEMPTY_TH   ( AEMPTY_TH   ),
  .DBG_WID     ( DBG_WID     )
) inst_fifo (
    .wclk         ( wclk          ),                 // write clock
    .wrst         ( wrst          ),                 // write reset
    .wen          ( wen           ),                 // Write enable
    .wdata        ( wdata         ),                 // RAM input data
    .nfull        ( nfull         ),                 // 
    .nafull       ( nafull        ),                 // 
    .woverflow    ( woverflow     ),                 // 
    .cnt_used     ( cnt_used      ),                 // the counter used in fifo for write clock domain
    .rclk         ( rclk          ),                 // Read clock
    .rrst         ( rrst          ),                 // Read reset 
    .ren          ( old_ren       ),                 // Read Enable
    .rdata        ( old_rdata     ),                 // RAM output data
    .nempty       ( old_nempty    ),                 // 
    .naempty      ( naempty       ),                 // 
    .roverflow    ( old_roverflow ),                 // 
    .cnt_free     ( cnt_free      ),                 // the counter used in fifo for read clock domain 
    .dbg          (               )                  // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//  new fifo read interface
//////////////////////////////////////////////////////////////////////////////////
fifo_rdif_tf #(
  .DWID        ( DWID ),
  .AWID        ( AWID )
) inst_fifo_rdif_tf (
  .clk               ( rclk           ),                // Read clock
  .rst               ( rrst           ),                // Read reset 
  .old_ren           ( old_ren        ),                // Read Enable
  .old_rdata         ( old_rdata      ),                // RAM output data
  .old_nempty        ( old_nempty     ),                // 
  .new_ren           ( ren            ),                // Read Enable
  .new_rdata         ( rdata          ),                // RAM output data
  .new_nempty        ( nempty         ),                // 
  .new_roverflow     ( roverflow      )                 // 
);


//////////////////////////////////////////////////////////////////////////////////
//  debug sig
//////////////////////////////////////////////////////////////////////////////////
assign dbg = { 28'h0, woverflow, roverflow, nafull, nempty };


endmodule