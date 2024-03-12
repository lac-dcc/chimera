`timescale 1ns / 1ps
module pre_edit #(
		parameter    DIRECTION    = "RX"			,	
		parameter    PDWID        = 128 			,               
		parameter    PDSZ         = 4 			    ,               
		parameter    REQ_WID      = 38 				, 				
		parameter    ECMWID       = 16'd92     		, 				
		parameter    DWID         = 16'd256 		,               
		parameter    MSG_WID      = 14                              
) (
		input	wire				clk_pd  			,
		input 	wire				rst_pd				,
		input	wire				clk_pkt 			,
		input 	wire				rst_pkt				,
		input 	wire [1-1:0] 			in_pd_vld			,           
		output 	wire [1-1:0] 			in_pd_rdy			,           
		output 	wire [1-1:0] 			in_pmem_rdy			,           
		output 	wire [6-1:0] 			ec_msg_fifo_cnt_used			,  
		input 	wire [PDWID-1:0] 		in_pd_dat			,           
		output  wire [1-1:0]            	pkt_req_vld  			,			
		input   wire [1-1:0]            	pkt_req_rdy  			, 			
		output  wire [REQ_WID-1:0]      	pkt_req_msg  			, 			
		input 	wire [1-1:0] 			in_pkt_vld			,           
		output 	wire [1-1:0] 			in_pkt_rdy			,           
		input 	wire [DWID-1:0] 		in_pkt_dat			,           
		input 	wire [MSG_WID-1:0] 		in_pkt_msg			,           
		output 	wire [1-1:0] 		  	pkt_fifo_naempty        		,           
		output 	wire [1-1:0] 		  	pkt_fifo_nempty        		,           
		input 	wire [1-1:0] 		  	pkt_fifo_ren 			,           
		output 	wire [DWID-1:0] 	  	pkt_fifo_rdata			,           
		output 	wire [MSG_WID-1:0] 	  	pkt_fifo_rmsg			,           
		output 	wire [1-1:0] 			ec_msg_fifo_nempty      	,           
		input 	wire [1-1:0] 			ec_msg_fifo_ren    		,           
		output 	wire [ECMWID-1:0] 		ec_msg_fifo_rdata  		,           
		output 	wire [1-1:0] 			ec_dat_fifo_nempty      	,           
		input 	wire [1-1:0] 			ec_dat_fifo_ren    		,           
		output 	wire [DWID-1:0] 		ec_dat_fifo_rdata  		,           
		input 	wire [47:0] 			cfg_sys_mac0 			,           
		input 	wire [47:0] 			cfg_sys_mac1 			,           
		output 	wire [31:0] 		        dbg_sig				            
);
localparam   CDWID0  = DWID		;
localparam   CDWID1  = ECMWID	;
localparam   CELLSZ0 = 1		;
localparam   CELLSZ1 = 2		;
wire  [       1-1:0] pkt_req_fifo_wen		;
wire  [REQ_WID -1:0] pkt_req_fifo_wdata		;
wire  [       1-1:0] pkt_req_fifo_nfull		;
wire  [       1-1:0] pkt_req_fifo_nafull	;
wire  [       1-1:0] pkt_req_fifo_ren		;
wire  [REQ_WID -1:0] pkt_req_fifo_rdata		;
wire  [       1-1:0] pkt_req_fifo_nempty	;
wire  [       1-1:0] ec_msg_fifo_wen		;
wire  [ECMWID  -1:0] ec_msg_fifo_wdata		;
wire  [       1-1:0] ec_msg_fifo_nfull		;
wire  [       1-1:0] ec_msg_fifo_nafull		;
wire  [       1-1:0] ec_dat_fifo_wen		;
wire  [DWID    -1:0] ec_dat_fifo_wdata		;
wire  [       1-1:0] ec_dat_fifo_nfull		;
wire  [       1-1:0] ec_dat_fifo_nafull		;
wire 					total_pd_vld		;
wire [PDWID*PDSZ-1:0]			total_pd_dat		;
wire [31:0] pkt_req_fifo_dbg_st ;
wire [31:0] in_pkt_fifo_dbg_st  ;
wire [31:0] ec_msg_fifo_dbg_st  ;
wire [31:0] ec_dat_fifo_dbg_st  ;
cpkt_unf #(
	.DWID			( PDWID		),
	.FCMWID			( 1 		),
	.SOC_MSB		( 0 		),
	.SOC_LSB		( 0 		),
	.EOC_MSB		( 0 		),
	.EOC_LSB		( 0 		),
	.CELL_SZ		( PDSZ     	)
)inst_cell_unf(
	.clk     		( clk_pd			), 
	.rst    		( rst_pd 			),
	.cell_vld 		( in_pd_vld			),	
	.cell_dat 		( in_pd_dat			),	
	.cell_msg 		( 1'b0				),	
    .total_cpkt_vld ( total_pd_vld  	), 
	.total_cpkt_dat ( total_pd_dat  	), 
	.total_cpkt_msg (       			) 
);
wire total_pd_rdy;
ec_gen #(
		.DIRECTION   ( DIRECTION     ) ,    
		.PDWID       ( PDWID         ) ,    
		.PDSZ	     ( PDSZ    	     ) ,    
		.DWID        ( DWID          ) ,    
		.ECMWID      ( ECMWID        ) ,	
		.REQ_WID     ( REQ_WID       )  	
) u_ec_gen(
	.clk 				( clk_pd			),
	.rst 				( rst_pd			),
	.total_pd_vld 			( total_pd_vld			),
	.total_pd_dat 			( total_pd_dat			),
	.total_pd_rdy 			( total_pd_rdy			),
	.in_pmem_rdy 			( in_pmem_rdy			),
	.pkt_req_fifo_wen		( pkt_req_fifo_wen		),
	.pkt_req_fifo_wdata		( pkt_req_fifo_wdata		),
	.pkt_req_fifo_nafull		( pkt_req_fifo_nafull		),
	.ec_msg_fifo_wen		( ec_msg_fifo_wen		),
	.ec_msg_fifo_wdata		( ec_msg_fifo_wdata		),
	.ec_msg_fifo_nafull		( ec_msg_fifo_nafull		),
	.ec_dat_fifo_wen		( ec_dat_fifo_wen		),
	.ec_dat_fifo_wdata		( ec_dat_fifo_wdata		),
	.ec_dat_fifo_nafull		( ec_dat_fifo_nafull		),
	.cfg_sys_mac0 			( cfg_sys_mac0			),
	.cfg_sys_mac1 			( cfg_sys_mac1			) ,
	.dbg_sig0               (                       )
);
async_bfifo #(
  .RAM_STYLE   ( "distributed"    ), 
  .DWID        ( REQ_WID          ),
  .AWID        ( 5                ),
  .AFULL_TH    ( 8                ),
  .AEMPTY_TH   ( 8                ),
  .DBG_WID     ( 32               )
) u_pkt_req_fifo (
    .wclk         ( clk_pd              ),       
    .wrst         ( rst_pd              ),       
    .wen          ( pkt_req_fifo_wen    ),       
    .wdata        ( pkt_req_fifo_wdata  ),       
    .nfull        ( pkt_req_fifo_nfull  ),       
    .nafull       ( pkt_req_fifo_nafull ),       
    .woverflow    (                     ),       
    .cnt_used     (                     ),       
    .rclk         ( clk_pkt             ),       
    .rrst         ( rst_pkt             ),       
    .ren          ( pkt_req_fifo_ren    ),       
    .rdata        ( pkt_req_fifo_rdata  ),       
    .nempty       ( pkt_req_fifo_nempty ),       
    .naempty      (                     ),       
    .roverflow    (                     ),       
    .cnt_free     (                     ),       
    .dbg          ( pkt_req_fifo_dbg_st )        
);
assign pkt_req_fifo_ren = pkt_req_fifo_nempty & pkt_req_rdy		;
assign pkt_req_vld      = pkt_req_fifo_ren						;
assign pkt_req_msg      = pkt_req_fifo_rdata					;
async_bfifo #(
  .RAM_STYLE    ( "distributed"   ), 
  .DWID         ( ECMWID          ),
  .AWID         ( 5               ),
  .AFULL_TH     ( 30              ),
  .AEMPTY_TH    ( 8               ),
  .DBG_WID      ( 32              )
) u_ec_msg_fifo (
    .wclk         ( clk_pd              ),       
    .wrst         ( rst_pd              ),       
    .wen          ( ec_msg_fifo_wen     ),       
    .wdata        ( ec_msg_fifo_wdata   ),       
    .nfull        ( ec_msg_fifo_nfull   ),       
    .nafull       ( ec_msg_fifo_nafull  ),       
    .woverflow    (      				),       
    .cnt_used     ( ec_msg_fifo_cnt_used),
    .rclk         ( clk_pkt             ),       
    .rrst         ( rst_pkt             ),       
    .ren          ( ec_msg_fifo_ren     ),       
    .rdata        ( ec_msg_fifo_rdata   ),       
    .nempty       ( ec_msg_fifo_nempty  ),       
    .naempty      (      				),       
    .roverflow    (      				),       
    .cnt_free     (      				),       
    .dbg          ( ec_msg_fifo_dbg_st  )        
);
async_bfifo_reg #(
  .RAM_STYLE   ( "block"    	  ), 
  .DWID        ( DWID 		      ),
  .AWID        ( 5  			      ),
  .AFULL_TH    ( 8              ),
  .AEMPTY_TH   ( 8              ),
  .DBG_WID     ( 32             )
) u_ec_dat_fifo (
    .wclk         ( clk_pd              ),       
    .wrst         ( rst_pd              ),       
    .wen          ( ec_dat_fifo_wen     ),       
    .wdata        ( ec_dat_fifo_wdata   ),       
    .nfull        ( ec_dat_fifo_nfull   ),       
    .nafull       ( ec_dat_fifo_nafull  ),       
    .woverflow    (      				),       
    .cnt_used     (      				),       
    .rclk         ( clk_pkt             ),       
    .rrst         ( rst_pkt             ),       
    .ren          ( ec_dat_fifo_ren     ),       
    .rdata        ( ec_dat_fifo_rdata   ),       
    .nempty       ( ec_dat_fifo_nempty  ),       
    .naempty      (      				),       
    .roverflow    (      				),       
    .cnt_free     (      				),       
    .dbg          ( ec_dat_fifo_dbg_st  )        
);
wire pkt_dat_fifo_nafull;
bfifo_reg #(
    .RAM_STYLE              ( "block"                   ),              
    .DWID                   ( DWID+MSG_WID            	),
    .AWID                   ( 9                         ),
    .AFULL_TH               ( 64                        ),
    .AEMPTY_TH              ( 8                         ),
    .DBG_WID                ( 32                        )
) u_in_pkt_fifo (
    .clk                    ( clk_pkt                   ),              
    .rst                    ( rst_pkt                   ),              
    .wen                    ( in_pkt_vld                ),              
    .wdata                  ( {in_pkt_msg, in_pkt_dat}  ),              
    .nfull                  (        			              ),              
    .nafull                 ( pkt_dat_fifo_nafull       ),              
    .woverflow              (                           ),              
    .cnt_free               (                           ),              
    .ren                    ( pkt_fifo_ren              ),              
    .rdata                  ( {pkt_fifo_rmsg, pkt_fifo_rdata}  ),              
    .nempty                 ( pkt_fifo_nempty           ),              
    .naempty                ( pkt_fifo_naempty          ),              
    .roverflow              (                           ),              
    .cnt_used               (                           ),              
    .dbg_sig                ( in_pkt_fifo_dbg_st        )               
);
assign in_pkt_rdy = pkt_dat_fifo_nafull;
assign in_pd_rdy = total_pd_rdy & in_pkt_rdy;
assign dbg_sig = { 16'h0, pkt_req_fifo_dbg_st[3:0], in_pkt_fifo_dbg_st[3:0], ec_msg_fifo_dbg_st[3:0], ec_dat_fifo_dbg_st[3:0]};
endmodule
