`timescale 1ns / 1ps
module fc_sch # (
		parameter    CHN_NUM      = 6	,  
      		parameter MSG_WID  = 20,                                     
      		parameter CELL_CNT_MSB    = 19 		,
      		parameter CELL_CNT_LSB    = 16 		,
      		parameter CHN_ID_MSB      = 15 		,
      		parameter CHN_ID_LSB      = 12  		,
      		parameter CHN_ID_WID      = clogb2(CHN_NUM) 	,
      		parameter ERR             = 11  		,
      		parameter MTY_MSB         = 8  		,
      		parameter MTY_LSB         = 4  		,
      		parameter SOC             = 3 		,
      		parameter EOC             = 2 		,
      		parameter SOP             = 1  		,
      		parameter EOP             = 0  		,
		parameter    DWID         = 256 ,  
		parameter    PIMWID       = 48  ,  
		parameter    FCMWID       = MSG_WID+PIMWID-CHN_ID_WID     
) (
		input	wire					clk_pkt  		,
		input 	wire					rst_pkt			,
		input	wire					clk_pd  		,
		input 	wire					rst_pd			,
		input 	wire [1-1:0] 			in_cell_vld		,           
		output 	wire [1-1:0] 			in_cell_rdy		,           
		input 	wire [DWID-1:0] 		in_cell_dat		,           
		input 	wire [MSG_WID-1:0] 		in_cell_msg		,           
		input   wire [1-1:0]            pkt_info_vld 	,			
		output  wire [1-1:0]            pkt_info_rdy 	, 			
		input   wire [PIMWID-1:0]       pkt_info_msg 	, 			
		output  wire [1-1:0]            fst_cell_vld 	,			
		input   wire [1-1:0]            fst_cell_rdy 	, 			
		output  wire [DWID-1:0]         fst_cell_dat 	,			
		output  wire [FCMWID-1:0]       fst_cell_msg 				
);
wire 					fc_fifo_wen			;
wire [DWID-1:0] 		fc_fifo_wdata		;
wire [MSG_WID-1:0] 		fc_fifo_wmsg		;
wire [1-1:0] 			fc_fifo_nafull		;
wire 					fc_fifo_ren			;
wire [DWID-1:0] 		fc_fifo_rdata		;
wire [MSG_WID-1:0] 		fc_fifo_rmsg		;
wire [1-1:0] 			fc_fifo_nempty		;
wire [1*CHN_NUM-1:0] 	        fc_mq_wen			;
wire [DWID+MSG_WID-1:0] 	fc_mq_wdata			;
wire [1*CHN_NUM-1:0] 	        fc_mq_wen_d1			;
wire [DWID+MSG_WID-1:0] 	fc_mq_wdata_d1			;
wire [1*CHN_NUM-1:0]	fc_mq_nfull			;
wire [1*CHN_NUM-1:0]	fc_mq_nafull			;
wire [1*CHN_NUM-1:0] 	fc_mq_ren			;
wire [DWID+MSG_WID-1:0] 	fc_mq_rdata			;
wire [1*CHN_NUM-1:0]	fc_mq_nempty		;
wire [CHN_ID_WID-1:0] 		fc_chn_id			;
wire [1-1:0]            pkt_info_vld_8dly 	;			
wire [PIMWID-1:0]       pkt_info_msg_8dly 	; 			
wire [1-1:0]            info_fifo_ren 		;			
wire [PIMWID-1:0]       info_fifo_rdata 	; 			
wire [1-1:0]            info_fifo_nempty 	;			
fc_wr #(
	.DWID		( DWID+MSG_WID ),
	.SOP_LSB	( 1    ),
	.SOP_MSB	( 1    )
)inst_fc_wr(
	.clk     			( clk_pkt  							), 
	.rst    			( rst_pkt							),
	.in_cell_vld		( in_cell_vld						),                 
	.in_cell_rdy		( in_cell_rdy						),                 
	.in_cell_dat		( { in_cell_dat    , in_cell_msg  }	),                 
    .fst_cell_wen       ( fc_fifo_wen      				    ),                 
    .fst_cell_wdata     ( { fc_fifo_wdata , fc_fifo_wmsg }  ),                 
    .fst_cell_nafull    ( fc_fifo_nafull   				    )                  
);
async_bfifo #(
  .RAM_STYLE   ( "block"    ), 
  .DWID        ( DWID+MSG_WID ),
  .AWID        ( 9  ),
  .AFULL_TH    ( 8  ),
  .AEMPTY_TH   ( 8  ),
  .DBG_WID     ( 32 )
) fc_fifo (
    .wclk         ( clk_pkt                ),                 
    .wrst         ( rst_pkt                ),                 
    .wen          ( fc_fifo_wen           ),                 
    .wdata        ( { fc_fifo_wdata, fc_fifo_wmsg } ),                 
    .nfull        (      ),                 
    .nafull       ( fc_fifo_nafull        ),                 
    .woverflow    (      ),                 
    .cnt_used     (      ),                 
    .rclk         ( clk_pd                ),                 
    .rrst         ( rst_pd                ),                 
    .ren          ( fc_fifo_ren           ),                 
    .rdata        ( { fc_fifo_rdata, fc_fifo_rmsg } ),                 
    .nempty       ( fc_fifo_nempty        ),                 
    .naempty      (      ),                 
    .roverflow    (      ),                 
    .cnt_free     (      ),                 
    .dbg          (      )                  
);
assign fc_fifo_ren = (fc_fifo_nempty==1'b1 && (&fc_mq_nafull)==1'b1) ? 1'b1 : 1'b0;
assign fc_chn_id   = fc_fifo_rmsg[CHN_ID_LSB +: CHN_ID_WID];
data_demux #(
		.CHN_NUM ( CHN_NUM  ),				
		.DWID    ( 1 	    )               
)
inst_data_demux  (
		.din     ( fc_fifo_ren 	    )		,		
		.sel 	 ( fc_chn_id        )		, 		
		.dout    ( fc_mq_wen    	) 		 		
);
assign fc_mq_wdata = { fc_fifo_rmsg, fc_fifo_rdata };
ctrl_pipe #(.DLY_NUM(1), .DWID(CHN_NUM)) u_ctrl_pipe_fc_mq_wen   ( .clk(clk_pd), .rst(rst_pd), .din( fc_mq_wen ), .dout( fc_mq_wen_d1 ) );
data_pipe #(.DLY_NUM(1), .DWID(DWID+MSG_WID) ) u_ctrl_pipe_fc_mq_wdata ( .clk(clk_pd), .rst(rst_pd), .din( fc_mq_wdata ), .dout( fc_mq_wdata_d1 ) );
bfifo_mq_reg #(
    .RAM_STYLE  ( "block"    ) , 
	.MQNUM      ( CHN_NUM    ) ,                
	.DWID       ( DWID+MSG_WID ) , 
    .AWID       ( 5          ) ,
    .AFULL_TH   ( 4          ) , 
    .AEMPTY_TH  ( 4          ) , 
    .DBG_WID    ( 32         )
) fc_fifo_mq (
    .clk        ( clk_pd         ),              
    .rst        ( rst_pd         ),              
    .wen        ( fc_mq_wen_d1       ),              
    .wdata        ( fc_mq_wdata_d1     ),              
    .nfull        ( fc_mq_nfull             ),              
    .nafull        ( fc_mq_nafull        ),              
    .woverflow    (                  ),              
    .cnt_free    (                  ),              
    .ren        ( fc_mq_ren     ),              
    .rdata        ( fc_mq_rdata   ),              
    .nempty        ( fc_mq_nempty  ),              
    .naempty    (                  ),              
    .roverflow    (                  ),              
    .cnt_used    (                  ),              
    .dbg        (                  )               
);
data_pipe #(
        .DWID    ( PIMWID+1  ),
        .DLY_NUM ( 8         )
)
inst_data_pipe(
        .clk     ( clk_pkt  ),
        .rst     ( rst_pkt  ),
        .din     ( { pkt_info_vld, pkt_info_msg }           ),
        .dout    ( { pkt_info_vld_8dly, pkt_info_msg_8dly } )
);
async_bfifo #(
  .RAM_STYLE   ( "distributed"    ), 
  .DWID        ( PIMWID     ),
  .AWID        ( 5           ),
  .AFULL_TH    ( 16          ), 
  .AEMPTY_TH   ( 4          ),
  .DBG_WID     ( 32         )
) pkt_info_fifo (
    .wclk         ( clk_pkt                ),                 
    .wrst         ( rst_pkt                ),                 
    .wen          ( pkt_info_vld_8dly      ),                 
    .wdata        ( pkt_info_msg_8dly      ),                 
    .nfull        (                        ),                 
    .nafull       ( pkt_info_rdy           ),                 
    .woverflow    (                        ),                 
    .cnt_used     (                        ),                 
    .rclk         ( clk_pd                 ),                 
    .rrst         ( rst_pd                 ),                 
    .ren          ( info_fifo_ren          ),                 
    .rdata        ( info_fifo_rdata        ),                 
    .nempty       ( info_fifo_nempty       ),                 
    .naempty      (                        ),                 
    .roverflow    (                        ),                 
    .cnt_free     (                         ),                 
    .dbg          (                         )                  
);
cell_sch #(
    .CHN_NUM               ( CHN_NUM      ),
    .DWID                  ( DWID         ),
    .MSG_WID                 ( MSG_WID        ),
    .PIMWID                ( PIMWID       ),
    .FCMWID                ( FCMWID       )
) inst_cell_sch(
    .clk                      ( clk_pd                 ),
    .rst                      ( rst_pd                 ),
    .info_fifo_ren          ( info_fifo_ren          ),                 
    .info_fifo_rdata        ( info_fifo_rdata        ),                 
    .info_fifo_nempty       ( info_fifo_nempty       ),                 
    .cell_fifo_mq_ren        ( fc_mq_ren              ),                  
    .cell_fifo_mq_rdata        ( fc_mq_rdata            ),                  
    .cell_fifo_mq_nempty    ( fc_mq_nempty           ),                  
    .fst_cell_vld           ( fst_cell_vld           ),                 
    .fst_cell_rdy           ( fst_cell_rdy           ),                 
    .fst_cell_dat           ( fst_cell_dat           ),                 
    .fst_cell_msg           ( fst_cell_msg           )                  
);
function integer clogb2;
  input integer depth;
  integer depth_reg;
    begin
        depth_reg = depth;
        for (clogb2=0; depth_reg>0; clogb2=clogb2+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**clogb2 >= depth*2 )begin
          clogb2 = clogb2 - 1;
        end
    end 
endfunction
endmodule
