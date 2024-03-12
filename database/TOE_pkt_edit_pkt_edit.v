module pkt_edit #(
		parameter    DAT_TYP      = "ETH"     		,
		parameter    ECMWID       = 16'd92     		,		
		parameter    DAT_WID      = 16'd256 		,               
		parameter    EOP_POS      = 1        		,               
		parameter    OMSG_WID     = MSG_WID+60    	,
		parameter    DIRECTION    = "RX"			,	
		parameter    PDWID        = 128 			,               
		parameter    PDSZ         = 4 			    ,               
		parameter    REQ_WID      = 38 				, 
		parameter    MSG_WID      = 14  		

)(
		input	wire				    clk_pd  			  ,
		input 	wire				    rst_pd				  ,
		input	wire				    clk_pkt 			  ,
		input 	wire				    rst_pkt				  ,
		input 	wire [1-1:0] 			in_pd_vld	 	       ,           
		output 	wire [1-1:0] 			in_pd_rdy	 	       ,           
		output 	wire [1-1:0] 			tcpr_pmem_rdy         ,           
		output 	wire [6-1:0] 			ec_msg_fifo_cnt_used  ,  
		input 	wire [PDWID-1:0] 		tcpr_pd_dat	 	   ,           
		output  wire [1-1:0]            pkt_req_vld  	 	  	,			
		input   wire [1-1:0]            pkt_req_rdy  	 	  	, 			
		output  wire [REQ_WID-1:0]      pkt_req_msg  	 	  	, 			
		input 	wire [1-1:0] 			in_pkt_vld	 	       ,           
		output 	wire [1-1:0] 			in_pkt_rdy	 	       ,           
		input 	wire [DAT_WID-1:0] 		in_pkt_dat	 	       ,           
		input 	wire [MSG_WID-1:0] 		in_pkt_msg	 	       ,           
 
 		output 	wire  [1-1:0] 			out_pkt_vld		,           
		input 	wire [1-1:0] 			out_pkt_rdy		,           
		output 	wire [DAT_WID-1:0] 		out_pkt_dat		,           
		output 	wire [OMSG_WID-1:0] 	out_pkt_msg		,  
		
		input 	wire [47:0] 			cfg_sys_mac0 			,           
		input 	wire [47:0] 			cfg_sys_mac1 			, 
		output 	wire [31:0] 			toe_rx_prepe_dbg        ,
		output 	wire [31:0] 	        pe_dbg_sig
);
          
