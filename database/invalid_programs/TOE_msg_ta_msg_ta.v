module msg_tx(
		        
		input 	wire [1-1:0] 			pmux_cell_vld		,           
		output 	wire [1-1:0] 			pmux_cell_rdy		,           
		input 	wire [DWID-1:0] 		pmem_cell_dat		,           
		input 	wire [MSG_WID-1:0] 		pmux_cell_msg		,
		
		input   wire [1-1:0]            pkt_info_vld 	,			
		output  wire [1-1:0]            pkt_info_rdy 	, 			
		input   wire [PIMWID-1:0]       pkt_info_msg 	, 	
		
		input	wire					clk_pkt  		,
		input 	wire					rst_pkt			,
		input	wire					clk_pd  		,
		input 	wire					rst_pd			,
		
		output  reg  [1-1:0]            pa_pd_vld 		,			
        input   wire [1-1:0]            pa_pd_rdy 		, 			
        output  reg  [PDWID-1:0]        pa_pd_dat 		
		
);

localparam    REQ_WID      = 38    ;  
localparam    DWID         = DAT_WID    ;
localparam    ECMWID       = 92         ;
localparam    CHN_ID_MSB   = 15         ;
localparam    CHN_ID_LSB   = 12         ;
localparam    CELL_RAM_AWID= 11        ;

wire [1-1:0]            pkt_info_vld   ;      
wire [1-1:0]            pkt_info_rdy   ;       
wire [PIMWID-1:0]       pkt_info_msg   ;       
wire [1-1:0]            fst_cell_vld   ;      
wire [1-1:0]            fst_cell_rdy   ;      
wire [DAT_WID-1:0]      fst_cell_dat   ;      
wire [FCMWID-1:0]       fst_cell_msg   ;  
    
fc_sch # (
        .CHN_NUM      ( CHN_NUM    ),  
        .DWID         ( DAT_WID    ),  
        .MSG_WID      ( MSG_WID    ),  
        .PIMWID       ( PIMWID     ),  
        .FCMWID       ( FCMWID     )   
) u_fc_sch (
        .clk_pkt    ( clk_pkt     ),
        .rst_pkt  ( rst_pkt    ),
        .clk_pd    ( clk_pd      ),
        .rst_pd    ( rst_pd    ),
        .in_cell_vld  ( pmux_cell_vld    ),              
        .in_cell_rdy  ( pmux_cell_rdy    ),              
        .in_cell_dat  ( pmux_cell_dat    ),              
        .in_cell_msg  ( pmux_cell_msg    ),              
        .pkt_info_vld   ( pkt_info_vld     ),    
        .pkt_info_rdy   ( pkt_info_rdy     ),     
        .pkt_info_msg   ( pkt_info_msg     ),     
        .fst_cell_vld   ( fst_cell_vld     ),    
        .fst_cell_rdy   ( fst_cell_rdy     ),     
        .fst_cell_dat   ( fst_cell_dat     ),    
        .fst_cell_msg   ( fst_cell_msg     )    
);
   
pa_tx #(
        .DWID        (DAT_WID     )    ,                               
        .MSG_WID     (MSG_WID     )    ,                               
        .FCMWID      (FCMWID      )    ,        
        .PDWID       (PDWID       )                                    
) u_pa_tx (
        .clk      ( clk_pd   )  ,
        .rst    ( rst_pd   )  ,
        .fst_cell_vld  ( fst_cell_vld   )  ,                       
        .fst_cell_rdy  ( fst_cell_rdy   )  ,                       
        .fst_cell_dat  ( fst_cell_dat   )  ,                       
        .fst_cell_msg  ( fst_cell_msg   )  ,                       
        .out_pd_vld   ( pa_pd_vld )  ,      
        .out_pd_rdy   ( pa_pd_rdy )  ,       
        .out_pd_dat   ( pa_pd_dat )        
);

endmoudule