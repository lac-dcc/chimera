`timescale 1ns / 1ps
module tcp_tx #(
		parameter    PDWID        = 128 			,               		
		parameter    PDSZ         = 4 			    	,               		
		parameter    REQ_WID      = 12 				, 				
		parameter    REQ_SZ       = 1 				, 				
		parameter    RSLT_SZ	  = 2    			, 				
		parameter    TAB_AWID     = 8 			        ,       			
		parameter    TAB_DWID     = 128			        ,	       			
		parameter    DBG_WID      = 32			        	       			
) (
		input	wire				clk		 	,
		input 	wire				rst			,
		input 	wire [1-1:0] 			in_pd_vld		,           
		output 	wire [1-1:0] 			in_pd_rdy		,           
		input 	wire [PDWID-1:0] 		in_pd_dat		,           
		output 	wire [1-1:0] 			out_pd_vld		,           
		input 	wire [1-1:0] 			out_pd_rdy		,           
		output 	wire [PDWID-1:0] 		out_pd_dat		,           
		output  wire [1-1:0]            	tab_rreq_fifo_wen  	,	    
		input   wire [1-1:0]            	tab_rreq_fifo_nafull	, 	    
		output  wire [TAB_AWID-1:0]      	tab_rreq_fifo_wdata 	, 	    
		input 	wire [1-1:0] 			tab_rdat_fifo_wen 	,           
		output 	wire [1-1:0] 			tab_rdat_fifo_nafull 	,           
		input 	wire [TAB_DWID-1:0]		tab_rdat_fifo_wdata  	,           
		output 	wire [1-1:0] 			tab_wreq_fifo_wen 	,           
		input 	wire [1-1:0] 			tab_wreq_fifo_nafull 	,           
		output 	wire [TAB_AWID-1:0] 		tab_wreq_fifo_wdata 	,           
		output 	wire [1-1:0] 			tab_wdat_fifo_wen 	,           
		input 	wire [1-1:0] 			tab_wdat_fifo_nafull 	,           
		output 	wire [TAB_DWID-1:0] 		tab_wdat_fifo_wdata 	,           
		input 	wire [31:0] 			cfg_sec_cnt 			,           
		input 	wire [47:0] 			cfg_sys_mac0 			,           
		input 	wire [47:0] 			cfg_sys_mac1 			,           
		input 	wire [31:0] 			cfg_sys_ip0 			,           
		input 	wire [31:0] 			cfg_sys_ip1 			,           
		input 	wire [15:0] 			cfg_toe_port0 			,           
		input 	wire [15:0] 			cfg_toe_port1 			,           
		input 	wire [31:0] 			cfg_sys_win 			,           
	    input 	wire [31:0] 				cfg_moe_bd_th    		,           
        input   wire [15:0]         cnt_write_bd_num    ,
        input   wire [15:0]         cnt_read_bd_num     ,
	if_cfg_reg_toe.sink  u_if_cfg_reg_toe ,
	if_dbg_reg_toe       u_if_dbg_reg_toe ,
		output	wire [DBG_WID-1:0]		tcpt_tab_act_dbg_sig	,						
		output	wire [DBG_WID-1:0]		dbg_sig							
);
localparam TAB_INFO_WID = 2;
wire				tab_info_fifo_wen	;
wire	[TAB_INFO_WID-1:0]	tab_info_fifo_wdata	;
wire				tab_info_fifo_nafull	;
wire				tab_info_fifo_ren	;
wire	[TAB_INFO_WID-1:0]	tab_info_fifo_rdata	;
wire				tab_info_fifo_nempty	;
wire				tab_info_fifo_naempty	;
wire				sync_info_vld   ;
wire	[TAB_INFO_WID-1:0]	sync_info_dat   ;
wire				sync_info_rdy	;
wire				pd_fifo_wen	;
wire	[PDWID-1:0]		pd_fifo_wdata	;
wire				pd_fifo_nafull	;
wire				pd_fifo_ren	;
wire	[PDWID-1:0]		pd_fifo_rdata	;
wire				pd_fifo_nempty	;
wire				pd_fifo_naempty	;
wire				sync_pd_vld   ;
wire	[PDWID-1:0]		sync_pd_dat   ;
wire				sync_pd_rdy	;
wire				rslt_fifo_ren		;
wire	[TAB_DWID-1:0]		rslt_fifo_rdata		;
wire				rslt_fifo_nempty  	;
wire				rslt_fifo_naempty	;
wire				sync_rslt_vld	;
wire	[TAB_DWID-1:0]		sync_rslt_dat	;
wire				sync_rslt_rdy  	;
tcp_tx_tab_req #(
	.PDWID			( PDWID			),
	.TAB_AWID		( TAB_AWID		),
	.TAB_INFO_WID		( TAB_INFO_WID 		) 
)u_tcpt_tab_req(
	.clk     		( clk		), 
	.rst    		( rst 		),
	.in_pd_vld		( in_pd_vld		),
	.in_pd_rdy		( in_pd_rdy		),
	.in_pd_dat		( in_pd_dat		),
	.tab_rreq_fifo_wen	( tab_rreq_fifo_wen	),
	.tab_rreq_fifo_wdata	( tab_rreq_fifo_wdata	),
	.tab_rreq_fifo_nafull	( tab_rreq_fifo_nafull	),
	.tab_info_fifo_wen	( tab_info_fifo_wen	),
	.tab_info_fifo_wdata	( tab_info_fifo_wdata	),
	.tab_info_fifo_nafull	( tab_info_fifo_nafull	),
	.pd_fifo_wen		( pd_fifo_wen		),
	.pd_fifo_wdata		( pd_fifo_wdata		),
	.pd_fifo_nafull		( pd_fifo_nafull	) 
);
bfifo #(
    .RAM_STYLE              ( "block"                   ),              
    .DWID                   ( TAB_DWID                  ),
    .AWID                   ( 6                         ),
    .AFULL_TH               ( 8                         ),
    .AEMPTY_TH              ( 8                         ),
    .DBG_WID                ( 32                        )
) u_tab_rslt_fifo (
    .clk                    ( clk                       ),              
    .rst                    ( rst                       ),              
    .wen                    ( tab_rdat_fifo_wen         ),              
    .wdata                  ( tab_rdat_fifo_wdata       ),              
    .nfull                  (        			),              
    .nafull                 ( tab_rdat_fifo_nafull      ),              
    .woverflow              (                           ),              
    .cnt_free               (                           ),              
    .ren                    ( rslt_fifo_ren             ),              
    .rdata                  ( rslt_fifo_rdata           ),              
    .nempty                 ( rslt_fifo_nempty          ),              
    .naempty                ( rslt_fifo_naempty         ),              
    .roverflow              (                           ),              
    .cnt_used               (                           ),              
    .dbg_sig                (                           )               
);
bfifo #(
    .RAM_STYLE              ( "distributed"             ),              
    .DWID                   ( TAB_INFO_WID              ),
    .AWID                   ( 5                         ),
    .AFULL_TH               ( 8                         ),
    .AEMPTY_TH              ( 8                         ),
    .DBG_WID                ( 32                        )
) u_info_fifo (
    .clk                    ( clk                       ),              
    .rst                    ( rst                       ),              
    .wen                    ( tab_info_fifo_wen         ),              
    .wdata                  ( tab_info_fifo_wdata       ),              
    .nfull                  ( tab_info_fifo_nfull       ),              
    .nafull                 ( tab_info_fifo_nafull      ),              
    .woverflow              (                           ),              
    .cnt_free               (                           ),              
    .ren                    ( tab_info_fifo_ren         ),              
    .rdata                  ( tab_info_fifo_rdata       ),              
    .nempty                 ( tab_info_fifo_nempty      ),              
    .naempty                ( tab_info_fifo_naempty     ),              
    .roverflow              (                           ),              
    .cnt_used               (                           ),              
    .dbg_sig                (                           )               
);
bfifo #(
    .RAM_STYLE              ( "block"                   ),              
    .DWID                   ( PDWID                     ),
    .AWID                   ( 6                         ),
    .AFULL_TH               ( 8                         ),
    .AEMPTY_TH              ( 8                         ),
    .DBG_WID                ( 32                        )
) u_pd_fifo (
    .clk                    ( clk                       ),              
    .rst                    ( rst                       ),              
    .wen                    ( pd_fifo_wen               ),              
    .wdata                  ( pd_fifo_wdata             ),              
    .nfull                  (              		),              
    .nafull                 ( pd_fifo_nafull            ),              
    .woverflow              (                           ),              
    .cnt_free               (                           ),              
    .ren                    ( pd_fifo_ren               ),              
    .rdata                  ( pd_fifo_rdata             ),              
    .nempty                 ( pd_fifo_nempty            ),              
    .naempty                ( pd_fifo_naempty           ),              
    .roverflow              (                           ),              
    .cnt_used               (                           ),              
    .dbg_sig                (                           )               
);
mfifo_sync_4tab #(
		.CELL_CHN_NUM	( 2				) ,
		.CDWID       	( {TAB_DWID, PDWID	}	) ,
		.CELLSZ      	( {16'd2  , 16'd4	}	) ,
		.MAX_CELLSZ     ( 4			    	) ,
		.CDWID_SUM      ( TAB_DWID+PDWID 		)  
) u_mfifo_sync_tcpr (
		.clk 			( clk 					) ,
		.rst			( rst					) ,
		.in_info_nempty		( tab_info_fifo_nempty			) ,
		.in_info_ren		( tab_info_fifo_ren			) ,
		.in_info_rdata		( tab_info_fifo_rdata		 	) ,
		.in_cell_nempty   	( {rslt_fifo_nempty, pd_fifo_nempty } 	) ,
		.in_cell_ren    	( {rslt_fifo_ren,    pd_fifo_ren    } 	) ,
		.in_cell_rdata    	( {rslt_fifo_rdata,  pd_fifo_rdata  } 	) ,
		.out_info_vld    	( sync_info_vld    			) ,     
		.out_info_rdy    	( sync_info_rdy    			) ,
		.out_info_dat    	( sync_info_dat    			) ,
		.out_cell_vld   	( {sync_rslt_vld,  sync_pd_vld  } 	) ,
		.out_cell_rdy   	( {sync_rslt_rdy,  sync_pd_rdy  } 	) ,
		.out_cell_dat   	( {sync_rslt_dat,  sync_pd_dat  } 	) ,
		.dbg_sig        	(             			        )  
);
tcp_tx_tab_act #(
	.PDWID        ( PDWID         ) ,
	.PDSZ         ( PDSZ          ) ,
	.REQ_WID      ( REQ_WID       ) ,
	.REQ_SZ       ( REQ_SZ        ) ,
	.RSLT_SZ      ( RSLT_SZ	      ) ,
	.TAB_INFO_WID ( TAB_INFO_WID  ) ,
	.TAB_AWID     ( TAB_AWID      ) ,
	.TAB_DWID     ( TAB_DWID      ) ,
	.DBG_WID      ( DBG_WID       ) 
) u_tcpt_tab_act ( 
	.clk              	( clk              	),
	.rst	  		( rst	  		),
	.sync_info_vld     	( sync_info_vld     	),
	.sync_info_rdy     	( sync_info_rdy     	),
	.sync_info_dat     	( sync_info_dat     	),
	.sync_rslt_vld	  	( sync_rslt_vld	  	),
	.sync_rslt_rdy	  	( sync_rslt_rdy	  	),
	.sync_rslt_dat	  	( sync_rslt_dat	  	),
	.sync_pd_vld      	( sync_pd_vld      	),
	.sync_pd_rdy      	( sync_pd_rdy      	),
	.sync_pd_dat      	( sync_pd_dat      	),
        .out_pd_vld      	( out_pd_vld      	),
	.out_pd_rdy      	( out_pd_rdy      	),
	.out_pd_dat      	( out_pd_dat      	),
        .tab_wreq_fifo_wen	( tab_wreq_fifo_wen	),
	.tab_wreq_fifo_nafull	( tab_wreq_fifo_nafull	),
	.tab_wreq_fifo_wdata	( tab_wreq_fifo_wdata	),
        .tab_wdat_fifo_wen	( tab_wdat_fifo_wen	),
	.tab_wdat_fifo_nafull	( tab_wdat_fifo_nafull	),
	.tab_wdat_fifo_wdata	( tab_wdat_fifo_wdata	),
	.cfg_sys_mac0 		( cfg_sys_mac0 		),           
	.cfg_sys_mac1 		( cfg_sys_mac1 		),           
	.cfg_sys_ip0 		( cfg_sys_ip0 		),           
	.cfg_sys_ip1 		( cfg_sys_ip1 		),           
	.cfg_toe_port0 		( cfg_toe_port0 	),           
	.cfg_toe_port1 		( cfg_toe_port1 	),           
	.cfg_sys_win 		( cfg_sys_win 		),           
		.cfg_moe_bd_th    ( cfg_moe_bd_th    	      ),           
    .cnt_write_bd_num   ( cnt_write_bd_num      ),
    .cnt_read_bd_num    ( cnt_read_bd_num       ),
	  .u_if_cfg_reg_toe    (u_if_cfg_reg_toe   ),
	  .u_if_dbg_reg_toe    (u_if_dbg_reg_toe   ),
	.dbg_sig		( tcpt_tab_act_dbg_sig	)
);
assign dbg_sig = 32'h0;
endmodule
