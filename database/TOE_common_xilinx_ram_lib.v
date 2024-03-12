`timescale 1ns / 1ps
module bfifo #(
    	parameter RAM_STYLE  = "distributed",              // Specify RAM style: auto/block/distributed
	parameter DWID       = 18, 
	parameter AWID       = 6, 
	parameter AFULL_TH   = 4, 
	parameter AEMPTY_TH  = 4, 
	parameter DBG_WID    = 32 
) (
  //write clock domain
  input  		    clk,                          // write clock
  input 		    rst,                          // write reset
  input 		    wen,                           // Write enable
  input  [DWID-1:0]   	    wdata,                         // RAM input data
  output                    nfull,                         // 
  output                    nafull,                        // 
  output                    woverflow,                     // 
  output [AWID:0]           cnt_free,                      // the counter used in fifo for read clock domain 
  input                     ren,                           // Read Enable
  output [DWID-1:0]         rdata,                         // RAM output data
  output                    nempty,                        // 
  output                    naempty,                       // 
  output                    roverflow,                     // 
  output [AWID:0]           cnt_used ,                     // the counter used in fifo for write clock domain
  output [DBG_WID-1:0]      dbg_sig                        // debug signal
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
bfifo_reg #(
  .RAM_STYLE   ( RAM_STYLE   ),
  .DWID        ( DWID        ),
  .AWID        ( AWID        ),
  .AFULL_TH    ( AFULL_TH    ),
  .AEMPTY_TH   ( AEMPTY_TH   ),
  .DBG_WID     ( DBG_WID     )
) inst_fifo (
    .clk          ( clk          ),                 // write clock
    .rst          ( rst          ),                 // write reset
    .wen          ( wen           ),                 // Write enable
    .wdata        ( wdata         ),                 // RAM input data
    .nfull        ( nfull         ),                 // 
    .nafull       ( nafull        ),                 // 
    .woverflow    ( woverflow     ),                 // 
    .cnt_used     ( cnt_used      ),                 // the counter used in fifo for write clock domain
    .ren          ( old_ren       ),                 // Read Enable
    .rdata        ( old_rdata     ),                 // RAM output data
    .nempty       ( old_nempty    ),                 // 
    .naempty      ( naempty       ),                 // 
    .roverflow    ( old_roverflow ),                 // 
    .cnt_free     ( cnt_free      ),                 // the counter used in fifo for read clock domain 
    .dbg_sig      (               )                  // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//  new fifo read interface
//////////////////////////////////////////////////////////////////////////////////
fifo_rdif_tf #(
  .DWID        ( DWID ),
  .AWID        ( AWID )
) inst_fifo_rdif_tf (
  .clk               ( clk            ),                // Read clock
  .rst               ( rst            ),                // Read reset 
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
assign dbg_sig = { 28'h0, woverflow, roverflow, nafull, nempty };

endmodule


module bfifo_mq_reg #(
    	parameter RAM_STYLE  = "distributed",              // Specify RAM style: auto/block/distributed
	parameter MQNUM      = 8,                          //the queue num in the fifo 
	parameter DWID       = 18, 
	parameter AWID       = 10, 
	parameter AFULL_TH   = 4, 
	parameter AEMPTY_TH  = 4, 
	parameter DBG_WID    = 32 
) (
  input 		    				clk			,              // write clock
  input 		    				rst			,              // write reset

  input  [1*MQNUM-1:0]				wen			,              // Write enable
  input  [DWID-1:0]   	    		wdata		,              // RAM input data
  output [1*MQNUM-1:0]          	nfull		,              // 
  output [1*MQNUM-1:0]          	nafull		,              // 
  output [1*MQNUM-1:0]          	woverflow	,              // 
  output [(AWID+1)*MQNUM-1:0]		cnt_free	,              // the counter used in fifo for read clock domain 

  input  [1*MQNUM-1:0]				ren			,              // Read Enable
  output [DWID-1:0]   	    		rdata		,              // RAM output data
  output [1*MQNUM-1:0]          	nempty		,              // 
  output [1*MQNUM-1:0]          	naempty		,              // 
  output [1*MQNUM-1:0]          	roverflow	,              // 
  output [(AWID+1)*MQNUM-1:0]		cnt_used	,              // the counter used in fifo for write clock domain

  output reg [DBG_WID*MQNUM-1:0]    dbg                            // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//      local parameter
//////////////////////////////////////////////////////////////////////////////////
localparam MQBIT = logb(MQNUM);

//////////////////////////////////////////////////////////////////////////////////
//      signal declare
//////////////////////////////////////////////////////////////////////////////////
reg  [AWID+MQBIT-1:0] mq_waddr    ;
reg  [AWID+MQBIT-1:0] mq_raddr    ;
//wire [DBG_WID-1:0]    mq_dbg      ;
wire [ 1-1:0]         mq_wen      ;
wire [ 1-1:0]         mq_ren      ;

wire [AWID*MQNUM-1:0] sq_waddr    ;
wire [AWID*MQNUM-1:0] sq_raddr    ;

genvar i;
integer j;
//////////////////////////////////////////////////////////////////////////////////
//      mem instance
//////////////////////////////////////////////////////////////////////////////////
sdp_ram #(
        .RAM_STYLE   ( RAM_STYLE   ),
	.DWID        ( DWID        ), 
	.AWID        ( AWID+MQBIT  ), 
	.DBG_WID     ( DBG_WID     ) 
) inst_sdp_ram (
    .clk     (  clk         ),         // Write clock
    .waddr   (  mq_waddr    ),         // Write address bus, width determined from RAM_DEPTH
    .wen     (  mq_wen      ),         // Write enable
    .wdata   (  wdata       ),         // RAM input data
    .raddr   (  mq_raddr    ),         // Read address bus, width determined from RAM_DEPTH
    .ren     (  mq_ren      ),         // Read Enable, for additional power savings, disable when not in use
    .rdata   (  rdata       ),         // RAM output data
    .dbg     (              )          // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//     mem interface process 
//////////////////////////////////////////////////////////////////////////////////
generate
if(MQBIT!=0) begin
	always @ ( * ) begin
		mq_waddr[AWID+MQBIT-1:AWID] = 0;
		mq_waddr[AWID-1      :0   ] = sq_waddr[0*AWID+:AWID];
		for( j=0; j<MQNUM; j=j+1 )begin
			if( wen[j]==1'b1 ) begin
				mq_waddr[AWID+MQBIT-1:AWID] = j;
				mq_waddr[AWID-1      :0   ] = sq_waddr[j*AWID+:AWID];
			end
		end
	
	end
	
	always @ ( * ) begin
		mq_raddr[AWID+MQBIT-1:AWID] = 0;
		mq_raddr[AWID-1      :0   ] = sq_raddr[0*AWID+:AWID];
		for( j=0; j<MQNUM; j=j+1 )begin
			if( ren[j]==1'b1 ) begin
				mq_raddr[AWID+MQBIT-1:AWID] = j;
				mq_raddr[AWID-1      :0   ] = sq_raddr[j*AWID+:AWID];
			end
		end
	
	end
end
else begin
	always @ ( * ) begin
		mq_waddr[AWID-1      :0   ] = sq_waddr[0*AWID+:AWID];
		for( j=0; j<MQNUM; j=j+1 )begin
			if( wen[j]==1'b1 ) begin
				mq_waddr[AWID-1      :0   ] = sq_waddr[j*AWID+:AWID];
			end
		end
	
	end
	
	always @ ( * ) begin
		mq_raddr[AWID-1      :0   ] = sq_raddr[0*AWID+:AWID];
		for( j=0; j<MQNUM; j=j+1 )begin
			if( ren[j]==1'b1 ) begin
				mq_raddr[AWID-1      :0   ] = sq_raddr[j*AWID+:AWID];
			end
		end
	
	end
end
endgenerate

assign mq_wen = |wen[MQNUM-1:0];
assign mq_ren = |ren[MQNUM-1:0];

generate 
for( i=0; i<MQNUM; i=i+1 ) begin
//////////////////////////////////////////////////////////////////////////////////
//     waddr logic instance 
//////////////////////////////////////////////////////////////////////////////////
fifo_addr_logic #(
	.AWID (AWID)
	)
inst_waddr(
	.clk         ( clk                    ),
	.rst         ( rst                    ),
	.enb         ( nfull[i]               ),
	.inc         ( wen[i]                 ),
	.addr        ( sq_waddr[i*AWID+:AWID] )
	);

//////////////////////////////////////////////////////////////////////////////////
//     raddr logic instance 
//////////////////////////////////////////////////////////////////////////////////
fifo_addr_logic #(
	.AWID (AWID)
	)
inst_raddr(
	.clk         ( clk                    ),
	.rst         ( rst                    ),
	.enb         ( nempty[i]              ),
	.inc         ( ren[i]                 ),
	.addr        ( sq_raddr[i*AWID+:AWID] )
	);

//////////////////////////////////////////////////////////////////////////////////
//     full logic instance
//////////////////////////////////////////////////////////////////////////////////
fifo_full_logic #(
	.AWID        ( AWID       ),
	.AFULL_TH    ( AFULL_TH   )
	)
inst_full_logic(
	.wclk        ( clk                             ),
	.wrst        ( rst                             ),
	.wen         ( wen[i]                          ),
	.waddr       ( sq_waddr[i*AWID+:AWID]          ),
	.raddr       ( sq_raddr[i*AWID+:AWID]          ),
	.nfull       ( nfull[i]                        ),
	.nafull      ( nafull[i]                       ),
	.woverflow   ( woverflow[i]                    ),
	.cnt_free    ( cnt_free[(AWID+1)*i +:(AWID+1)] )
	);

//////////////////////////////////////////////////////////////////////////////////
//     empty logic instance
//////////////////////////////////////////////////////////////////////////////////
fifo_empty_logic #(
	.AWID        ( AWID       ),
	.AEMPTY_TH   ( AEMPTY_TH  )
	)
inst_empty_logic(
	.rclk       ( clk                              ),
	.rrst       ( rst                              ),
	.ren        ( ren[i]                           ),
	.raddr      ( sq_raddr[i*AWID+:AWID]           ),
	.waddr      ( sq_waddr[i*AWID+:AWID]           ),
	.nempty     ( nempty[i]                        ),
	.naempty    ( naempty[i]                       ),
	.roverflow  ( roverflow[i]                     ),
	.cnt_used   ( cnt_used[(AWID+1)*i +:(AWID+1)]  )
	);

//////////////////////////////////////////////////////////////////////////////////
//    debug signal instance
//////////////////////////////////////////////////////////////////////////////////
always @ ( * ) begin
	dbg[ DBG_WID*i +:DBG_WID ] = { {(DBG_WID-4){1'b0}}, roverflow[i], woverflow[i], nempty[i], nafull[i] };
end

end

endgenerate

//  The following function calculates the address width based on specified RAM depth
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction


endmodule

module bfifo_reg #(
    	parameter RAM_STYLE  = "distributed",              // Specify RAM style: auto/block/distributed
	parameter DWID       = 18, 
	parameter AWID       = 10, 
	parameter AFULL_TH   = 4, 
	parameter AEMPTY_TH  = 4, 
	parameter DBG_WID    = 32 
) (
  input 		    clk,                           // write clock
  input 		    rst,                           // write reset
  input 		    wen,                           // Write enable
  input  [DWID-1:0]   	    wdata,                         // RAM input data
  output                    nfull,                         // 
  output                    nafull,                        // 
  output                    woverflow,                     // 
  output [AWID:0]           cnt_free,                      // the counter used in fifo for read clock domain 
  input                     ren,                           // Read Enable
  output [DWID-1:0]         rdata,                         // RAM output data
  output                    nempty,                        // 
  output                    naempty,                       // 
  output                    roverflow,                     // 
  output [AWID:0]           cnt_used ,                     // the counter used in fifo for write clock domain
  output [DBG_WID-1:0]      dbg_sig                        // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//      signal declare
//////////////////////////////////////////////////////////////////////////////////
//generate
//begin
//    if(RAM_STYLE == "distributed")
//    begin
//    end
//    else
//    begin
//        wire [AWID-1:0] waddr;
//    end
//end
//endgenerate
(*max_fanout = 100*)   wire [AWID-1:0] waddr;
wire [AWID-1:0] raddr;

//////////////////////////////////////////////////////////////////////////////////
//      mem instance
//////////////////////////////////////////////////////////////////////////////////
sdp_ram #(
	.RAM_STYLE ( RAM_STYLE ),
	.DWID      ( DWID      ), 
	.AWID      ( AWID      ), 
	.DBG_WID   ( DBG_WID   ) 
) inst_sdp_ram (
    .clk     (  clk         ),         // Write clock
    .waddr   (  waddr       ),         // Write address bus, width determined from RAM_DEPTH
    .wen     (  wen         ),         // Write enable
    .wdata   (  wdata       ),         // RAM input data
    .raddr   (  raddr       ),         // Read address bus, width determined from RAM_DEPTH
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
	.clk         ( clk      ),
	.rst         ( rst      ),
	.enb         (nfull     ),
	.inc         (wen       ),
	.addr        (waddr     )
	);

//////////////////////////////////////////////////////////////////////////////////
//     raddr logic instance 
//////////////////////////////////////////////////////////////////////////////////
fifo_addr_logic #(
	.AWID (AWID)
	)
inst_raddr(
	.clk         ( clk      ),
	.rst         ( rst      ),
	.enb         (nempty    ),
	.inc         (ren       ),
	.addr        (raddr     )
	);

//////////////////////////////////////////////////////////////////////////////////
//     full logic instance
//////////////////////////////////////////////////////////////////////////////////
fifo_full_logic #(
	.AWID        ( AWID       ),
	.AFULL_TH    ( AFULL_TH   )
	)
inst_full_logic(
	.wclk        ( clk        ),
	.wrst        ( rst        ),
	.wen         ( wen        ),
	.waddr       ( waddr      ),
	.raddr       ( raddr      ),
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
	.rclk       ( clk        ),
	.rrst       ( rst        ),
	.ren        ( ren        ),
	.raddr      ( raddr      ),
	.waddr      ( waddr      ),
	.nempty     ( nempty     ),
	.naempty    ( naempty    ),
	.roverflow  ( roverflow  ),
	.cnt_used   ( cnt_used   )
	);

//////////////////////////////////////////////////////////////////////////////////
//  debug sig
//////////////////////////////////////////////////////////////////////////////////
assign dbg_sig = { 28'h0, woverflow, roverflow, nafull, nempty };

endmodule


module xilinx_simple_dual_port_2_clock_bram #(
  parameter RAM_WIDTH = 18,                       // Specify RAM data width
  parameter RAM_DEPTH = 1024,                     // Specify RAM depth (number of entires)
  //parameter RAM_PERFORMANCE = "HIGH_PERFORMANCE", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter RAM_PERFORMANCE = "LOW_LATENCY", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter INIT_FILE = ""                        // Specify name/location of RAM initialization file if using one (leave blank if not)
) (
  input [logb(RAM_DEPTH)-1:0] addra, // Write address bus, width determined from RAM_DEPTH
  input [logb(RAM_DEPTH)-1:0] addrb, // Read address bus, width determined from RAM_DEPTH
  input [RAM_WIDTH-1:0] dina,          // RAM input data
  input clka,                          // Write clock
  input clkb,                          // Read clock
  input wea,                           // Write enable
  input enb,                           // Read Enable, for additional power savings, disable when not in use
  input rstb,                          // Output reset (does not affect memory contents)
  input regceb,                        // Output register enable
  output [RAM_WIDTH-1:0] doutb         // RAM output data
);

  (* ram_extract="yes", ram_style="block" *) reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH-1:0];
  reg [RAM_WIDTH-1:0] ram_data = {RAM_WIDTH{1'b0}};

  // The folowing code either initializes the memory values to a specified file or to all zeros to match hardware
  generate
    if (INIT_FILE != "") begin: use_init_file
      initial
        $readmemh(INIT_FILE, BRAM, 0, RAM_DEPTH-1);
    end else begin: init_bram_to_zero
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
          BRAM[ram_index] = {RAM_WIDTH{1'b0}};
    end
  endgenerate

  always @(posedge clka)
    if (wea)
      BRAM[addra] <= dina; 
       
  always @(posedge clkb)
    if (enb)
      ram_data <= BRAM[addrb];

  //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
  generate
    if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register

      // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
       assign doutb = ram_data;

    end else begin: output_register

      // The following is a 2 clock cycle read latency with improve clock-to-out timing

      reg [RAM_WIDTH-1:0] doutb_reg = {RAM_WIDTH{1'b0}};

      always @(posedge clkb)
        if (rstb)
          doutb_reg <= {RAM_WIDTH{1'b0}};
        else if (regceb)
          doutb_reg <= ram_data;

      assign doutb = doutb_reg;

    end
  endgenerate

//  The following function calculates the address width based on specified RAM depth
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction

endmodule

//  Xilinx Simple Dual Port Single Clock RAM
//  This code implements a paramtizable SDP single clock memory.
//  If a reset or enable is not necessary, it may be tied off or removed from the code.

module xilinx_simple_dual_port_1_clock_bram #(
  parameter RAM_WIDTH = 18,                       // Specify RAM data width
  parameter RAM_DEPTH = 1024,                     // Specify RAM depth (number of entires)
  //parameter RAM_PERFORMANCE = "HIGH_PERFORMANCE", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter RAM_PERFORMANCE = "LOW_LATENCY", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter INIT_FILE = ""                        // Specify name/location of RAM initialization file if using one (leave blank if not)
) (
  input [logb(RAM_DEPTH)-1:0] addra, // Write address bus, width determined from RAM_DEPTH
  input [logb(RAM_DEPTH)-1:0] addrb, // Read address bus, width determined from RAM_DEPTH
  input [RAM_WIDTH-1:0] dina,          // RAM input data
  input clka,                          // Clock
  input wea,                           // Write enable
  input enb,                           // Read Enable, for additional power savings, disable when not in use
  input rstb,                          // Output reset (does not affect memory contents)
  input regceb,                        // Output register enable
  output [RAM_WIDTH-1:0] doutb         // RAM output data
);

  (* ram_extract="yes", ram_style="block" *) reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH-1:0];
  reg [RAM_WIDTH-1:0] ram_data = {RAM_WIDTH{1'b0}};

  // The folowing code either initializes the memory values to a specified file or to all zeros to match hardware
  generate
    if (INIT_FILE != "") begin: use_init_file
      initial begin
        $readmemh(INIT_FILE, BRAM, 0, RAM_DEPTH-1);
      end
	/* synthesis translate_off */ 
      initial begin
	$display("INIT_FILE=%s", INIT_FILE);
      end
	/* synthesis translate_on */ 
    end else begin: init_bram_to_zero
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
          BRAM[ram_index] = {RAM_WIDTH{1'b0}};
    end
  endgenerate

  always @(posedge clka) begin
    if (wea)
      BRAM[addra] <= dina; 
    if (enb)
      ram_data <= BRAM[addrb];
  end        

  //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
  generate
    if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register

      // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
       assign doutb = ram_data;

    end else begin: output_register

      // The following is a 2 clock cycle read latency with improve clock-to-out timing

      reg [RAM_WIDTH-1:0] doutb_reg = {RAM_WIDTH{1'b0}};

      always @(posedge clka)
        if (rstb)
          doutb_reg <= {RAM_WIDTH{1'b0}};
        else if (regceb)
          doutb_reg <= ram_data;

      assign doutb = doutb_reg;

    end
  endgenerate

//  The following function calculates the address width based on specified RAM depth
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction

endmodule


//  Xilinx Simple Dual Port 2 Clock RAM
//  This code implements a paramtizable SDP dual clock memory.
//  If a reset or enable is not necessary, it may be tied off or removed from the code.

module xilinx_simple_dual_port_2_clock_dram #(
  parameter RAM_WIDTH = 18,                       // Specify RAM data width
  parameter RAM_DEPTH = 1024,                     // Specify RAM depth (number of entires)
  //parameter RAM_PERFORMANCE = "HIGH_PERFORMANCE", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter RAM_PERFORMANCE = "LOW_LATENCY", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter INIT_FILE = ""                        // Specify name/location of RAM initialization file if using one (leave blank if not)
) (
  input [logb(RAM_DEPTH)-1:0] addra, // Write address bus, width determined from RAM_DEPTH
  input [logb(RAM_DEPTH)-1:0] addrb, // Read address bus, width determined from RAM_DEPTH
  input [RAM_WIDTH-1:0] dina,          // RAM input data
  input clka,                          // Write clock
  input clkb,                          // Read clock
  input wea,                           // Write enable
  input enb,                           // Read Enable, for additional power savings, disable when not in use
  input rstb,                          // Output reset (does not affect memory contents)
  input regceb,                        // Output register enable
  output [RAM_WIDTH-1:0] doutb         // RAM output data
);

  (* ram_extract="yes", ram_style="distributed" *) reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH-1:0];
  reg [RAM_WIDTH-1:0] ram_data = {RAM_WIDTH{1'b0}};

  // The folowing code either initializes the memory values to a specified file or to all zeros to match hardware
  generate
    if (INIT_FILE != "") begin: use_init_file
      initial
        $readmemh(INIT_FILE, BRAM, 0, RAM_DEPTH-1);
    end else begin: init_bram_to_zero
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
          BRAM[ram_index] = {RAM_WIDTH{1'b0}};
    end
  endgenerate

  always @(posedge clka)
    if (wea)
      BRAM[addra] <= dina; 
       
  always @(posedge clkb)
    if (enb)
      ram_data <= BRAM[addrb];

  //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
  generate
    if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register

      // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
       assign doutb = ram_data;

    end else begin: output_register

      // The following is a 2 clock cycle read latency with improve clock-to-out timing

      reg [RAM_WIDTH-1:0] doutb_reg = {RAM_WIDTH{1'b0}};

      always @(posedge clkb)
        if (rstb)
          doutb_reg <= {RAM_WIDTH{1'b0}};
        else if (regceb)
          doutb_reg <= ram_data;

      assign doutb = doutb_reg;

    end
  endgenerate

//  The following function calculates the address width based on specified RAM depth
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction

endmodule

module sdp_ram #(
    parameter RAM_STYLE  = "distributed",                  // Specify RAM style: auto/block/distributed
	parameter DWID       = 18, 
	parameter AWID       = 10, 
        parameter INIT_FILE  = "",                        // Specify name/location of RAM initialization file if using one (leave blank if not)
	parameter DBG_WID    = 32 
) (
  input 					clk,                           // clock
  input  [AWID-1:0]	        waddr,                         // Write address bus, width determined from RAM_DEPTH
  input 					wen,                           // Write enable
  input  [DWID-1:0]   	    wdata,                         // RAM input data
  input  [AWID-1:0]         raddr,                         // Read address bus, width determined from RAM_DEPTH
  input                     ren,                           // Read Enable, for additional power savings, disable when not in use
  output [DWID-1:0]         rdata,                         // RAM output data
  output [DBG_WID-1:0]      dbg                            // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//      mem instance
//////////////////////////////////////////////////////////////////////////////////
generate
if( RAM_STYLE=="block" ) begin : bram
  xilinx_simple_dual_port_1_clock_bram #(
    .RAM_WIDTH(DWID),                  // Specify RAM data width
    .RAM_DEPTH(2**AWID),            // Specify RAM depth (number of entires)
    .RAM_PERFORMANCE("LOW_LATENCY"),      // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    .INIT_FILE(INIT_FILE)                        // Specify name/location of RAM initialization file if using one (leave blank if not)
  ) inst_sync_sdp_ram (
    .addra(waddr),    // Write address bus, width determined from RAM_DEPTH
    .addrb(raddr),    // Read address bus, width determined from RAM_DEPTH
    .dina(wdata),     // RAM input data, width determined from RAM_WIDTH
    .clka(clk),       // Write clock
    .wea(wen),        // Write enable
    .enb(ren),        // Read Enable, for additional power savings, disable when not in use
    .rstb(1'b0),         // Output reset (does not affect memory contents)
    .regceb(1'b0),       // Output register enable
    .doutb(rdata)     // RAM output data, width determined from RAM_WIDTH
  );
end
else if( RAM_STYLE=="distributed" ) begin : dram
  xilinx_simple_dual_port_1_clock_dram #(
    .RAM_WIDTH(DWID),                  // Specify RAM data width
    .RAM_DEPTH(2**AWID),            // Specify RAM depth (number of entires)
    .RAM_PERFORMANCE("LOW_LATENCY"),      // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    .INIT_FILE(INIT_FILE)                        // Specify name/location of RAM initialization file if using one (leave blank if not)
  ) inst_sync_sdp_ram (
    .addra(waddr),    // Write address bus, width determined from RAM_DEPTH
    .addrb(raddr),    // Read address bus, width determined from RAM_DEPTH
    .dina(wdata),     // RAM input data, width determined from RAM_WIDTH
    .clka(clk),       // Write clock
    .wea(wen),        // Write enable
    .enb(ren),        // Read Enable, for additional power savings, disable when not in use
    .rstb(1'b0),         // Output reset (does not affect memory contents)
    .regceb(1'b0),       // Output register enable
    .doutb(rdata)     // RAM output data, width determined from RAM_WIDTH
  );
end
else begin : auto
  xilinx_simple_dual_port_1_clock_ram #(
    .RAM_WIDTH(DWID),                  // Specify RAM data width
    .RAM_DEPTH(2**AWID),            // Specify RAM depth (number of entires)
    .RAM_PERFORMANCE("LOW_LATENCY"),      // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    .INIT_FILE(INIT_FILE)                        // Specify name/location of RAM initialization file if using one (leave blank if not)
  ) inst_sync_sdp_ram (
    .addra(waddr),    // Write address bus, width determined from RAM_DEPTH
    .addrb(raddr),    // Read address bus, width determined from RAM_DEPTH
    .dina(wdata),     // RAM input data, width determined from RAM_WIDTH
    .clka(clk),       // Write clock
    .wea(wen),        // Write enable
    .enb(ren),        // Read Enable, for additional power savings, disable when not in use
    .rstb(1'b0),         // Output reset (does not affect memory contents)
    .regceb(1'b0),       // Output register enable
    .doutb(rdata)     // RAM output data, width determined from RAM_WIDTH
  );
end

endgenerate

//////////////////////////////////////////////////////////////////////////////////
//     debug process 
//////////////////////////////////////////////////////////////////////////////////
assign dbg = {DBG_WID{1'h0}};

endmodule


//  Xilinx Simple Dual Port Single Clock RAM
//  This code implements a paramtizable SDP single clock memory.
//  If a reset or enable is not necessary, it may be tied off or removed from the code.

module xilinx_simple_dual_port_1_clock_ram #(
  parameter RAM_WIDTH = 18,                       // Specify RAM data width
  parameter RAM_DEPTH = 1024,                     // Specify RAM depth (number of entires)
  //parameter RAM_PERFORMANCE = "HIGH_PERFORMANCE", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter RAM_PERFORMANCE = "LOW_LATENCY", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter INIT_FILE = ""                        // Specify name/location of RAM initialization file if using one (leave blank if not)
) (
  input [logb(RAM_DEPTH)-1:0] addra, // Write address bus, width determined from RAM_DEPTH
  input [logb(RAM_DEPTH)-1:0] addrb, // Read address bus, width determined from RAM_DEPTH
  input [RAM_WIDTH-1:0] dina,          // RAM input data
  input clka,                          // Clock
  input wea,                           // Write enable
  input enb,                           // Read Enable, for additional power savings, disable when not in use
  input rstb,                          // Output reset (does not affect memory contents)
  input regceb,                        // Output register enable
  output [RAM_WIDTH-1:0] doutb         // RAM output data
);

  reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH-1:0];
  reg [RAM_WIDTH-1:0] ram_data = {RAM_WIDTH{1'b0}};

  // The folowing code either initializes the memory values to a specified file or to all zeros to match hardware
  generate
    if (INIT_FILE != "") begin: use_init_file
      initial
        $readmemh(INIT_FILE, BRAM, 0, RAM_DEPTH-1);
    end else begin: init_bram_to_zero
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
          BRAM[ram_index] = {RAM_WIDTH{1'b0}};
    end
  endgenerate

  always @(posedge clka) begin
    if (wea)
      BRAM[addra] <= dina; 
    if (enb)
      ram_data <= BRAM[addrb];
  end        

  //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
  generate
    if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register

      // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
       assign doutb = ram_data;

    end else begin: output_register

      // The following is a 2 clock cycle read latency with improve clock-to-out timing

      reg [RAM_WIDTH-1:0] doutb_reg = {RAM_WIDTH{1'b0}};

      always @(posedge clka)
        if (rstb)
          doutb_reg <= {RAM_WIDTH{1'b0}};
        else if (regceb)
          doutb_reg <= ram_data;

      assign doutb = doutb_reg;

    end
  endgenerate

//  The following function calculates the address width based on specified RAM depth
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction

endmodule

//  Xilinx Simple Dual Port Single Clock RAM
//  This code implements a paramtizable SDP single clock memory.
//  If a reset or enable is not necessary, it may be tied off or removed from the code.

module xilinx_simple_dual_port_1_clock_dram #(
  parameter RAM_WIDTH = 18,                       // Specify RAM data width
  parameter RAM_DEPTH = 1024,                     // Specify RAM depth (number of entires)
  //parameter RAM_PERFORMANCE = "HIGH_PERFORMANCE", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter RAM_PERFORMANCE = "LOW_LATENCY", // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  parameter INIT_FILE = ""                        // Specify name/location of RAM initialization file if using one (leave blank if not)
) (
  input [logb(RAM_DEPTH)-1:0] addra, // Write address bus, width determined from RAM_DEPTH
  input [logb(RAM_DEPTH)-1:0] addrb, // Read address bus, width determined from RAM_DEPTH
  input [RAM_WIDTH-1:0] dina,          // RAM input data
  input clka,                          // Clock
  input wea,                           // Write enable
  input enb,                           // Read Enable, for additional power savings, disable when not in use
  input rstb,                          // Output reset (does not affect memory contents)
  input regceb,                        // Output register enable
  output [RAM_WIDTH-1:0] doutb         // RAM output data
);

  (* ram_extract="yes", ram_style="distributed" *) reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH-1:0];
  reg [RAM_WIDTH-1:0] ram_data = {RAM_WIDTH{1'b0}};

  // The folowing code either initializes the memory values to a specified file or to all zeros to match hardware
  generate
    if (INIT_FILE != "") begin: use_init_file
      initial
        $readmemh(INIT_FILE, BRAM, 0, RAM_DEPTH-1);
    end else begin: init_bram_to_zero
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
          BRAM[ram_index] = {RAM_WIDTH{1'b0}};
    end
  endgenerate

  always @(posedge clka) begin
    if (wea)
      BRAM[addra] <= dina; 
    if (enb)
      ram_data <= BRAM[addrb];
  end        

  //  The following code generates HIGH_PERFORMANCE (use output register) or LOW_LATENCY (no output register)
  generate
    if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register

      // The following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
       assign doutb = ram_data;

    end else begin: output_register

      // The following is a 2 clock cycle read latency with improve clock-to-out timing

      reg [RAM_WIDTH-1:0] doutb_reg = {RAM_WIDTH{1'b0}};

      always @(posedge clka)
        if (rstb)
          doutb_reg <= {RAM_WIDTH{1'b0}};
        else if (regceb)
          doutb_reg <= ram_data;

      assign doutb = doutb_reg;

    end
  endgenerate

//  The following function calculates the address width based on specified RAM depth
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction

endmodule
