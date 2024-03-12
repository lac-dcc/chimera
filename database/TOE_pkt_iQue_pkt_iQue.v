`timescale 1ns / 1ps
module pkt_iQue # (
		parameter    CHN_NUM      = 6	,  
      		parameter MSG_WID  = 20,                                     
      		parameter CELL_CNT_MSB    = 19 		,
      		parameter CELL_CNT_LSB    = 16 		,
      		parameter CHN_ID_MSB      = 15 		,
      		parameter CHN_ID_LSB      = 12  		,
      		parameter CHN_ID_WID      = logb(CHN_NUM) 	,
      		parameter ERR             = 11  		,
      		parameter MTY_MSB         = 8  		,
      		parameter MTY_LSB         = 4  		,
      		parameter SOC             = 3 		,
      		parameter EOC             = 2 		,
      		parameter SOP             = 1  		,
      		parameter EOP             = 0  		,
		parameter    DWID         = 256 ,  
		parameter    PIMWID       = 48  ,  
		parameter    PQMWID       = MSG_WID+PIMWID-CHN_ID_WID     
) (
		input	wire					clk  		,
		input 	wire					rst			,
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
		output  wire [PQMWID-1:0]       fst_cell_msg 				
);
wire 					pq_fifo_wen			;
wire [DWID-1:0] 		pq_fifo_wdata		;
wire [MSG_WID-1:0] 		pq_fifo_wmsg		;
wire [1-1:0] 			pq_fifo_nafull		;
wire 					pq_fifo_ren			;
wire [DWID-1:0] 		pq_fifo_rdata		;
wire [MSG_WID-1:0] 		pq_fifo_rmsg		;
wire [1-1:0] 			pq_fifo_nempty		;
wire [1*CHN_NUM-1:0] 	pq_fifo_mq_wen	    ;
wire [DWID+MSG_WID-1:0] pq_fifo_mq_wdata	;
reg  [1*CHN_NUM-1:0] 	pq_fifo_mq_wen_d1	;
reg  [DWID+MSG_WID-1:0] pq_fifo_mq_wdata_d1	;
wire [1*CHN_NUM-1:0]	pq_fifo_mq_nfull	;
wire [1*CHN_NUM-1:0]	pq_fifo_mq_nafull	;
wire [1*CHN_NUM-1:0] 	pq_fifo_mq_ren		;
wire [DWID+MSG_WID-1:0] pq_fifo_mq_rdata	;
wire [1*CHN_NUM-1:0]	pq_fifo_mq_nempty	;
wire [CHN_ID_WID-1:0] 	pq_fifo_chn_id		;
wire [1-1:0]            pkt_info_vld_d8 	;			
wire [PIMWID-1:0]       pkt_info_msg_d8 	; 			
wire [1-1:0]            info_fifo_ren 		;			
wire [PIMWID-1:0]       info_fifo_rdata 	; 			
wire [1-1:0]            info_fifo_nempty 	;			

pq_wr #(
	.DWID		( DWID+MSG_WID ),
	.SOP_LSB	( 1    ),
	.SOP_MSB	( 1    )
)inst_pq_wr(
	.clk     			( clk  							), 
	.rst    			( rst							),
	.in_cell_vld		( in_cell_vld						),                 
	.in_cell_rdy		( in_cell_rdy						),                 
	.in_cell_dat		( { in_cell_dat    , in_cell_msg  }	),                 
    .fst_cell_wen       ( pq_fifo_wen      				    ),                 
    .fst_cell_wdata     ( { pq_fifo_wdata , pq_fifo_wmsg }  ),                 
    .fst_cell_nafull    ( pq_fifo_nafull   				    )                  
);

async_bfifo #(
  .RAM_STYLE   ( "block"    ), 
  .DWID        ( DWID+MSG_WID ),
  .AWID        ( 9  ),
  .AFULL_TH    ( 8  ),
  .AEMPTY_TH   ( 8  ),
  .DBG_WID     ( 32 )
) pq_fifo (
    .wclk         ( clk                ),                 
    .wrst         ( rst                ),                 
    .wen          ( pq_fifo_wen           ),                 
    .wdata        ( { pq_fifo_wdata, pq_fifo_wmsg } ),                 
    .nfull        (      ),                 
    .nafull       ( pq_fifo_nafull        ),                 
    .woverflow    (      ),                 
    .cnt_used     (      ),                 
    .rclk         ( clk_pd                ),                 
    .rrst         ( rst_pd                ),                 
    .ren          ( pq_fifo_ren           ),                 
    .rdata        ( { pq_fifo_rdata, pq_fifo_rmsg } ),                 
    .nempty       ( pq_fifo_nempty        ),                 
    .naempty      (      ),                 
    .roverflow    (      ),                 
    .cnt_free     (      ),                 
    .dbg          (      )                  
);

assign pq_fifo_ren = (pq_fifo_nempty && (&pq_fifo_mq_nafull)) ? 1'b1 : 1'b0;
assign pq_fifo_chn_id   = pq_fifo_rmsg[CHN_ID_LSB +: CHN_ID_WID];

data_demux #(
		.CHN_NUM ( CHN_NUM  ),				
		.DWID    ( 1 	    )               
)
inst_data_demux  (
		.din     ( pq_fifo_ren 	    )		,		
		.sel 	 ( pq_fifo_chn_id        )		, 		
		.dout    ( pq_fifo_mq_wen    	) 		 		
);
assign pq_fifo_mq_wdata = { pq_fifo_rmsg, pq_fifo_rdata };

always @ ( posedge clk_pd or posedge rst_pd ) 
begin
	if( rst_pd == 1'b1 )begin
		pq_fifo_mq_wen_d1   <= 0;
		pq_fifo_mq_wdata_d1 <=  0 ;
	end	
	else 
	begin
		pq_fifo_mq_wen_d1   <= pq_fifo_mq_wen   ;
		pq_fifo_mq_wdata_d1 <= pq_fifo_mq_wdata ;
	end
end

reg_que_fifo #(
    .RAM_STYLE  ( "block"      ) , 
	.MQNUM      ( CHN_NUM      ) ,                
	.DWID       ( DWID+MSG_WID ) , 
    .AWID       ( 5            ) ,
    .AFULL_TH   ( 4            ) , 
    .AEMPTY_TH  ( 4            ) , 
    .DBG_WID    ( 32           )
) pq_fifo_mq (
    .clk        ( clk_pd               ),              
    .rst        ( rst_pd               ),              
    .wen        ( pq_fifo_mq_wen_d1    ),              
    .wdata      ( pq_fifo_mq_wdata_d1  ),              
    .nfull      ( pq_fifo_mq_nfull     ),              
    .nafull     ( pq_fifo_mq_nafull    ),              
    .woverflow  (                      ),              
    .cnt_free   (                      ),              
    .ren        ( pq_fifo_mq_ren       ),              
    .rdata      ( pq_fifo_mq_rdata     ),              
    .nempty     ( pq_fifo_mq_nempty    ),              
    .naempty    (                      ),              
    .roverflow  (                      ),              
    .cnt_used   (                      ),              
    .dbg        (                      )               
);

data_dly #(
        .DWID    ( PIMWID+1  ),
        .DLY_NUM ( 8         )
)
inst_data_pipe(
        .clk     ( clk  ),
        .rst     ( rst  ),
        .din     ( { pkt_info_vld, pkt_info_msg }           ),
        .dout    ( { pkt_info_vld_d8, pkt_info_msg_d8 } )
);

async_bfifo #(
  .RAM_STYLE   ( "distributed"    ), 
  .DWID        ( PIMWID     ),
  .AWID        ( 5           ),
  .AFULL_TH    ( 16          ), 
  .AEMPTY_TH   ( 4          ),
  .DBG_WID     ( 32         )
) pkt_info_fifo (
    .wclk         ( clk                ),                 
    .wrst         ( rst                ),                 
    .wen          ( pkt_info_vld_d8      ),                 
    .wdata        ( pkt_info_msg_d8      ),                 
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
cell_que #(
    .CHN_NUM               ( CHN_NUM      ),
    .DWID                  ( DWID         ),
    .MSG_WID                 ( MSG_WID        ),
    .PIMWID                ( PIMWID       ),
    .PQMWID                ( PQMWID       )
) inst_cell_sch(
    .clk                    ( clk_pd                 ),
    .rst                    ( rst_pd                 ),
    .info_fifo_ren          ( info_fifo_ren          ),                 
    .info_fifo_rdata        ( info_fifo_rdata        ),                 
    .info_fifo_nempty       ( info_fifo_nempty       ),                 
    .cell_fifo_mq_ren       ( pq_fifo_mq_ren              ),                  
    .cell_fifo_mq_rdata     ( pq_fifo_mq_rdata            ),                  
    .cell_fifo_mq_nempty    ( pq_fifo_mq_nempty           ),                  
    .fst_cell_vld           ( fst_cell_vld           ),                 
    .fst_cell_rdy           ( fst_cell_rdy           ),                 
    .fst_cell_dat           ( fst_cell_dat           ),                 
    .fst_cell_msg           ( fst_cell_msg           )                  
);
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

`timescale 1ns / 1ps
module pq_wr #(
		parameter    DWID         = 128 				    ,  
		parameter    SOP_LSB      = 1    				    ,  
		parameter    SOP_MSB      = 1    				       
)(
		input	wire					clk  				,
		input 	wire					rst					,
		input 	wire [1-1:0] 			in_cell_vld			,           
		output 	wire [1-1:0] 			in_cell_rdy			,           
		input 	wire [DWID-1:0] 		in_cell_dat			,           
		output  wire [1-1:0]            fst_cell_wen 		,			
		input   wire [1-1:0]            fst_cell_nafull 	, 			
		output  wire [DWID-1:0]         fst_cell_wdata 		 			
);
integer   				  i							;
wire     				  sop_flag                  ;
assign sop_flag = in_cell_dat[SOP_MSB: SOP_LSB];
assign fst_cell_wen = ( sop_flag==1'b1 && in_cell_vld==1'b1 ) ? 1'b1 : 1'b0;
assign fst_cell_wdata = in_cell_dat;
assign in_cell_rdy = fst_cell_nafull;
endmodule