wire [1-1:0] 			prepe_pkt_fifo_naempty	        ;           
wire [1-1:0] 			prepe_pkt_fifo_nempty	        ;           
wire [1-1:0] 			prepe_pkt_fifo_ren	        ;           
wire [DAT_WID-1:0] 		prepe_pkt_fifo_rdata	        ;           
wire [MSG_WID-1:0] 	prepe_pkt_fifo_rmsg	        ;           
wire [1-1:0] 			ec_msg_fifo_nempty	        ;           
wire [1-1:0] 			ec_msg_fifo_ren   	        ;           
wire [ECMWID-1:0] 		ec_msg_fifo_rdata 	        ;           
wire [1-1:0] 			ec_dat_fifo_nempty	        ;           
wire [1-1:0] 			ec_dat_fifo_ren   	        ;           
wire [DAT_WID-1:0] 		ec_dat_fifo_rdata 	        ;            
pre_edit #(
		.DIRECTION    ( "RX"         ),         
		.PDWID        ( PDWID        ),         
		.PDSZ         ( PDSZ         ),         
		.REQ_WID      ( REQ_WID      ), 	
		.ECMWID       ( ECMWID       ), 	
		.DWID         ( DAT_WID      ),         
		.MSG_WID      ( MSG_WID      )          
) u_pre_edit (
		.clk_pd  		         ( clk_pd  		          ),
		.rst_pd			         ( rst_pd		          ),
		.clk_pkt 		         ( clk_pkt 		          ),
		.rst_pkt		         ( rst_pkt		          ),
		.in_pd_vld		         ( in_pd_vld	 	      ),           
		.in_pd_rdy		         ( in_pd_rdy	 	      ),           
		.ec_msg_fifo_cnt_used    ( ec_msg_fifo_cnt_used   ),           
		.in_pmem_rdy	         ( tcpr_pmem_rdy	       ),           
		.in_pd_dat		         ( tcpr_pd_dat	 	       ),           
		.pkt_req_vld  		     ( pkt_req_vld  	 	   ),			
		.pkt_req_rdy  		     ( pkt_req_rdy  	 	   ), 			
		.pkt_req_msg  		     ( pkt_req_msg  	 	   ), 			
		.in_pkt_vld		         ( in_pkt_vld	 	        ),           
		.in_pkt_rdy		         ( in_pkt_rdy	 	        ),           
		.in_pkt_dat		         ( in_pkt_dat	 	        ),           
		.in_pkt_msg		         ( in_pkt_msg	 	        ),           
		.pkt_fifo_naempty        ( prepe_pkt_fifo_naempty	 ),           
		.pkt_fifo_nempty         ( prepe_pkt_fifo_nempty	 ),           
		.pkt_fifo_ren	         ( prepe_pkt_fifo_ren	 ),           
		.pkt_fifo_rdata	         ( prepe_pkt_fifo_rdata	 ),           
		.pkt_fifo_rmsg	         ( prepe_pkt_fifo_rmsg	 ),           
		.ec_msg_fifo_nempty	     ( ec_msg_fifo_nempty	 ),           
		.ec_msg_fifo_ren   	     ( ec_msg_fifo_ren   	 ),           
		.ec_msg_fifo_rdata 	     ( ec_msg_fifo_rdata 	 ),           
		.ec_dat_fifo_nempty	     ( ec_dat_fifo_nempty	 ),           
		.ec_dat_fifo_ren   	     ( ec_dat_fifo_ren   	 ),           
		.ec_dat_fifo_rdata 	     ( ec_dat_fifo_rdata 	 ),            
		.cfg_sys_mac0 		     ( cfg_sys_mac0		     ),
		.cfg_sys_mac1 		     ( cfg_sys_mac1		     ),
		.dbg_sig  		         ( toe_rx_prepe_dbg       )
);
wire [1-1:0] 			pe_pkt_vld			;           
wire [1-1:0] 			pe_pkt_rdy			;           
wire [DAT_WID-1:0] 		pe_pkt_dat			;           
wire [MSG_WID-1:0] 		pe_pkt_msg			;    
       
rx_edit #(
		.DAT_TYP      ( "APP"    ) ,
		.DWID         ( DAT_WID  ) ,               
		.MSG_WID      ( MSG_WID  ) ,               
		.ECMWID       ( ECMWID   ) ,		
		.OMSG_WID     ( OMSG_WID ) ,               
		.EOP_POS      ( 1        )                 
) u_rx_edit (
		.clk      			( clk_pkt      	 ),
		.rst  				( rst_pkt  	 ),
		.pkt_fifo_naempty        	( prepe_pkt_fifo_naempty	 ),           
		.pkt_fifo_nempty        	( prepe_pkt_fifo_nempty	 ),           
		.pkt_fifo_ren	        	( prepe_pkt_fifo_ren	 ),           
		.pkt_fifo_rdata	        	( prepe_pkt_fifo_rdata	 ),           
		.pkt_fifo_rmsg	        	( prepe_pkt_fifo_rmsg	 ),           
		.ec_msg_fifo_nempty		( ec_msg_fifo_nempty	 ),           
		.ec_msg_fifo_ren   		( ec_msg_fifo_ren   	 ),           
		.ec_msg_fifo_rdata 		( ec_msg_fifo_rdata 	 ),           
		.ec_dat_fifo_nempty		( ec_dat_fifo_nempty	 ),           
		.ec_dat_fifo_ren   		( ec_dat_fifo_ren   	 ),           
		.ec_dat_fifo_rdata 		( ec_dat_fifo_rdata 	 ),            
		.out_pkt_vld			( out_pkt_vld	 ),           
		.out_pkt_rdy			( out_pkt_rdy   ),           
		.out_pkt_dat			( out_pkt_dat	 ),           
		.out_pkt_msg			( out_pkt_msg	 ),            
		.dbg_sig 			( pe_dbg_sig	 )            
);

endmodule