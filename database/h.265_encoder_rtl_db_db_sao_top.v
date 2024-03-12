//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-------------------------------------------------------------------
// Filename       : db_sao_top.v
// Author         : Chewein
// Created        : 2015-03-16
// Description    : TOP module of SAO 
//-------------------------------------------------------------------

module db_sao_top(
                   clk                         ,
                   rst_n                       ,
                   dp_i                        ,
				   dq_i                        ,
				   op_i                        ,
				   oq_i                        ,
                   op_enable_i                 , 
				   oq_enable_i                 ,
                   is_luma_i                   ,
				   is_ver_i                    ,
                   data_end_i                  ,
                   sao_data_o           				   
				);
//---------------------------------------------------------------------------
//
//                        INPUT/OUTPUT DECLARATION 
//
//----------------------------------------------------------------------------
parameter DATA_WIDTH	=	 128	             ;
parameter PIXEL_WIDTH   =    8                   ;
parameter DIFF_WIDTH    =    20                  ;
parameter DIS_WIDTH     =    25                  ;

input                        clk	             ;
input                        rst_n	             ;
input    [DATA_WIDTH-1:0] 	 dp_i  	             ; // pixels after deblocking 
input    [DATA_WIDTH-1:0] 	 dq_i  	             ; // pixels after deblocking
input    [DATA_WIDTH-1:0] 	 op_i  	             ; // pixels of    original 
input    [DATA_WIDTH-1:0] 	 oq_i  	             ; // pixels of    original 
input                        op_enable_i         ; // original pixel enable
input                        oq_enable_i         ; // original pixel enable

input                        is_luma_i           ;
input                        is_ver_i            ; 
input                        data_end_i          ;

output  [           16:0]    sao_data_o          ;
//---------------------------------------------------------------------------
//
//         wire declaration 
//
//---------------------------------------------------------------------------
wire                         is_hor_w            ;
wire                         state_clear_w       ;
reg                          data_end_r          ; // calculation num and state over

wire          [ 7:0 ]        dp_0_0_w            ;
wire          [ 7:0 ]        dp_0_1_w            ;
wire          [ 7:0 ]        dp_0_2_w            ;
wire          [ 7:0 ]        dp_0_3_w            ;
wire          [ 7:0 ]        dp_1_0_w            ;
wire          [ 7:0 ]        dp_1_1_w            ;
wire          [ 7:0 ]        dp_1_2_w            ;
wire          [ 7:0 ]        dp_1_3_w            ;
wire          [ 7:0 ]        dp_2_0_w            ;
wire          [ 7:0 ]        dp_2_1_w            ;
wire          [ 7:0 ]        dp_2_2_w            ;
wire          [ 7:0 ]        dp_2_3_w            ;
wire          [ 7:0 ]        dp_3_0_w            ;
wire          [ 7:0 ]        dp_3_1_w            ;
wire          [ 7:0 ]        dp_3_2_w            ;
wire          [ 7:0 ]        dp_3_3_w            ;

wire          [ 7:0 ]        dq_0_0_w            ;
wire          [ 7:0 ]        dq_0_1_w            ;
wire          [ 7:0 ]        dq_0_2_w            ;
wire          [ 7:0 ]        dq_0_3_w            ;
wire          [ 7:0 ]        dq_1_0_w            ;
wire          [ 7:0 ]        dq_1_1_w            ;
wire          [ 7:0 ]        dq_1_2_w            ;
wire          [ 7:0 ]        dq_1_3_w            ;
wire          [ 7:0 ]        dq_2_0_w            ;
wire          [ 7:0 ]        dq_2_1_w            ;
wire          [ 7:0 ]        dq_2_2_w            ;
wire          [ 7:0 ]        dq_2_3_w            ;
wire          [ 7:0 ]        dq_3_0_w            ;
wire          [ 7:0 ]        dq_3_1_w            ;
wire          [ 7:0 ]        dq_3_2_w            ;
wire          [ 7:0 ]        dq_3_3_w            ;

wire          [ 7:0 ]        op_0_0_w            ;
wire          [ 7:0 ]        op_0_1_w            ;
wire          [ 7:0 ]        op_0_2_w            ;
wire          [ 7:0 ]        op_0_3_w            ;
wire          [ 7:0 ]        op_1_0_w            ;
wire          [ 7:0 ]        op_1_1_w            ;
wire          [ 7:0 ]        op_1_2_w            ;
wire          [ 7:0 ]        op_1_3_w            ;
wire          [ 7:0 ]        op_2_0_w            ;
wire          [ 7:0 ]        op_2_1_w            ;
wire          [ 7:0 ]        op_2_2_w            ;
wire          [ 7:0 ]        op_2_3_w            ;
wire          [ 7:0 ]        op_3_0_w            ;
wire          [ 7:0 ]        op_3_1_w            ;
wire          [ 7:0 ]        op_3_2_w            ;
wire          [ 7:0 ]        op_3_3_w            ;

wire          [ 7:0 ]        oq_0_0_w            ;
wire          [ 7:0 ]        oq_0_1_w            ;
wire          [ 7:0 ]        oq_0_2_w            ;
wire          [ 7:0 ]        oq_0_3_w            ;
wire          [ 7:0 ]        oq_1_0_w            ;
wire          [ 7:0 ]        oq_1_1_w            ;
wire          [ 7:0 ]        oq_1_2_w            ;
wire          [ 7:0 ]        oq_1_3_w            ;
wire          [ 7:0 ]        oq_2_0_w            ;
wire          [ 7:0 ]        oq_2_1_w            ;
wire          [ 7:0 ]        oq_2_2_w            ;
wire          [ 7:0 ]        oq_2_3_w            ;
wire          [ 7:0 ]        oq_3_0_w            ;
wire          [ 7:0 ]        oq_3_1_w            ;
wire          [ 7:0 ]        oq_3_2_w            ;
wire          [ 7:0 ]        oq_3_3_w            ;

wire          [287:0]        ominusdp_0_0_w      ; // original minus deblocking pixels    
wire          [287:0]        ominusdp_0_1_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_0_2_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_0_3_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_1_0_w      ; // original minus deblocking pixels    
wire          [287:0]        ominusdp_1_1_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_1_2_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_1_3_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_2_0_w      ; // original minus deblocking pixels    
wire          [287:0]        ominusdp_2_1_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_2_2_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_2_3_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_3_0_w      ; // original minus deblocking pixels    
wire          [287:0]        ominusdp_3_1_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_3_2_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdp_3_3_w      ; // original minus deblocking pixels      

wire          [287:0]        ominusdq_0_0_w      ; // original minus deblocking pixels    
wire          [287:0]        ominusdq_0_1_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_0_2_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_0_3_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_1_0_w      ; // original minus deblocking pixels    
wire          [287:0]        ominusdq_1_1_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_1_2_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_1_3_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_2_0_w      ; // original minus deblocking pixels    
wire          [287:0]        ominusdq_2_1_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_2_2_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_2_3_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_3_0_w      ; // original minus deblocking pixels    
wire          [287:0]        ominusdq_3_1_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_3_2_w      ; // original minus deblocking pixels      
wire          [287:0]        ominusdq_3_3_w      ; // original minus deblocking pixels

wire          [ 31:0]        indexp_0_0_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_0_1_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_0_2_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_0_3_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_1_0_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_1_1_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_1_2_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_1_3_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_2_0_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_2_1_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_2_2_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_2_3_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_3_0_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_3_1_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_3_2_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexp_3_3_w          ; // deblocking pixels index : the bit =1 is the index 

wire          [ 31:0]        indexq_0_0_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_0_1_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_0_2_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_0_3_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_1_0_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_1_1_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_1_2_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_1_3_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_2_0_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_2_1_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_2_2_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_2_3_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_3_0_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_3_1_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_3_2_w          ; // deblocking pixels index : the bit =1 is the index 
wire          [ 31:0]        indexq_3_3_w          ; // deblocking pixels index : the bit =1 is the index 




//---------------------------------------------------------------------------
//
// calculation the difference between original and deblocking pixels       
//
//----------------------------------------------------------------------------
assign   is_hor_w      =     !is_ver_i           ;   
assign   state_clear_w =     !is_luma_i          ;

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        data_end_r   <=    1'b0                  ;
	else 
	    data_end_r   <=    data_end_i            ;
end 

assign   dp_0_0_w  =         dp_i[  7:0  ]       ;
assign   dp_0_1_w  =         dp_i[ 15:8  ]       ;
assign   dp_0_2_w  =         dp_i[ 23:16 ]       ;
assign   dp_0_3_w  =         dp_i[ 31:24 ]       ;
assign   dp_1_0_w  =         dp_i[ 39:32 ]       ;
assign   dp_1_1_w  =         dp_i[ 47:40 ]       ;
assign   dp_1_2_w  =         dp_i[ 55:48 ]       ;
assign   dp_1_3_w  =         dp_i[ 63:56 ]       ;
assign   dp_2_0_w  =         dp_i[ 71:64 ]       ;
assign   dp_2_1_w  =         dp_i[ 79:72 ]       ;
assign   dp_2_2_w  =         dp_i[ 87:80 ]       ;
assign   dp_2_3_w  =         dp_i[ 95:88 ]       ;
assign   dp_3_0_w  =         dp_i[103:96 ]       ;
assign   dp_3_1_w  =         dp_i[111:104]       ;
assign   dp_3_2_w  =         dp_i[119:112]       ;
assign   dp_3_3_w  =         dp_i[127:120]       ;

assign   dq_0_0_w  =         dq_i[  7:0  ]       ;
assign   dq_0_1_w  =         dq_i[ 15:8  ]       ;
assign   dq_0_2_w  =         dq_i[ 23:16 ]       ;
assign   dq_0_3_w  =         dq_i[ 31:24 ]       ;
assign   dq_1_0_w  =         dq_i[ 39:32 ]       ;
assign   dq_1_1_w  =         dq_i[ 47:40 ]       ;
assign   dq_1_2_w  =         dq_i[ 55:48 ]       ;
assign   dq_1_3_w  =         dq_i[ 63:56 ]       ;
assign   dq_2_0_w  =         dq_i[ 71:64 ]       ;
assign   dq_2_1_w  =         dq_i[ 79:72 ]       ;
assign   dq_2_2_w  =         dq_i[ 87:80 ]       ;
assign   dq_2_3_w  =         dq_i[ 95:88 ]       ;
assign   dq_3_0_w  =         dq_i[103:96 ]       ;
assign   dq_3_1_w  =         dq_i[111:104]       ;
assign   dq_3_2_w  =         dq_i[119:112]       ;
assign   dq_3_3_w  =         dq_i[127:120]       ;

assign   op_0_0_w  =         op_i[  7:0  ]       ;
assign   op_0_1_w  =         op_i[ 15:8  ]       ;
assign   op_0_2_w  =         op_i[ 23:16 ]       ;
assign   op_0_3_w  =         op_i[ 31:24 ]       ;
assign   op_1_0_w  =         op_i[ 39:32 ]       ;
assign   op_1_1_w  =         op_i[ 47:40 ]       ;
assign   op_1_2_w  =         op_i[ 55:48 ]       ;
assign   op_1_3_w  =         op_i[ 63:56 ]       ;
assign   op_2_0_w  =         op_i[ 71:64 ]       ;
assign   op_2_1_w  =         op_i[ 79:72 ]       ;
assign   op_2_2_w  =         op_i[ 87:80 ]       ;
assign   op_2_3_w  =         op_i[ 95:88 ]       ;
assign   op_3_0_w  =         op_i[103:96 ]       ;
assign   op_3_1_w  =         op_i[111:104]       ;
assign   op_3_2_w  =         op_i[119:112]       ;
assign   op_3_3_w  =         op_i[127:120]       ;

assign   oq_0_0_w  =         oq_i[  7:0  ]       ;
assign   oq_0_1_w  =         oq_i[ 15:8  ]       ;
assign   oq_0_2_w  =         oq_i[ 23:16 ]       ;
assign   oq_0_3_w  =         oq_i[ 31:24 ]       ;
assign   oq_1_0_w  =         oq_i[ 39:32 ]       ;
assign   oq_1_1_w  =         oq_i[ 47:40 ]       ;
assign   oq_1_2_w  =         oq_i[ 55:48 ]       ;
assign   oq_1_3_w  =         oq_i[ 63:56 ]       ;
assign   oq_2_0_w  =         oq_i[ 71:64 ]       ;
assign   oq_2_1_w  =         oq_i[ 79:72 ]       ;
assign   oq_2_2_w  =         oq_i[ 87:80 ]       ;
assign   oq_2_3_w  =         oq_i[ 95:88 ]       ;
assign   oq_3_0_w  =         oq_i[103:96 ]       ;
assign   oq_3_1_w  =         oq_i[111:104]       ;
assign   oq_3_2_w  =         oq_i[119:112]       ;
assign   oq_3_3_w  =         oq_i[127:120]       ;


db_sao_cal_diff up_0_0_w(
                   .dp_i          ( dp_0_0_w      ),
				   .op_i          ( op_0_0_w      ),
				   .data_valid_i  ( op_enable_i   ),
				   .ominusdp_o    ( ominusdp_0_0_w),
				   .index_o       ( indexp_0_0_w  )
				   );

db_sao_cal_diff up_0_1_w(
                   .dp_i          ( dp_0_1_w      ),
				   .op_i          ( op_0_1_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_0_1_w),
				   .index_o       ( indexp_0_1_w  )				   
				   );

db_sao_cal_diff up_0_2_w(
                   .dp_i          ( dp_0_2_w      ),
				   .op_i          ( op_0_2_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_0_2_w),
				   .index_o       ( indexp_0_2_w  )				   
				   );

db_sao_cal_diff up_0_3_w(
                   .dp_i          ( dp_0_3_w      ),
				   .op_i          ( op_0_3_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_0_3_w),
				   .index_o       ( indexp_0_3_w  )				   
				   );				   

db_sao_cal_diff up_1_0_w(
                   .dp_i          ( dp_1_0_w      ),
				   .op_i          ( op_1_0_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_1_0_w),
				   .index_o       ( indexp_1_0_w  )				   
				   );

db_sao_cal_diff up_1_1_w(
                   .dp_i          ( dp_1_1_w      ),
				   .op_i          ( op_1_1_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_1_1_w),
				   .index_o       ( indexp_1_1_w  )	
				   );

db_sao_cal_diff up_1_2_w(
                   .dp_i          ( dp_1_2_w      ),
				   .op_i          ( op_1_2_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_1_2_w),
				   .index_o       ( indexp_1_2_w  )	
				   );

db_sao_cal_diff up_1_3_w(
                   .dp_i          ( dp_1_3_w      ),
				   .op_i          ( op_1_3_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_1_3_w),
				   .index_o       ( indexp_1_3_w  )	
				   );	
				   
db_sao_cal_diff up_2_0_w(
                   .dp_i          ( dp_2_0_w      ),
				   .op_i          ( op_2_0_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_2_0_w),
				   .index_o       ( indexp_2_0_w  )	
				   );

db_sao_cal_diff up_2_1_w(
                   .dp_i          ( dp_2_1_w      ),
				   .op_i          ( op_2_1_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_2_1_w),
				   .index_o       ( indexp_2_1_w  )	
				   );

db_sao_cal_diff up_2_2_w(
                   .dp_i          ( dp_2_2_w      ),
				   .op_i          ( op_2_2_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_2_2_w),
				   .index_o       ( indexp_2_2_w  )	
				   );

db_sao_cal_diff up_2_3_w(
                   .dp_i          ( dp_2_3_w      ),
				   .op_i          ( op_2_3_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_2_3_w),
				   .index_o       ( indexp_2_3_w  )	
				   );
				   
db_sao_cal_diff up_3_0_w(
                   .dp_i          ( dp_3_0_w      ),
				   .op_i          ( op_3_0_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_3_0_w),
				   .index_o       ( indexp_3_0_w  )	
				   );

db_sao_cal_diff up_3_1_w(
                   .dp_i          ( dp_3_1_w      ),
				   .op_i          ( op_3_1_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_3_1_w),
				   .index_o       ( indexp_3_1_w  )	
				   );

db_sao_cal_diff up_3_2_w(
                   .dp_i          ( dp_3_2_w      ),
				   .op_i          ( op_3_2_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_3_2_w),
				   .index_o       ( indexp_3_2_w  )	
				   );

db_sao_cal_diff up_3_3_w(
                   .dp_i          ( dp_3_3_w      ),
				   .op_i          ( op_3_3_w      ),
				   .data_valid_i  ( op_enable_i   ),				   
				   .ominusdp_o    ( ominusdp_3_3_w),
				   .index_o       ( indexp_3_3_w  )	
				   );	

db_sao_cal_diff uq_0_0_w(
                   .dp_i          ( dq_0_0_w      ),
				   .op_i          ( oq_0_0_w      ),
				   .data_valid_i  ( oq_enable_i   ),				   
				   .ominusdp_o    ( ominusdq_0_0_w),
				   .index_o       ( indexq_0_0_w  )	
				   );

db_sao_cal_diff uq_0_1_w(
                   .dp_i          ( dq_0_1_w      ),
				   .op_i          ( oq_0_1_w      ),
				   .data_valid_i  ( oq_enable_i   ),				   
				   .ominusdp_o    ( ominusdq_0_1_w),
				   .index_o       ( indexq_0_1_w  )
				   );

db_sao_cal_diff uq_0_2_w(
                   .dp_i          ( dq_0_2_w      ),
				   .op_i          ( oq_0_2_w      ),
				   .data_valid_i  ( oq_enable_i   ),				   
				   .ominusdp_o    ( ominusdq_0_2_w),
				   .index_o       ( indexq_0_2_w  )
				   );

db_sao_cal_diff uq_0_3_w(
                   .dp_i          ( dq_0_3_w      ),
				   .op_i          ( oq_0_3_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_0_3_w),
				   .index_o       ( indexq_0_3_w  )
				   );				   

db_sao_cal_diff uq_1_0_w(
                   .dp_i          ( dq_1_0_w      ),
				   .op_i          ( oq_1_0_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_1_0_w),
				   .index_o       ( indexq_1_0_w  )
				   );

db_sao_cal_diff uq_1_1_w(
                   .dp_i          ( dq_1_1_w      ),
				   .op_i          ( oq_1_1_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_1_1_w),
				   .index_o       ( indexq_1_1_w  )
				   );

db_sao_cal_diff uq_1_2_w(
                   .dp_i          ( dq_1_2_w      ),
				   .op_i          ( oq_1_2_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_1_2_w),
				   .index_o       ( indexq_1_2_w  )
				   );

db_sao_cal_diff uq_1_3_w(
                   .dp_i          ( dq_1_3_w      ),
				   .op_i          ( oq_1_3_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_1_3_w),
				   .index_o       ( indexq_1_3_w  )
				   );
				   
db_sao_cal_diff uq_2_0_w(
                   .dp_i          ( dq_2_0_w      ),
				   .op_i          ( oq_2_0_w      ),	
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_2_0_w),
				   .index_o       ( indexq_2_0_w  )
				   );

db_sao_cal_diff uq_2_1_w(
                   .dp_i          ( dq_2_1_w      ),
				   .op_i          ( oq_2_1_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_2_1_w),
				   .index_o       ( indexq_2_1_w  )
				   );

db_sao_cal_diff uq_2_2_w(
                   .dp_i          ( dq_2_2_w      ),
				   .op_i          ( oq_2_2_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_2_2_w),
				   .index_o       ( indexq_2_2_w  )
				   );

db_sao_cal_diff uq_2_3_w(
                   .dp_i          ( dq_2_3_w      ),
				   .op_i          ( oq_2_3_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_2_3_w),
				   .index_o       ( indexq_2_3_w  )
				   );
				   
db_sao_cal_diff uq_3_0_w(
                   .dp_i          ( dq_3_0_w      ),
				   .op_i          ( oq_3_0_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_3_0_w),
				   .index_o       ( indexq_3_0_w  )
				   );

db_sao_cal_diff uq_3_1_w(
                   .dp_i          ( dq_3_1_w      ),
				   .op_i          ( oq_3_1_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_3_1_w),
				   .index_o       ( indexq_3_1_w  )
				   );

db_sao_cal_diff uq_3_2_w(
                   .dp_i          ( dq_3_2_w      ),
				   .op_i          ( oq_3_2_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_3_2_w),
				   .index_o       ( indexq_3_2_w  )
				   );

db_sao_cal_diff uq_3_3_w(
                   .dp_i          ( dq_3_3_w      ),
				   .op_i          ( oq_3_3_w      ),
				   .data_valid_i  ( oq_enable_i   ),
				   .ominusdp_o    ( ominusdq_3_3_w),
				   .index_o       ( indexq_3_3_w  )
				   );					   

//---------------------------------------------------------------------------
//
//      accumulation 
//
//----------------------------------------------------------------------------

wire   signed [DIFF_WIDTH-6:0]  b_state_0_w      ; // band 0 
wire   signed [DIFF_WIDTH-6:0]  b_state_1_w      ; // band 1 
wire   signed [DIFF_WIDTH-6:0]  b_state_2_w      ; // band 2 
wire   signed [DIFF_WIDTH-6:0]  b_state_3_w      ; // band 3 
wire   signed [DIFF_WIDTH-6:0]  b_state_4_w      ; // band 4 
wire   signed [DIFF_WIDTH-6:0]  b_state_5_w      ; // band 5 
wire   signed [DIFF_WIDTH-6:0]  b_state_6_w      ; // band 6 
wire   signed [DIFF_WIDTH-6:0]  b_state_7_w      ; // band 7 
wire   signed [DIFF_WIDTH-6:0]  b_state_8_w      ; // band 8 
wire   signed [DIFF_WIDTH-6:0]  b_state_9_w      ; // band 9 
wire   signed [DIFF_WIDTH-6:0]  b_state_10_w     ; // band 10 
wire   signed [DIFF_WIDTH-6:0]  b_state_11_w     ; // band 11 
wire   signed [DIFF_WIDTH-6:0]  b_state_12_w     ; // band 12 
wire   signed [DIFF_WIDTH-6:0]  b_state_13_w     ; // band 13 
wire   signed [DIFF_WIDTH-6:0]  b_state_14_w     ; // band 14 
wire   signed [DIFF_WIDTH-6:0]  b_state_15_w     ; // band 15 
wire   signed [DIFF_WIDTH-6:0]  b_state_16_w     ; // band 16 
wire   signed [DIFF_WIDTH-6:0]  b_state_17_w     ; // band 17 
wire   signed [DIFF_WIDTH-6:0]  b_state_18_w     ; // band 18 
wire   signed [DIFF_WIDTH-6:0]  b_state_19_w     ; // band 19 
wire   signed [DIFF_WIDTH-6:0]  b_state_20_w     ; // band 20 
wire   signed [DIFF_WIDTH-6:0]  b_state_21_w     ; // band 21 
wire   signed [DIFF_WIDTH-6:0]  b_state_22_w     ; // band 22 
wire   signed [DIFF_WIDTH-6:0]  b_state_23_w     ; // band 23 
wire   signed [DIFF_WIDTH-6:0]  b_state_24_w     ; // band 24 
wire   signed [DIFF_WIDTH-6:0]  b_state_25_w     ; // band 25 
wire   signed [DIFF_WIDTH-6:0]  b_state_26_w     ; // band 26 
wire   signed [DIFF_WIDTH-6:0]  b_state_27_w     ; // band 27 
wire   signed [DIFF_WIDTH-6:0]  b_state_28_w     ; // band 28 
wire   signed [DIFF_WIDTH-6:0]  b_state_29_w     ; // band 29 
wire   signed [DIFF_WIDTH-6:0]  b_state_30_w     ; // band 30 
wire   signed [DIFF_WIDTH-6:0]  b_state_31_w     ; // band 31 

reg    signed [DIFF_WIDTH-1:0]  b_state_0_r      ; // band 0 
reg    signed [DIFF_WIDTH-1:0]  b_state_1_r      ; // band 1 
reg    signed [DIFF_WIDTH-1:0]  b_state_2_r      ; // band 2 
reg    signed [DIFF_WIDTH-1:0]  b_state_3_r      ; // band 3 
reg    signed [DIFF_WIDTH-1:0]  b_state_4_r      ; // band 4 
reg    signed [DIFF_WIDTH-1:0]  b_state_5_r      ; // band 5 
reg    signed [DIFF_WIDTH-1:0]  b_state_6_r      ; // band 6 
reg    signed [DIFF_WIDTH-1:0]  b_state_7_r      ; // band 7 
reg    signed [DIFF_WIDTH-1:0]  b_state_8_r      ; // band 8 
reg    signed [DIFF_WIDTH-1:0]  b_state_9_r      ; // band 9 
reg    signed [DIFF_WIDTH-1:0]  b_state_10_r     ; // band 10 
reg    signed [DIFF_WIDTH-1:0]  b_state_11_r     ; // band 11 
reg    signed [DIFF_WIDTH-1:0]  b_state_12_r     ; // band 12 
reg    signed [DIFF_WIDTH-1:0]  b_state_13_r     ; // band 13 
reg    signed [DIFF_WIDTH-1:0]  b_state_14_r     ; // band 14 
reg    signed [DIFF_WIDTH-1:0]  b_state_15_r     ; // band 15 
reg    signed [DIFF_WIDTH-1:0]  b_state_16_r     ; // band 16 
reg    signed [DIFF_WIDTH-1:0]  b_state_17_r     ; // band 17 
reg    signed [DIFF_WIDTH-1:0]  b_state_18_r     ; // band 18 
reg    signed [DIFF_WIDTH-1:0]  b_state_19_r     ; // band 19 
reg    signed [DIFF_WIDTH-1:0]  b_state_20_r     ; // band 20 
reg    signed [DIFF_WIDTH-1:0]  b_state_21_r     ; // band 21 
reg    signed [DIFF_WIDTH-1:0]  b_state_22_r     ; // band 22 
reg    signed [DIFF_WIDTH-1:0]  b_state_23_r     ; // band 23 
reg    signed [DIFF_WIDTH-1:0]  b_state_24_r     ; // band 24 
reg    signed [DIFF_WIDTH-1:0]  b_state_25_r     ; // band 25 
reg    signed [DIFF_WIDTH-1:0]  b_state_26_r     ; // band 26 
reg    signed [DIFF_WIDTH-1:0]  b_state_27_r     ; // band 27 
reg    signed [DIFF_WIDTH-1:0]  b_state_28_r     ; // band 28 
reg    signed [DIFF_WIDTH-1:0]  b_state_29_r     ; // band 29 
reg    signed [DIFF_WIDTH-1:0]  b_state_30_r     ; // band 30 
reg    signed [DIFF_WIDTH-1:0]  b_state_31_r     ; // band 31 

wire          [   5   :  0   ]  b_num_0_w        ; // band 0 
wire          [   5   :  0   ]  b_num_1_w        ; // band 1 
wire          [   5   :  0   ]  b_num_2_w        ; // band 2 
wire          [   5   :  0   ]  b_num_3_w        ; // band 3 
wire          [   5   :  0   ]  b_num_4_w        ; // band 4 
wire          [   5   :  0   ]  b_num_5_w        ; // band 5 
wire          [   5   :  0   ]  b_num_6_w        ; // band 6 
wire          [   5   :  0   ]  b_num_7_w        ; // band 7 
wire          [   5   :  0   ]  b_num_8_w        ; // band 8 
wire          [   5   :  0   ]  b_num_9_w        ; // band 9 
wire          [   5   :  0   ]  b_num_10_w       ; // band 10 
wire          [   5   :  0   ]  b_num_11_w       ; // band 11 
wire          [   5   :  0   ]  b_num_12_w       ; // band 12 
wire          [   5   :  0   ]  b_num_13_w       ; // band 13 
wire          [   5   :  0   ]  b_num_14_w       ; // band 14 
wire          [   5   :  0   ]  b_num_15_w       ; // band 15 
wire          [   5   :  0   ]  b_num_16_w       ; // band 16 
wire          [   5   :  0   ]  b_num_17_w       ; // band 17 
wire          [   5   :  0   ]  b_num_18_w       ; // band 18 
wire          [   5   :  0   ]  b_num_19_w       ; // band 19 
wire          [   5   :  0   ]  b_num_20_w       ; // band 20 
wire          [   5   :  0   ]  b_num_21_w       ; // band 21 
wire          [   5   :  0   ]  b_num_22_w       ; // band 22 
wire          [   5   :  0   ]  b_num_23_w       ; // band 23 
wire          [   5   :  0   ]  b_num_24_w       ; // band 24 
wire          [   5   :  0   ]  b_num_25_w       ; // band 25 
wire          [   5   :  0   ]  b_num_26_w       ; // band 26 
wire          [   5   :  0   ]  b_num_27_w       ; // band 27 
wire          [   5   :  0   ]  b_num_28_w       ; // band 28 
wire          [   5   :  0   ]  b_num_29_w       ; // band 29 
wire          [   5   :  0   ]  b_num_30_w       ; // band 30 
wire          [   5   :  0   ]  b_num_31_w       ; // band 31 

reg           [   12  :  0   ]  b_num_0_r        ; // band 0 
reg           [   12  :  0   ]  b_num_1_r        ; // band 1 
reg           [   12  :  0   ]  b_num_2_r        ; // band 2 
reg           [   12  :  0   ]  b_num_3_r        ; // band 3 
reg           [   12  :  0   ]  b_num_4_r        ; // band 4 
reg           [   12  :  0   ]  b_num_5_r        ; // band 5 
reg           [   12  :  0   ]  b_num_6_r        ; // band 6 
reg           [   12  :  0   ]  b_num_7_r        ; // band 7 
reg           [   12  :  0   ]  b_num_8_r        ; // band 8 
reg           [   12  :  0   ]  b_num_9_r        ; // band 9 
reg           [   12  :  0   ]  b_num_10_r       ; // band 10 
reg           [   12  :  0   ]  b_num_11_r       ; // band 11 
reg           [   12  :  0   ]  b_num_12_r       ; // band 12 
reg           [   12  :  0   ]  b_num_13_r       ; // band 13 
reg           [   12  :  0   ]  b_num_14_r       ; // band 14 
reg           [   12  :  0   ]  b_num_15_r       ; // band 15 
reg           [   12  :  0   ]  b_num_16_r       ; // band 16 
reg           [   12  :  0   ]  b_num_17_r       ; // band 17 
reg           [   12  :  0   ]  b_num_18_r       ; // band 18 
reg           [   12  :  0   ]  b_num_19_r       ; // band 19 
reg           [   12  :  0   ]  b_num_20_r       ; // band 20 
reg           [   12  :  0   ]  b_num_21_r       ; // band 21 
reg           [   12  :  0   ]  b_num_22_r       ; // band 22 
reg           [   12  :  0   ]  b_num_23_r       ; // band 23 
reg           [   12  :  0   ]  b_num_24_r       ; // band 24 
reg           [   12  :  0   ]  b_num_25_r       ; // band 25 
reg           [   12  :  0   ]  b_num_26_r       ; // band 26 
reg           [   12  :  0   ]  b_num_27_r       ; // band 27 
reg           [   12  :  0   ]  b_num_28_r       ; // band 28 
reg           [   12  :  0   ]  b_num_29_r       ; // band 29 
reg           [   12  :  0   ]  b_num_30_r       ; // band 30 
reg           [   12  :  0   ]  b_num_31_r       ; // band 31 



// created by shell script ../../scripts/b_state.sh
wire signed   [ 8:0 ] p_0_0_0_w , p_0_0_1_w , p_0_0_2_w , p_0_0_3_w  ;   
wire signed   [ 8:0 ] p_0_0_4_w , p_0_0_5_w , p_0_0_6_w , p_0_0_7_w  ;   
wire signed   [ 8:0 ] p_0_0_8_w , p_0_0_9_w , p_0_0_10_w, p_0_0_11_w ;   
wire signed   [ 8:0 ] p_0_0_12_w, p_0_0_13_w, p_0_0_14_w, p_0_0_15_w ;   
wire signed   [ 8:0 ] p_0_0_16_w, p_0_0_17_w, p_0_0_18_w, p_0_0_19_w ;   
wire signed   [ 8:0 ] p_0_0_20_w, p_0_0_21_w, p_0_0_22_w, p_0_0_23_w ;   
wire signed   [ 8:0 ] p_0_0_24_w, p_0_0_25_w, p_0_0_26_w, p_0_0_27_w ;   
wire signed   [ 8:0 ] p_0_0_28_w, p_0_0_29_w, p_0_0_30_w, p_0_0_31_w ; 

wire signed   [ 8:0 ] p_0_1_0_w , p_0_1_1_w , p_0_1_2_w , p_0_1_3_w  ;   
wire signed   [ 8:0 ] p_0_1_4_w , p_0_1_5_w , p_0_1_6_w , p_0_1_7_w  ;   
wire signed   [ 8:0 ] p_0_1_8_w , p_0_1_9_w , p_0_1_10_w, p_0_1_11_w ;   
wire signed   [ 8:0 ] p_0_1_12_w, p_0_1_13_w, p_0_1_14_w, p_0_1_15_w ;   
wire signed   [ 8:0 ] p_0_1_16_w, p_0_1_17_w, p_0_1_18_w, p_0_1_19_w ;   
wire signed   [ 8:0 ] p_0_1_20_w, p_0_1_21_w, p_0_1_22_w, p_0_1_23_w ;   
wire signed   [ 8:0 ] p_0_1_24_w, p_0_1_25_w, p_0_1_26_w, p_0_1_27_w ;   
wire signed   [ 8:0 ] p_0_1_28_w, p_0_1_29_w, p_0_1_30_w, p_0_1_31_w ; 

wire signed   [ 8:0 ] p_0_2_0_w , p_0_2_1_w , p_0_2_2_w , p_0_2_3_w  ;   
wire signed   [ 8:0 ] p_0_2_4_w , p_0_2_5_w , p_0_2_6_w , p_0_2_7_w  ;   
wire signed   [ 8:0 ] p_0_2_8_w , p_0_2_9_w , p_0_2_10_w, p_0_2_11_w ;   
wire signed   [ 8:0 ] p_0_2_12_w, p_0_2_13_w, p_0_2_14_w, p_0_2_15_w ;   
wire signed   [ 8:0 ] p_0_2_16_w, p_0_2_17_w, p_0_2_18_w, p_0_2_19_w ;   
wire signed   [ 8:0 ] p_0_2_20_w, p_0_2_21_w, p_0_2_22_w, p_0_2_23_w ;   
wire signed   [ 8:0 ] p_0_2_24_w, p_0_2_25_w, p_0_2_26_w, p_0_2_27_w ;   
wire signed   [ 8:0 ] p_0_2_28_w, p_0_2_29_w, p_0_2_30_w, p_0_2_31_w ; 

wire signed   [ 8:0 ] p_0_3_0_w , p_0_3_1_w , p_0_3_2_w , p_0_3_3_w  ;   
wire signed   [ 8:0 ] p_0_3_4_w , p_0_3_5_w , p_0_3_6_w , p_0_3_7_w  ;   
wire signed   [ 8:0 ] p_0_3_8_w , p_0_3_9_w , p_0_3_10_w, p_0_3_11_w ;   
wire signed   [ 8:0 ] p_0_3_12_w, p_0_3_13_w, p_0_3_14_w, p_0_3_15_w ;   
wire signed   [ 8:0 ] p_0_3_16_w, p_0_3_17_w, p_0_3_18_w, p_0_3_19_w ;   
wire signed   [ 8:0 ] p_0_3_20_w, p_0_3_21_w, p_0_3_22_w, p_0_3_23_w ;   
wire signed   [ 8:0 ] p_0_3_24_w, p_0_3_25_w, p_0_3_26_w, p_0_3_27_w ;   
wire signed   [ 8:0 ] p_0_3_28_w, p_0_3_29_w, p_0_3_30_w, p_0_3_31_w ; 

wire signed   [ 8:0 ] p_1_0_0_w , p_1_0_1_w , p_1_0_2_w , p_1_0_3_w  ;   
wire signed   [ 8:0 ] p_1_0_4_w , p_1_0_5_w , p_1_0_6_w , p_1_0_7_w  ;   
wire signed   [ 8:0 ] p_1_0_8_w , p_1_0_9_w , p_1_0_10_w, p_1_0_11_w ;   
wire signed   [ 8:0 ] p_1_0_12_w, p_1_0_13_w, p_1_0_14_w, p_1_0_15_w ;   
wire signed   [ 8:0 ] p_1_0_16_w, p_1_0_17_w, p_1_0_18_w, p_1_0_19_w ;   
wire signed   [ 8:0 ] p_1_0_20_w, p_1_0_21_w, p_1_0_22_w, p_1_0_23_w ;   
wire signed   [ 8:0 ] p_1_0_24_w, p_1_0_25_w, p_1_0_26_w, p_1_0_27_w ;   
wire signed   [ 8:0 ] p_1_0_28_w, p_1_0_29_w, p_1_0_30_w, p_1_0_31_w ; 

wire signed   [ 8:0 ] p_1_1_0_w , p_1_1_1_w , p_1_1_2_w , p_1_1_3_w  ;   
wire signed   [ 8:0 ] p_1_1_4_w , p_1_1_5_w , p_1_1_6_w , p_1_1_7_w  ;   
wire signed   [ 8:0 ] p_1_1_8_w , p_1_1_9_w , p_1_1_10_w, p_1_1_11_w ;   
wire signed   [ 8:0 ] p_1_1_12_w, p_1_1_13_w, p_1_1_14_w, p_1_1_15_w ;   
wire signed   [ 8:0 ] p_1_1_16_w, p_1_1_17_w, p_1_1_18_w, p_1_1_19_w ;   
wire signed   [ 8:0 ] p_1_1_20_w, p_1_1_21_w, p_1_1_22_w, p_1_1_23_w ;   
wire signed   [ 8:0 ] p_1_1_24_w, p_1_1_25_w, p_1_1_26_w, p_1_1_27_w ;   
wire signed   [ 8:0 ] p_1_1_28_w, p_1_1_29_w, p_1_1_30_w, p_1_1_31_w ; 

wire signed   [ 8:0 ] p_1_2_0_w , p_1_2_1_w , p_1_2_2_w , p_1_2_3_w  ;   
wire signed   [ 8:0 ] p_1_2_4_w , p_1_2_5_w , p_1_2_6_w , p_1_2_7_w  ;   
wire signed   [ 8:0 ] p_1_2_8_w , p_1_2_9_w , p_1_2_10_w, p_1_2_11_w ;   
wire signed   [ 8:0 ] p_1_2_12_w, p_1_2_13_w, p_1_2_14_w, p_1_2_15_w ;   
wire signed   [ 8:0 ] p_1_2_16_w, p_1_2_17_w, p_1_2_18_w, p_1_2_19_w ;   
wire signed   [ 8:0 ] p_1_2_20_w, p_1_2_21_w, p_1_2_22_w, p_1_2_23_w ;   
wire signed   [ 8:0 ] p_1_2_24_w, p_1_2_25_w, p_1_2_26_w, p_1_2_27_w ;   
wire signed   [ 8:0 ] p_1_2_28_w, p_1_2_29_w, p_1_2_30_w, p_1_2_31_w ; 

wire signed   [ 8:0 ] p_1_3_0_w , p_1_3_1_w , p_1_3_2_w , p_1_3_3_w  ;   
wire signed   [ 8:0 ] p_1_3_4_w , p_1_3_5_w , p_1_3_6_w , p_1_3_7_w  ;   
wire signed   [ 8:0 ] p_1_3_8_w , p_1_3_9_w , p_1_3_10_w, p_1_3_11_w ;   
wire signed   [ 8:0 ] p_1_3_12_w, p_1_3_13_w, p_1_3_14_w, p_1_3_15_w ;   
wire signed   [ 8:0 ] p_1_3_16_w, p_1_3_17_w, p_1_3_18_w, p_1_3_19_w ;   
wire signed   [ 8:0 ] p_1_3_20_w, p_1_3_21_w, p_1_3_22_w, p_1_3_23_w ;   
wire signed   [ 8:0 ] p_1_3_24_w, p_1_3_25_w, p_1_3_26_w, p_1_3_27_w ;   
wire signed   [ 8:0 ] p_1_3_28_w, p_1_3_29_w, p_1_3_30_w, p_1_3_31_w ; 

wire signed   [ 8:0 ] p_2_0_0_w , p_2_0_1_w , p_2_0_2_w , p_2_0_3_w  ;   
wire signed   [ 8:0 ] p_2_0_4_w , p_2_0_5_w , p_2_0_6_w , p_2_0_7_w  ;   
wire signed   [ 8:0 ] p_2_0_8_w , p_2_0_9_w , p_2_0_10_w, p_2_0_11_w ;   
wire signed   [ 8:0 ] p_2_0_12_w, p_2_0_13_w, p_2_0_14_w, p_2_0_15_w ;   
wire signed   [ 8:0 ] p_2_0_16_w, p_2_0_17_w, p_2_0_18_w, p_2_0_19_w ;   
wire signed   [ 8:0 ] p_2_0_20_w, p_2_0_21_w, p_2_0_22_w, p_2_0_23_w ;   
wire signed   [ 8:0 ] p_2_0_24_w, p_2_0_25_w, p_2_0_26_w, p_2_0_27_w ;   
wire signed   [ 8:0 ] p_2_0_28_w, p_2_0_29_w, p_2_0_30_w, p_2_0_31_w ; 

wire signed   [ 8:0 ] p_2_1_0_w , p_2_1_1_w , p_2_1_2_w , p_2_1_3_w  ;   
wire signed   [ 8:0 ] p_2_1_4_w , p_2_1_5_w , p_2_1_6_w , p_2_1_7_w  ;   
wire signed   [ 8:0 ] p_2_1_8_w , p_2_1_9_w , p_2_1_10_w, p_2_1_11_w ;   
wire signed   [ 8:0 ] p_2_1_12_w, p_2_1_13_w, p_2_1_14_w, p_2_1_15_w ;   
wire signed   [ 8:0 ] p_2_1_16_w, p_2_1_17_w, p_2_1_18_w, p_2_1_19_w ;   
wire signed   [ 8:0 ] p_2_1_20_w, p_2_1_21_w, p_2_1_22_w, p_2_1_23_w ;   
wire signed   [ 8:0 ] p_2_1_24_w, p_2_1_25_w, p_2_1_26_w, p_2_1_27_w ;   
wire signed   [ 8:0 ] p_2_1_28_w, p_2_1_29_w, p_2_1_30_w, p_2_1_31_w ; 

wire signed   [ 8:0 ] p_2_2_0_w , p_2_2_1_w , p_2_2_2_w , p_2_2_3_w  ;   
wire signed   [ 8:0 ] p_2_2_4_w , p_2_2_5_w , p_2_2_6_w , p_2_2_7_w  ;   
wire signed   [ 8:0 ] p_2_2_8_w , p_2_2_9_w , p_2_2_10_w, p_2_2_11_w ;   
wire signed   [ 8:0 ] p_2_2_12_w, p_2_2_13_w, p_2_2_14_w, p_2_2_15_w ;   
wire signed   [ 8:0 ] p_2_2_16_w, p_2_2_17_w, p_2_2_18_w, p_2_2_19_w ;   
wire signed   [ 8:0 ] p_2_2_20_w, p_2_2_21_w, p_2_2_22_w, p_2_2_23_w ;   
wire signed   [ 8:0 ] p_2_2_24_w, p_2_2_25_w, p_2_2_26_w, p_2_2_27_w ;   
wire signed   [ 8:0 ] p_2_2_28_w, p_2_2_29_w, p_2_2_30_w, p_2_2_31_w ; 

wire signed   [ 8:0 ] p_2_3_0_w , p_2_3_1_w , p_2_3_2_w , p_2_3_3_w  ;   
wire signed   [ 8:0 ] p_2_3_4_w , p_2_3_5_w , p_2_3_6_w , p_2_3_7_w  ;   
wire signed   [ 8:0 ] p_2_3_8_w , p_2_3_9_w , p_2_3_10_w, p_2_3_11_w ;   
wire signed   [ 8:0 ] p_2_3_12_w, p_2_3_13_w, p_2_3_14_w, p_2_3_15_w ;   
wire signed   [ 8:0 ] p_2_3_16_w, p_2_3_17_w, p_2_3_18_w, p_2_3_19_w ;   
wire signed   [ 8:0 ] p_2_3_20_w, p_2_3_21_w, p_2_3_22_w, p_2_3_23_w ;   
wire signed   [ 8:0 ] p_2_3_24_w, p_2_3_25_w, p_2_3_26_w, p_2_3_27_w ;   
wire signed   [ 8:0 ] p_2_3_28_w, p_2_3_29_w, p_2_3_30_w, p_2_3_31_w ; 

wire signed   [ 8:0 ] p_3_0_0_w , p_3_0_1_w , p_3_0_2_w , p_3_0_3_w  ;   
wire signed   [ 8:0 ] p_3_0_4_w , p_3_0_5_w , p_3_0_6_w , p_3_0_7_w  ;   
wire signed   [ 8:0 ] p_3_0_8_w , p_3_0_9_w , p_3_0_10_w, p_3_0_11_w ;   
wire signed   [ 8:0 ] p_3_0_12_w, p_3_0_13_w, p_3_0_14_w, p_3_0_15_w ;   
wire signed   [ 8:0 ] p_3_0_16_w, p_3_0_17_w, p_3_0_18_w, p_3_0_19_w ;   
wire signed   [ 8:0 ] p_3_0_20_w, p_3_0_21_w, p_3_0_22_w, p_3_0_23_w ;   
wire signed   [ 8:0 ] p_3_0_24_w, p_3_0_25_w, p_3_0_26_w, p_3_0_27_w ;   
wire signed   [ 8:0 ] p_3_0_28_w, p_3_0_29_w, p_3_0_30_w, p_3_0_31_w ; 

wire signed   [ 8:0 ] p_3_1_0_w , p_3_1_1_w , p_3_1_2_w , p_3_1_3_w  ;   
wire signed   [ 8:0 ] p_3_1_4_w , p_3_1_5_w , p_3_1_6_w , p_3_1_7_w  ;   
wire signed   [ 8:0 ] p_3_1_8_w , p_3_1_9_w , p_3_1_10_w, p_3_1_11_w ;   
wire signed   [ 8:0 ] p_3_1_12_w, p_3_1_13_w, p_3_1_14_w, p_3_1_15_w ;   
wire signed   [ 8:0 ] p_3_1_16_w, p_3_1_17_w, p_3_1_18_w, p_3_1_19_w ;   
wire signed   [ 8:0 ] p_3_1_20_w, p_3_1_21_w, p_3_1_22_w, p_3_1_23_w ;   
wire signed   [ 8:0 ] p_3_1_24_w, p_3_1_25_w, p_3_1_26_w, p_3_1_27_w ;   
wire signed   [ 8:0 ] p_3_1_28_w, p_3_1_29_w, p_3_1_30_w, p_3_1_31_w ; 

wire signed   [ 8:0 ] p_3_2_0_w , p_3_2_1_w , p_3_2_2_w , p_3_2_3_w  ;   
wire signed   [ 8:0 ] p_3_2_4_w , p_3_2_5_w , p_3_2_6_w , p_3_2_7_w  ;   
wire signed   [ 8:0 ] p_3_2_8_w , p_3_2_9_w , p_3_2_10_w, p_3_2_11_w ;   
wire signed   [ 8:0 ] p_3_2_12_w, p_3_2_13_w, p_3_2_14_w, p_3_2_15_w ;   
wire signed   [ 8:0 ] p_3_2_16_w, p_3_2_17_w, p_3_2_18_w, p_3_2_19_w ;   
wire signed   [ 8:0 ] p_3_2_20_w, p_3_2_21_w, p_3_2_22_w, p_3_2_23_w ;   
wire signed   [ 8:0 ] p_3_2_24_w, p_3_2_25_w, p_3_2_26_w, p_3_2_27_w ;   
wire signed   [ 8:0 ] p_3_2_28_w, p_3_2_29_w, p_3_2_30_w, p_3_2_31_w ; 

wire signed   [ 8:0 ] p_3_3_0_w , p_3_3_1_w , p_3_3_2_w , p_3_3_3_w  ;   
wire signed   [ 8:0 ] p_3_3_4_w , p_3_3_5_w , p_3_3_6_w , p_3_3_7_w  ;   
wire signed   [ 8:0 ] p_3_3_8_w , p_3_3_9_w , p_3_3_10_w, p_3_3_11_w ;   
wire signed   [ 8:0 ] p_3_3_12_w, p_3_3_13_w, p_3_3_14_w, p_3_3_15_w ;   
wire signed   [ 8:0 ] p_3_3_16_w, p_3_3_17_w, p_3_3_18_w, p_3_3_19_w ;   
wire signed   [ 8:0 ] p_3_3_20_w, p_3_3_21_w, p_3_3_22_w, p_3_3_23_w ;   
wire signed   [ 8:0 ] p_3_3_24_w, p_3_3_25_w, p_3_3_26_w, p_3_3_27_w ;   
wire signed   [ 8:0 ] p_3_3_28_w, p_3_3_29_w, p_3_3_30_w, p_3_3_31_w ; 

wire signed   [ 8:0 ] q_0_0_0_w , q_0_0_1_w , q_0_0_2_w , q_0_0_3_w  ;   
wire signed   [ 8:0 ] q_0_0_4_w , q_0_0_5_w , q_0_0_6_w , q_0_0_7_w  ;   
wire signed   [ 8:0 ] q_0_0_8_w , q_0_0_9_w , q_0_0_10_w, q_0_0_11_w ;   
wire signed   [ 8:0 ] q_0_0_12_w, q_0_0_13_w, q_0_0_14_w, q_0_0_15_w ;   
wire signed   [ 8:0 ] q_0_0_16_w, q_0_0_17_w, q_0_0_18_w, q_0_0_19_w ;   
wire signed   [ 8:0 ] q_0_0_20_w, q_0_0_21_w, q_0_0_22_w, q_0_0_23_w ;   
wire signed   [ 8:0 ] q_0_0_24_w, q_0_0_25_w, q_0_0_26_w, q_0_0_27_w ;   
wire signed   [ 8:0 ] q_0_0_28_w, q_0_0_29_w, q_0_0_30_w, q_0_0_31_w ; 

wire signed   [ 8:0 ] q_0_1_0_w , q_0_1_1_w , q_0_1_2_w , q_0_1_3_w  ;   
wire signed   [ 8:0 ] q_0_1_4_w , q_0_1_5_w , q_0_1_6_w , q_0_1_7_w  ;   
wire signed   [ 8:0 ] q_0_1_8_w , q_0_1_9_w , q_0_1_10_w, q_0_1_11_w ;   
wire signed   [ 8:0 ] q_0_1_12_w, q_0_1_13_w, q_0_1_14_w, q_0_1_15_w ;   
wire signed   [ 8:0 ] q_0_1_16_w, q_0_1_17_w, q_0_1_18_w, q_0_1_19_w ;   
wire signed   [ 8:0 ] q_0_1_20_w, q_0_1_21_w, q_0_1_22_w, q_0_1_23_w ;   
wire signed   [ 8:0 ] q_0_1_24_w, q_0_1_25_w, q_0_1_26_w, q_0_1_27_w ;   
wire signed   [ 8:0 ] q_0_1_28_w, q_0_1_29_w, q_0_1_30_w, q_0_1_31_w ; 

wire signed   [ 8:0 ] q_0_2_0_w , q_0_2_1_w , q_0_2_2_w , q_0_2_3_w  ;   
wire signed   [ 8:0 ] q_0_2_4_w , q_0_2_5_w , q_0_2_6_w , q_0_2_7_w  ;   
wire signed   [ 8:0 ] q_0_2_8_w , q_0_2_9_w , q_0_2_10_w, q_0_2_11_w ;   
wire signed   [ 8:0 ] q_0_2_12_w, q_0_2_13_w, q_0_2_14_w, q_0_2_15_w ;   
wire signed   [ 8:0 ] q_0_2_16_w, q_0_2_17_w, q_0_2_18_w, q_0_2_19_w ;   
wire signed   [ 8:0 ] q_0_2_20_w, q_0_2_21_w, q_0_2_22_w, q_0_2_23_w ;   
wire signed   [ 8:0 ] q_0_2_24_w, q_0_2_25_w, q_0_2_26_w, q_0_2_27_w ;   
wire signed   [ 8:0 ] q_0_2_28_w, q_0_2_29_w, q_0_2_30_w, q_0_2_31_w ; 

wire signed   [ 8:0 ] q_0_3_0_w , q_0_3_1_w , q_0_3_2_w , q_0_3_3_w  ;   
wire signed   [ 8:0 ] q_0_3_4_w , q_0_3_5_w , q_0_3_6_w , q_0_3_7_w  ;   
wire signed   [ 8:0 ] q_0_3_8_w , q_0_3_9_w , q_0_3_10_w, q_0_3_11_w ;   
wire signed   [ 8:0 ] q_0_3_12_w, q_0_3_13_w, q_0_3_14_w, q_0_3_15_w ;   
wire signed   [ 8:0 ] q_0_3_16_w, q_0_3_17_w, q_0_3_18_w, q_0_3_19_w ;   
wire signed   [ 8:0 ] q_0_3_20_w, q_0_3_21_w, q_0_3_22_w, q_0_3_23_w ;   
wire signed   [ 8:0 ] q_0_3_24_w, q_0_3_25_w, q_0_3_26_w, q_0_3_27_w ;   
wire signed   [ 8:0 ] q_0_3_28_w, q_0_3_29_w, q_0_3_30_w, q_0_3_31_w ; 

wire signed   [ 8:0 ] q_1_0_0_w , q_1_0_1_w , q_1_0_2_w , q_1_0_3_w  ;   
wire signed   [ 8:0 ] q_1_0_4_w , q_1_0_5_w , q_1_0_6_w , q_1_0_7_w  ;   
wire signed   [ 8:0 ] q_1_0_8_w , q_1_0_9_w , q_1_0_10_w, q_1_0_11_w ;   
wire signed   [ 8:0 ] q_1_0_12_w, q_1_0_13_w, q_1_0_14_w, q_1_0_15_w ;   
wire signed   [ 8:0 ] q_1_0_16_w, q_1_0_17_w, q_1_0_18_w, q_1_0_19_w ;   
wire signed   [ 8:0 ] q_1_0_20_w, q_1_0_21_w, q_1_0_22_w, q_1_0_23_w ;   
wire signed   [ 8:0 ] q_1_0_24_w, q_1_0_25_w, q_1_0_26_w, q_1_0_27_w ;   
wire signed   [ 8:0 ] q_1_0_28_w, q_1_0_29_w, q_1_0_30_w, q_1_0_31_w ; 

wire signed   [ 8:0 ] q_1_1_0_w , q_1_1_1_w , q_1_1_2_w , q_1_1_3_w  ;   
wire signed   [ 8:0 ] q_1_1_4_w , q_1_1_5_w , q_1_1_6_w , q_1_1_7_w  ;   
wire signed   [ 8:0 ] q_1_1_8_w , q_1_1_9_w , q_1_1_10_w, q_1_1_11_w ;   
wire signed   [ 8:0 ] q_1_1_12_w, q_1_1_13_w, q_1_1_14_w, q_1_1_15_w ;   
wire signed   [ 8:0 ] q_1_1_16_w, q_1_1_17_w, q_1_1_18_w, q_1_1_19_w ;   
wire signed   [ 8:0 ] q_1_1_20_w, q_1_1_21_w, q_1_1_22_w, q_1_1_23_w ;   
wire signed   [ 8:0 ] q_1_1_24_w, q_1_1_25_w, q_1_1_26_w, q_1_1_27_w ;   
wire signed   [ 8:0 ] q_1_1_28_w, q_1_1_29_w, q_1_1_30_w, q_1_1_31_w ; 

wire signed   [ 8:0 ] q_1_2_0_w , q_1_2_1_w , q_1_2_2_w , q_1_2_3_w  ;   
wire signed   [ 8:0 ] q_1_2_4_w , q_1_2_5_w , q_1_2_6_w , q_1_2_7_w  ;   
wire signed   [ 8:0 ] q_1_2_8_w , q_1_2_9_w , q_1_2_10_w, q_1_2_11_w ;   
wire signed   [ 8:0 ] q_1_2_12_w, q_1_2_13_w, q_1_2_14_w, q_1_2_15_w ;   
wire signed   [ 8:0 ] q_1_2_16_w, q_1_2_17_w, q_1_2_18_w, q_1_2_19_w ;   
wire signed   [ 8:0 ] q_1_2_20_w, q_1_2_21_w, q_1_2_22_w, q_1_2_23_w ;   
wire signed   [ 8:0 ] q_1_2_24_w, q_1_2_25_w, q_1_2_26_w, q_1_2_27_w ;   
wire signed   [ 8:0 ] q_1_2_28_w, q_1_2_29_w, q_1_2_30_w, q_1_2_31_w ; 

wire signed   [ 8:0 ] q_1_3_0_w , q_1_3_1_w , q_1_3_2_w , q_1_3_3_w  ;   
wire signed   [ 8:0 ] q_1_3_4_w , q_1_3_5_w , q_1_3_6_w , q_1_3_7_w  ;   
wire signed   [ 8:0 ] q_1_3_8_w , q_1_3_9_w , q_1_3_10_w, q_1_3_11_w ;   
wire signed   [ 8:0 ] q_1_3_12_w, q_1_3_13_w, q_1_3_14_w, q_1_3_15_w ;   
wire signed   [ 8:0 ] q_1_3_16_w, q_1_3_17_w, q_1_3_18_w, q_1_3_19_w ;   
wire signed   [ 8:0 ] q_1_3_20_w, q_1_3_21_w, q_1_3_22_w, q_1_3_23_w ;   
wire signed   [ 8:0 ] q_1_3_24_w, q_1_3_25_w, q_1_3_26_w, q_1_3_27_w ;   
wire signed   [ 8:0 ] q_1_3_28_w, q_1_3_29_w, q_1_3_30_w, q_1_3_31_w ; 

wire signed   [ 8:0 ] q_2_0_0_w , q_2_0_1_w , q_2_0_2_w , q_2_0_3_w  ;   
wire signed   [ 8:0 ] q_2_0_4_w , q_2_0_5_w , q_2_0_6_w , q_2_0_7_w  ;   
wire signed   [ 8:0 ] q_2_0_8_w , q_2_0_9_w , q_2_0_10_w, q_2_0_11_w ;   
wire signed   [ 8:0 ] q_2_0_12_w, q_2_0_13_w, q_2_0_14_w, q_2_0_15_w ;   
wire signed   [ 8:0 ] q_2_0_16_w, q_2_0_17_w, q_2_0_18_w, q_2_0_19_w ;   
wire signed   [ 8:0 ] q_2_0_20_w, q_2_0_21_w, q_2_0_22_w, q_2_0_23_w ;   
wire signed   [ 8:0 ] q_2_0_24_w, q_2_0_25_w, q_2_0_26_w, q_2_0_27_w ;   
wire signed   [ 8:0 ] q_2_0_28_w, q_2_0_29_w, q_2_0_30_w, q_2_0_31_w ; 

wire signed   [ 8:0 ] q_2_1_0_w , q_2_1_1_w , q_2_1_2_w , q_2_1_3_w  ;   
wire signed   [ 8:0 ] q_2_1_4_w , q_2_1_5_w , q_2_1_6_w , q_2_1_7_w  ;   
wire signed   [ 8:0 ] q_2_1_8_w , q_2_1_9_w , q_2_1_10_w, q_2_1_11_w ;   
wire signed   [ 8:0 ] q_2_1_12_w, q_2_1_13_w, q_2_1_14_w, q_2_1_15_w ;   
wire signed   [ 8:0 ] q_2_1_16_w, q_2_1_17_w, q_2_1_18_w, q_2_1_19_w ;   
wire signed   [ 8:0 ] q_2_1_20_w, q_2_1_21_w, q_2_1_22_w, q_2_1_23_w ;   
wire signed   [ 8:0 ] q_2_1_24_w, q_2_1_25_w, q_2_1_26_w, q_2_1_27_w ;   
wire signed   [ 8:0 ] q_2_1_28_w, q_2_1_29_w, q_2_1_30_w, q_2_1_31_w ; 

wire signed   [ 8:0 ] q_2_2_0_w , q_2_2_1_w , q_2_2_2_w , q_2_2_3_w  ;   
wire signed   [ 8:0 ] q_2_2_4_w , q_2_2_5_w , q_2_2_6_w , q_2_2_7_w  ;   
wire signed   [ 8:0 ] q_2_2_8_w , q_2_2_9_w , q_2_2_10_w, q_2_2_11_w ;   
wire signed   [ 8:0 ] q_2_2_12_w, q_2_2_13_w, q_2_2_14_w, q_2_2_15_w ;   
wire signed   [ 8:0 ] q_2_2_16_w, q_2_2_17_w, q_2_2_18_w, q_2_2_19_w ;   
wire signed   [ 8:0 ] q_2_2_20_w, q_2_2_21_w, q_2_2_22_w, q_2_2_23_w ;   
wire signed   [ 8:0 ] q_2_2_24_w, q_2_2_25_w, q_2_2_26_w, q_2_2_27_w ;   
wire signed   [ 8:0 ] q_2_2_28_w, q_2_2_29_w, q_2_2_30_w, q_2_2_31_w ; 

wire signed   [ 8:0 ] q_2_3_0_w , q_2_3_1_w , q_2_3_2_w , q_2_3_3_w  ;   
wire signed   [ 8:0 ] q_2_3_4_w , q_2_3_5_w , q_2_3_6_w , q_2_3_7_w  ;   
wire signed   [ 8:0 ] q_2_3_8_w , q_2_3_9_w , q_2_3_10_w, q_2_3_11_w ;   
wire signed   [ 8:0 ] q_2_3_12_w, q_2_3_13_w, q_2_3_14_w, q_2_3_15_w ;   
wire signed   [ 8:0 ] q_2_3_16_w, q_2_3_17_w, q_2_3_18_w, q_2_3_19_w ;   
wire signed   [ 8:0 ] q_2_3_20_w, q_2_3_21_w, q_2_3_22_w, q_2_3_23_w ;   
wire signed   [ 8:0 ] q_2_3_24_w, q_2_3_25_w, q_2_3_26_w, q_2_3_27_w ;   
wire signed   [ 8:0 ] q_2_3_28_w, q_2_3_29_w, q_2_3_30_w, q_2_3_31_w ; 

wire signed   [ 8:0 ] q_3_0_0_w , q_3_0_1_w , q_3_0_2_w , q_3_0_3_w  ;   
wire signed   [ 8:0 ] q_3_0_4_w , q_3_0_5_w , q_3_0_6_w , q_3_0_7_w  ;   
wire signed   [ 8:0 ] q_3_0_8_w , q_3_0_9_w , q_3_0_10_w, q_3_0_11_w ;   
wire signed   [ 8:0 ] q_3_0_12_w, q_3_0_13_w, q_3_0_14_w, q_3_0_15_w ;   
wire signed   [ 8:0 ] q_3_0_16_w, q_3_0_17_w, q_3_0_18_w, q_3_0_19_w ;   
wire signed   [ 8:0 ] q_3_0_20_w, q_3_0_21_w, q_3_0_22_w, q_3_0_23_w ;   
wire signed   [ 8:0 ] q_3_0_24_w, q_3_0_25_w, q_3_0_26_w, q_3_0_27_w ;   
wire signed   [ 8:0 ] q_3_0_28_w, q_3_0_29_w, q_3_0_30_w, q_3_0_31_w ; 

wire signed   [ 8:0 ] q_3_1_0_w , q_3_1_1_w , q_3_1_2_w , q_3_1_3_w  ;   
wire signed   [ 8:0 ] q_3_1_4_w , q_3_1_5_w , q_3_1_6_w , q_3_1_7_w  ;   
wire signed   [ 8:0 ] q_3_1_8_w , q_3_1_9_w , q_3_1_10_w, q_3_1_11_w ;   
wire signed   [ 8:0 ] q_3_1_12_w, q_3_1_13_w, q_3_1_14_w, q_3_1_15_w ;   
wire signed   [ 8:0 ] q_3_1_16_w, q_3_1_17_w, q_3_1_18_w, q_3_1_19_w ;   
wire signed   [ 8:0 ] q_3_1_20_w, q_3_1_21_w, q_3_1_22_w, q_3_1_23_w ;   
wire signed   [ 8:0 ] q_3_1_24_w, q_3_1_25_w, q_3_1_26_w, q_3_1_27_w ;   
wire signed   [ 8:0 ] q_3_1_28_w, q_3_1_29_w, q_3_1_30_w, q_3_1_31_w ; 

wire signed   [ 8:0 ] q_3_2_0_w , q_3_2_1_w , q_3_2_2_w , q_3_2_3_w  ;   
wire signed   [ 8:0 ] q_3_2_4_w , q_3_2_5_w , q_3_2_6_w , q_3_2_7_w  ;   
wire signed   [ 8:0 ] q_3_2_8_w , q_3_2_9_w , q_3_2_10_w, q_3_2_11_w ;   
wire signed   [ 8:0 ] q_3_2_12_w, q_3_2_13_w, q_3_2_14_w, q_3_2_15_w ;   
wire signed   [ 8:0 ] q_3_2_16_w, q_3_2_17_w, q_3_2_18_w, q_3_2_19_w ;   
wire signed   [ 8:0 ] q_3_2_20_w, q_3_2_21_w, q_3_2_22_w, q_3_2_23_w ;   
wire signed   [ 8:0 ] q_3_2_24_w, q_3_2_25_w, q_3_2_26_w, q_3_2_27_w ;   
wire signed   [ 8:0 ] q_3_2_28_w, q_3_2_29_w, q_3_2_30_w, q_3_2_31_w ; 

wire signed   [ 8:0 ] q_3_3_0_w , q_3_3_1_w , q_3_3_2_w , q_3_3_3_w  ;   
wire signed   [ 8:0 ] q_3_3_4_w , q_3_3_5_w , q_3_3_6_w , q_3_3_7_w  ;   
wire signed   [ 8:0 ] q_3_3_8_w , q_3_3_9_w , q_3_3_10_w, q_3_3_11_w ;   
wire signed   [ 8:0 ] q_3_3_12_w, q_3_3_13_w, q_3_3_14_w, q_3_3_15_w ;   
wire signed   [ 8:0 ] q_3_3_16_w, q_3_3_17_w, q_3_3_18_w, q_3_3_19_w ;   
wire signed   [ 8:0 ] q_3_3_20_w, q_3_3_21_w, q_3_3_22_w, q_3_3_23_w ;   
wire signed   [ 8:0 ] q_3_3_24_w, q_3_3_25_w, q_3_3_26_w, q_3_3_27_w ;   
wire signed   [ 8:0 ] q_3_3_28_w, q_3_3_29_w, q_3_3_30_w, q_3_3_31_w ; 

assign  {p_0_0_3_w , p_0_0_2_w , p_0_0_1_w , p_0_0_0_w }  = {ominusdp_0_0_w[ 35:0  ]};   
assign  {p_0_0_7_w , p_0_0_6_w , p_0_0_5_w , p_0_0_4_w }  = {ominusdp_0_0_w[ 71:36 ]};   
assign  {p_0_0_11_w, p_0_0_10_w, p_0_0_9_w , p_0_0_8_w }  = {ominusdp_0_0_w[107:72 ]};   
assign  {p_0_0_15_w, p_0_0_14_w, p_0_0_13_w, p_0_0_12_w}  = {ominusdp_0_0_w[143:108]};   
assign  {p_0_0_19_w, p_0_0_18_w, p_0_0_17_w, p_0_0_16_w}  = {ominusdp_0_0_w[179:144]};   
assign  {p_0_0_23_w, p_0_0_22_w, p_0_0_21_w, p_0_0_20_w}  = {ominusdp_0_0_w[215:180]};   
assign  {p_0_0_27_w, p_0_0_26_w, p_0_0_25_w, p_0_0_24_w}  = {ominusdp_0_0_w[251:216]};   
assign  {p_0_0_31_w, p_0_0_30_w, p_0_0_29_w, p_0_0_28_w}  = {ominusdp_0_0_w[287:252]}; 

assign  {p_0_1_3_w , p_0_1_2_w , p_0_1_1_w , p_0_1_0_w }  = {ominusdp_0_1_w[ 35:0  ]};   
assign  {p_0_1_7_w , p_0_1_6_w , p_0_1_5_w , p_0_1_4_w }  = {ominusdp_0_1_w[ 71:36 ]};   
assign  {p_0_1_11_w, p_0_1_10_w, p_0_1_9_w , p_0_1_8_w }  = {ominusdp_0_1_w[107:72 ]};   
assign  {p_0_1_15_w, p_0_1_14_w, p_0_1_13_w, p_0_1_12_w}  = {ominusdp_0_1_w[143:108]};   
assign  {p_0_1_19_w, p_0_1_18_w, p_0_1_17_w, p_0_1_16_w}  = {ominusdp_0_1_w[179:144]};   
assign  {p_0_1_23_w, p_0_1_22_w, p_0_1_21_w, p_0_1_20_w}  = {ominusdp_0_1_w[215:180]};   
assign  {p_0_1_27_w, p_0_1_26_w, p_0_1_25_w, p_0_1_24_w}  = {ominusdp_0_1_w[251:216]};   
assign  {p_0_1_31_w, p_0_1_30_w, p_0_1_29_w, p_0_1_28_w}  = {ominusdp_0_1_w[287:252]}; 

assign  {p_0_2_3_w , p_0_2_2_w , p_0_2_1_w , p_0_2_0_w }  = {ominusdp_0_2_w[ 35:0  ]};   
assign  {p_0_2_7_w , p_0_2_6_w , p_0_2_5_w , p_0_2_4_w }  = {ominusdp_0_2_w[ 71:36 ]};   
assign  {p_0_2_11_w, p_0_2_10_w, p_0_2_9_w , p_0_2_8_w }  = {ominusdp_0_2_w[107:72 ]};   
assign  {p_0_2_15_w, p_0_2_14_w, p_0_2_13_w, p_0_2_12_w}  = {ominusdp_0_2_w[143:108]};   
assign  {p_0_2_19_w, p_0_2_18_w, p_0_2_17_w, p_0_2_16_w}  = {ominusdp_0_2_w[179:144]};   
assign  {p_0_2_23_w, p_0_2_22_w, p_0_2_21_w, p_0_2_20_w}  = {ominusdp_0_2_w[215:180]};   
assign  {p_0_2_27_w, p_0_2_26_w, p_0_2_25_w, p_0_2_24_w}  = {ominusdp_0_2_w[251:216]};   
assign  {p_0_2_31_w, p_0_2_30_w, p_0_2_29_w, p_0_2_28_w}  = {ominusdp_0_2_w[287:252]}; 

assign  {p_0_3_3_w , p_0_3_2_w , p_0_3_1_w , p_0_3_0_w }  = {ominusdp_0_3_w[ 35:0  ]};   
assign  {p_0_3_7_w , p_0_3_6_w , p_0_3_5_w , p_0_3_4_w }  = {ominusdp_0_3_w[ 71:36 ]};   
assign  {p_0_3_11_w, p_0_3_10_w, p_0_3_9_w , p_0_3_8_w }  = {ominusdp_0_3_w[107:72 ]};   
assign  {p_0_3_15_w, p_0_3_14_w, p_0_3_13_w, p_0_3_12_w}  = {ominusdp_0_3_w[143:108]};   
assign  {p_0_3_19_w, p_0_3_18_w, p_0_3_17_w, p_0_3_16_w}  = {ominusdp_0_3_w[179:144]};   
assign  {p_0_3_23_w, p_0_3_22_w, p_0_3_21_w, p_0_3_20_w}  = {ominusdp_0_3_w[215:180]};   
assign  {p_0_3_27_w, p_0_3_26_w, p_0_3_25_w, p_0_3_24_w}  = {ominusdp_0_3_w[251:216]};   
assign  {p_0_3_31_w, p_0_3_30_w, p_0_3_29_w, p_0_3_28_w}  = {ominusdp_0_3_w[287:252]}; 

assign  {p_1_0_3_w , p_1_0_2_w , p_1_0_1_w , p_1_0_0_w }  = {ominusdp_1_0_w[ 35:0  ]};   
assign  {p_1_0_7_w , p_1_0_6_w , p_1_0_5_w , p_1_0_4_w }  = {ominusdp_1_0_w[ 71:36 ]};   
assign  {p_1_0_11_w, p_1_0_10_w, p_1_0_9_w , p_1_0_8_w }  = {ominusdp_1_0_w[107:72 ]};   
assign  {p_1_0_15_w, p_1_0_14_w, p_1_0_13_w, p_1_0_12_w}  = {ominusdp_1_0_w[143:108]};   
assign  {p_1_0_19_w, p_1_0_18_w, p_1_0_17_w, p_1_0_16_w}  = {ominusdp_1_0_w[179:144]};   
assign  {p_1_0_23_w, p_1_0_22_w, p_1_0_21_w, p_1_0_20_w}  = {ominusdp_1_0_w[215:180]};   
assign  {p_1_0_27_w, p_1_0_26_w, p_1_0_25_w, p_1_0_24_w}  = {ominusdp_1_0_w[251:216]};   
assign  {p_1_0_31_w, p_1_0_30_w, p_1_0_29_w, p_1_0_28_w}  = {ominusdp_1_0_w[287:252]}; 

assign  {p_1_1_3_w , p_1_1_2_w , p_1_1_1_w , p_1_1_0_w }  = {ominusdp_1_1_w[ 35:0  ]};   
assign  {p_1_1_7_w , p_1_1_6_w , p_1_1_5_w , p_1_1_4_w }  = {ominusdp_1_1_w[ 71:36 ]};   
assign  {p_1_1_11_w, p_1_1_10_w, p_1_1_9_w , p_1_1_8_w }  = {ominusdp_1_1_w[107:72 ]};   
assign  {p_1_1_15_w, p_1_1_14_w, p_1_1_13_w, p_1_1_12_w}  = {ominusdp_1_1_w[143:108]};   
assign  {p_1_1_19_w, p_1_1_18_w, p_1_1_17_w, p_1_1_16_w}  = {ominusdp_1_1_w[179:144]};   
assign  {p_1_1_23_w, p_1_1_22_w, p_1_1_21_w, p_1_1_20_w}  = {ominusdp_1_1_w[215:180]};   
assign  {p_1_1_27_w, p_1_1_26_w, p_1_1_25_w, p_1_1_24_w}  = {ominusdp_1_1_w[251:216]};   
assign  {p_1_1_31_w, p_1_1_30_w, p_1_1_29_w, p_1_1_28_w}  = {ominusdp_1_1_w[287:252]}; 

assign  {p_1_2_3_w , p_1_2_2_w , p_1_2_1_w , p_1_2_0_w }  = {ominusdp_1_2_w[ 35:0  ]};   
assign  {p_1_2_7_w , p_1_2_6_w , p_1_2_5_w , p_1_2_4_w }  = {ominusdp_1_2_w[ 71:36 ]};   
assign  {p_1_2_11_w, p_1_2_10_w, p_1_2_9_w , p_1_2_8_w }  = {ominusdp_1_2_w[107:72 ]};   
assign  {p_1_2_15_w, p_1_2_14_w, p_1_2_13_w, p_1_2_12_w}  = {ominusdp_1_2_w[143:108]};   
assign  {p_1_2_19_w, p_1_2_18_w, p_1_2_17_w, p_1_2_16_w}  = {ominusdp_1_2_w[179:144]};   
assign  {p_1_2_23_w, p_1_2_22_w, p_1_2_21_w, p_1_2_20_w}  = {ominusdp_1_2_w[215:180]};   
assign  {p_1_2_27_w, p_1_2_26_w, p_1_2_25_w, p_1_2_24_w}  = {ominusdp_1_2_w[251:216]};   
assign  {p_1_2_31_w, p_1_2_30_w, p_1_2_29_w, p_1_2_28_w}  = {ominusdp_1_2_w[287:252]}; 

assign  {p_1_3_3_w , p_1_3_2_w , p_1_3_1_w , p_1_3_0_w }  = {ominusdp_1_3_w[ 35:0  ]};   
assign  {p_1_3_7_w , p_1_3_6_w , p_1_3_5_w , p_1_3_4_w }  = {ominusdp_1_3_w[ 71:36 ]};   
assign  {p_1_3_11_w, p_1_3_10_w, p_1_3_9_w , p_1_3_8_w }  = {ominusdp_1_3_w[107:72 ]};   
assign  {p_1_3_15_w, p_1_3_14_w, p_1_3_13_w, p_1_3_12_w}  = {ominusdp_1_3_w[143:108]};   
assign  {p_1_3_19_w, p_1_3_18_w, p_1_3_17_w, p_1_3_16_w}  = {ominusdp_1_3_w[179:144]};   
assign  {p_1_3_23_w, p_1_3_22_w, p_1_3_21_w, p_1_3_20_w}  = {ominusdp_1_3_w[215:180]};   
assign  {p_1_3_27_w, p_1_3_26_w, p_1_3_25_w, p_1_3_24_w}  = {ominusdp_1_3_w[251:216]};   
assign  {p_1_3_31_w, p_1_3_30_w, p_1_3_29_w, p_1_3_28_w}  = {ominusdp_1_3_w[287:252]}; 

assign  {p_2_0_3_w , p_2_0_2_w , p_2_0_1_w , p_2_0_0_w }  = {ominusdp_2_0_w[ 35:0  ]};   
assign  {p_2_0_7_w , p_2_0_6_w , p_2_0_5_w , p_2_0_4_w }  = {ominusdp_2_0_w[ 71:36 ]};   
assign  {p_2_0_11_w, p_2_0_10_w, p_2_0_9_w , p_2_0_8_w }  = {ominusdp_2_0_w[107:72 ]};   
assign  {p_2_0_15_w, p_2_0_14_w, p_2_0_13_w, p_2_0_12_w}  = {ominusdp_2_0_w[143:108]};   
assign  {p_2_0_19_w, p_2_0_18_w, p_2_0_17_w, p_2_0_16_w}  = {ominusdp_2_0_w[179:144]};   
assign  {p_2_0_23_w, p_2_0_22_w, p_2_0_21_w, p_2_0_20_w}  = {ominusdp_2_0_w[215:180]};   
assign  {p_2_0_27_w, p_2_0_26_w, p_2_0_25_w, p_2_0_24_w}  = {ominusdp_2_0_w[251:216]};   
assign  {p_2_0_31_w, p_2_0_30_w, p_2_0_29_w, p_2_0_28_w}  = {ominusdp_2_0_w[287:252]}; 

assign  {p_2_1_3_w , p_2_1_2_w , p_2_1_1_w , p_2_1_0_w }  = {ominusdp_2_1_w[ 35:0  ]};   
assign  {p_2_1_7_w , p_2_1_6_w , p_2_1_5_w , p_2_1_4_w }  = {ominusdp_2_1_w[ 71:36 ]};   
assign  {p_2_1_11_w, p_2_1_10_w, p_2_1_9_w , p_2_1_8_w }  = {ominusdp_2_1_w[107:72 ]};   
assign  {p_2_1_15_w, p_2_1_14_w, p_2_1_13_w, p_2_1_12_w}  = {ominusdp_2_1_w[143:108]};   
assign  {p_2_1_19_w, p_2_1_18_w, p_2_1_17_w, p_2_1_16_w}  = {ominusdp_2_1_w[179:144]};   
assign  {p_2_1_23_w, p_2_1_22_w, p_2_1_21_w, p_2_1_20_w}  = {ominusdp_2_1_w[215:180]};   
assign  {p_2_1_27_w, p_2_1_26_w, p_2_1_25_w, p_2_1_24_w}  = {ominusdp_2_1_w[251:216]};   
assign  {p_2_1_31_w, p_2_1_30_w, p_2_1_29_w, p_2_1_28_w}  = {ominusdp_2_1_w[287:252]}; 

assign  {p_2_2_3_w , p_2_2_2_w , p_2_2_1_w , p_2_2_0_w }  = {ominusdp_2_2_w[ 35:0  ]};   
assign  {p_2_2_7_w , p_2_2_6_w , p_2_2_5_w , p_2_2_4_w }  = {ominusdp_2_2_w[ 71:36 ]};   
assign  {p_2_2_11_w, p_2_2_10_w, p_2_2_9_w , p_2_2_8_w }  = {ominusdp_2_2_w[107:72 ]};   
assign  {p_2_2_15_w, p_2_2_14_w, p_2_2_13_w, p_2_2_12_w}  = {ominusdp_2_2_w[143:108]};   
assign  {p_2_2_19_w, p_2_2_18_w, p_2_2_17_w, p_2_2_16_w}  = {ominusdp_2_2_w[179:144]};   
assign  {p_2_2_23_w, p_2_2_22_w, p_2_2_21_w, p_2_2_20_w}  = {ominusdp_2_2_w[215:180]};   
assign  {p_2_2_27_w, p_2_2_26_w, p_2_2_25_w, p_2_2_24_w}  = {ominusdp_2_2_w[251:216]};   
assign  {p_2_2_31_w, p_2_2_30_w, p_2_2_29_w, p_2_2_28_w}  = {ominusdp_2_2_w[287:252]}; 

assign  {p_2_3_3_w , p_2_3_2_w , p_2_3_1_w , p_2_3_0_w }  = {ominusdp_2_3_w[ 35:0  ]};   
assign  {p_2_3_7_w , p_2_3_6_w , p_2_3_5_w , p_2_3_4_w }  = {ominusdp_2_3_w[ 71:36 ]};   
assign  {p_2_3_11_w, p_2_3_10_w, p_2_3_9_w , p_2_3_8_w }  = {ominusdp_2_3_w[107:72 ]};   
assign  {p_2_3_15_w, p_2_3_14_w, p_2_3_13_w, p_2_3_12_w}  = {ominusdp_2_3_w[143:108]};   
assign  {p_2_3_19_w, p_2_3_18_w, p_2_3_17_w, p_2_3_16_w}  = {ominusdp_2_3_w[179:144]};   
assign  {p_2_3_23_w, p_2_3_22_w, p_2_3_21_w, p_2_3_20_w}  = {ominusdp_2_3_w[215:180]};   
assign  {p_2_3_27_w, p_2_3_26_w, p_2_3_25_w, p_2_3_24_w}  = {ominusdp_2_3_w[251:216]};   
assign  {p_2_3_31_w, p_2_3_30_w, p_2_3_29_w, p_2_3_28_w}  = {ominusdp_2_3_w[287:252]}; 

assign  {p_3_0_3_w , p_3_0_2_w , p_3_0_1_w , p_3_0_0_w }  = {ominusdp_3_0_w[ 35:0  ]};   
assign  {p_3_0_7_w , p_3_0_6_w , p_3_0_5_w , p_3_0_4_w }  = {ominusdp_3_0_w[ 71:36 ]};   
assign  {p_3_0_11_w, p_3_0_10_w, p_3_0_9_w , p_3_0_8_w }  = {ominusdp_3_0_w[107:72 ]};   
assign  {p_3_0_15_w, p_3_0_14_w, p_3_0_13_w, p_3_0_12_w}  = {ominusdp_3_0_w[143:108]};   
assign  {p_3_0_19_w, p_3_0_18_w, p_3_0_17_w, p_3_0_16_w}  = {ominusdp_3_0_w[179:144]};   
assign  {p_3_0_23_w, p_3_0_22_w, p_3_0_21_w, p_3_0_20_w}  = {ominusdp_3_0_w[215:180]};   
assign  {p_3_0_27_w, p_3_0_26_w, p_3_0_25_w, p_3_0_24_w}  = {ominusdp_3_0_w[251:216]};   
assign  {p_3_0_31_w, p_3_0_30_w, p_3_0_29_w, p_3_0_28_w}  = {ominusdp_3_0_w[287:252]}; 

assign  {p_3_1_3_w , p_3_1_2_w , p_3_1_1_w , p_3_1_0_w }  = {ominusdp_3_1_w[ 35:0  ]};   
assign  {p_3_1_7_w , p_3_1_6_w , p_3_1_5_w , p_3_1_4_w }  = {ominusdp_3_1_w[ 71:36 ]};   
assign  {p_3_1_11_w, p_3_1_10_w, p_3_1_9_w , p_3_1_8_w }  = {ominusdp_3_1_w[107:72 ]};   
assign  {p_3_1_15_w, p_3_1_14_w, p_3_1_13_w, p_3_1_12_w}  = {ominusdp_3_1_w[143:108]};   
assign  {p_3_1_19_w, p_3_1_18_w, p_3_1_17_w, p_3_1_16_w}  = {ominusdp_3_1_w[179:144]};   
assign  {p_3_1_23_w, p_3_1_22_w, p_3_1_21_w, p_3_1_20_w}  = {ominusdp_3_1_w[215:180]};   
assign  {p_3_1_27_w, p_3_1_26_w, p_3_1_25_w, p_3_1_24_w}  = {ominusdp_3_1_w[251:216]};   
assign  {p_3_1_31_w, p_3_1_30_w, p_3_1_29_w, p_3_1_28_w}  = {ominusdp_3_1_w[287:252]}; 

assign  {p_3_2_3_w , p_3_2_2_w , p_3_2_1_w , p_3_2_0_w }  = {ominusdp_3_2_w[ 35:0  ]};   
assign  {p_3_2_7_w , p_3_2_6_w , p_3_2_5_w , p_3_2_4_w }  = {ominusdp_3_2_w[ 71:36 ]};   
assign  {p_3_2_11_w, p_3_2_10_w, p_3_2_9_w , p_3_2_8_w }  = {ominusdp_3_2_w[107:72 ]};   
assign  {p_3_2_15_w, p_3_2_14_w, p_3_2_13_w, p_3_2_12_w}  = {ominusdp_3_2_w[143:108]};   
assign  {p_3_2_19_w, p_3_2_18_w, p_3_2_17_w, p_3_2_16_w}  = {ominusdp_3_2_w[179:144]};   
assign  {p_3_2_23_w, p_3_2_22_w, p_3_2_21_w, p_3_2_20_w}  = {ominusdp_3_2_w[215:180]};   
assign  {p_3_2_27_w, p_3_2_26_w, p_3_2_25_w, p_3_2_24_w}  = {ominusdp_3_2_w[251:216]};   
assign  {p_3_2_31_w, p_3_2_30_w, p_3_2_29_w, p_3_2_28_w}  = {ominusdp_3_2_w[287:252]}; 

assign  {p_3_3_3_w , p_3_3_2_w , p_3_3_1_w , p_3_3_0_w }  = {ominusdp_3_3_w[ 35:0  ]};   
assign  {p_3_3_7_w , p_3_3_6_w , p_3_3_5_w , p_3_3_4_w }  = {ominusdp_3_3_w[ 71:36 ]};   
assign  {p_3_3_11_w, p_3_3_10_w, p_3_3_9_w , p_3_3_8_w }  = {ominusdp_3_3_w[107:72 ]};   
assign  {p_3_3_15_w, p_3_3_14_w, p_3_3_13_w, p_3_3_12_w}  = {ominusdp_3_3_w[143:108]};   
assign  {p_3_3_19_w, p_3_3_18_w, p_3_3_17_w, p_3_3_16_w}  = {ominusdp_3_3_w[179:144]};   
assign  {p_3_3_23_w, p_3_3_22_w, p_3_3_21_w, p_3_3_20_w}  = {ominusdp_3_3_w[215:180]};   
assign  {p_3_3_27_w, p_3_3_26_w, p_3_3_25_w, p_3_3_24_w}  = {ominusdp_3_3_w[251:216]};   
assign  {p_3_3_31_w, p_3_3_30_w, p_3_3_29_w, p_3_3_28_w}  = {ominusdp_3_3_w[287:252]}; 

assign  {q_0_0_3_w , q_0_0_2_w , q_0_0_1_w , q_0_0_0_w }  = {ominusdq_0_0_w[ 35:0  ]};   
assign  {q_0_0_7_w , q_0_0_6_w , q_0_0_5_w , q_0_0_4_w }  = {ominusdq_0_0_w[ 71:36 ]};   
assign  {q_0_0_11_w, q_0_0_10_w, q_0_0_9_w , q_0_0_8_w }  = {ominusdq_0_0_w[107:72 ]};   
assign  {q_0_0_15_w, q_0_0_14_w, q_0_0_13_w, q_0_0_12_w}  = {ominusdq_0_0_w[143:108]};   
assign  {q_0_0_19_w, q_0_0_18_w, q_0_0_17_w, q_0_0_16_w}  = {ominusdq_0_0_w[179:144]};   
assign  {q_0_0_23_w, q_0_0_22_w, q_0_0_21_w, q_0_0_20_w}  = {ominusdq_0_0_w[215:180]};   
assign  {q_0_0_27_w, q_0_0_26_w, q_0_0_25_w, q_0_0_24_w}  = {ominusdq_0_0_w[251:216]};   
assign  {q_0_0_31_w, q_0_0_30_w, q_0_0_29_w, q_0_0_28_w}  = {ominusdq_0_0_w[287:252]}; 

assign  {q_0_1_3_w , q_0_1_2_w , q_0_1_1_w , q_0_1_0_w }  = {ominusdq_0_1_w[ 35:0  ]};   
assign  {q_0_1_7_w , q_0_1_6_w , q_0_1_5_w , q_0_1_4_w }  = {ominusdq_0_1_w[ 71:36 ]};   
assign  {q_0_1_11_w, q_0_1_10_w, q_0_1_9_w , q_0_1_8_w }  = {ominusdq_0_1_w[107:72 ]};   
assign  {q_0_1_15_w, q_0_1_14_w, q_0_1_13_w, q_0_1_12_w}  = {ominusdq_0_1_w[143:108]};   
assign  {q_0_1_19_w, q_0_1_18_w, q_0_1_17_w, q_0_1_16_w}  = {ominusdq_0_1_w[179:144]};   
assign  {q_0_1_23_w, q_0_1_22_w, q_0_1_21_w, q_0_1_20_w}  = {ominusdq_0_1_w[215:180]};   
assign  {q_0_1_27_w, q_0_1_26_w, q_0_1_25_w, q_0_1_24_w}  = {ominusdq_0_1_w[251:216]};   
assign  {q_0_1_31_w, q_0_1_30_w, q_0_1_29_w, q_0_1_28_w}  = {ominusdq_0_1_w[287:252]}; 

assign  {q_0_2_3_w , q_0_2_2_w , q_0_2_1_w , q_0_2_0_w }  = {ominusdq_0_2_w[ 35:0  ]};   
assign  {q_0_2_7_w , q_0_2_6_w , q_0_2_5_w , q_0_2_4_w }  = {ominusdq_0_2_w[ 71:36 ]};   
assign  {q_0_2_11_w, q_0_2_10_w, q_0_2_9_w , q_0_2_8_w }  = {ominusdq_0_2_w[107:72 ]};   
assign  {q_0_2_15_w, q_0_2_14_w, q_0_2_13_w, q_0_2_12_w}  = {ominusdq_0_2_w[143:108]};   
assign  {q_0_2_19_w, q_0_2_18_w, q_0_2_17_w, q_0_2_16_w}  = {ominusdq_0_2_w[179:144]};   
assign  {q_0_2_23_w, q_0_2_22_w, q_0_2_21_w, q_0_2_20_w}  = {ominusdq_0_2_w[215:180]};   
assign  {q_0_2_27_w, q_0_2_26_w, q_0_2_25_w, q_0_2_24_w}  = {ominusdq_0_2_w[251:216]};   
assign  {q_0_2_31_w, q_0_2_30_w, q_0_2_29_w, q_0_2_28_w}  = {ominusdq_0_2_w[287:252]}; 

assign  {q_0_3_3_w , q_0_3_2_w , q_0_3_1_w , q_0_3_0_w }  = {ominusdq_0_3_w[ 35:0  ]};   
assign  {q_0_3_7_w , q_0_3_6_w , q_0_3_5_w , q_0_3_4_w }  = {ominusdq_0_3_w[ 71:36 ]};   
assign  {q_0_3_11_w, q_0_3_10_w, q_0_3_9_w , q_0_3_8_w }  = {ominusdq_0_3_w[107:72 ]};   
assign  {q_0_3_15_w, q_0_3_14_w, q_0_3_13_w, q_0_3_12_w}  = {ominusdq_0_3_w[143:108]};   
assign  {q_0_3_19_w, q_0_3_18_w, q_0_3_17_w, q_0_3_16_w}  = {ominusdq_0_3_w[179:144]};   
assign  {q_0_3_23_w, q_0_3_22_w, q_0_3_21_w, q_0_3_20_w}  = {ominusdq_0_3_w[215:180]};   
assign  {q_0_3_27_w, q_0_3_26_w, q_0_3_25_w, q_0_3_24_w}  = {ominusdq_0_3_w[251:216]};   
assign  {q_0_3_31_w, q_0_3_30_w, q_0_3_29_w, q_0_3_28_w}  = {ominusdq_0_3_w[287:252]}; 

assign  {q_1_0_3_w , q_1_0_2_w , q_1_0_1_w , q_1_0_0_w }  = {ominusdq_1_0_w[ 35:0  ]};   
assign  {q_1_0_7_w , q_1_0_6_w , q_1_0_5_w , q_1_0_4_w }  = {ominusdq_1_0_w[ 71:36 ]};   
assign  {q_1_0_11_w, q_1_0_10_w, q_1_0_9_w , q_1_0_8_w }  = {ominusdq_1_0_w[107:72 ]};   
assign  {q_1_0_15_w, q_1_0_14_w, q_1_0_13_w, q_1_0_12_w}  = {ominusdq_1_0_w[143:108]};   
assign  {q_1_0_19_w, q_1_0_18_w, q_1_0_17_w, q_1_0_16_w}  = {ominusdq_1_0_w[179:144]};   
assign  {q_1_0_23_w, q_1_0_22_w, q_1_0_21_w, q_1_0_20_w}  = {ominusdq_1_0_w[215:180]};   
assign  {q_1_0_27_w, q_1_0_26_w, q_1_0_25_w, q_1_0_24_w}  = {ominusdq_1_0_w[251:216]};   
assign  {q_1_0_31_w, q_1_0_30_w, q_1_0_29_w, q_1_0_28_w}  = {ominusdq_1_0_w[287:252]}; 

assign  {q_1_1_3_w , q_1_1_2_w , q_1_1_1_w , q_1_1_0_w }  = {ominusdq_1_1_w[ 35:0  ]};   
assign  {q_1_1_7_w , q_1_1_6_w , q_1_1_5_w , q_1_1_4_w }  = {ominusdq_1_1_w[ 71:36 ]};   
assign  {q_1_1_11_w, q_1_1_10_w, q_1_1_9_w , q_1_1_8_w }  = {ominusdq_1_1_w[107:72 ]};   
assign  {q_1_1_15_w, q_1_1_14_w, q_1_1_13_w, q_1_1_12_w}  = {ominusdq_1_1_w[143:108]};   
assign  {q_1_1_19_w, q_1_1_18_w, q_1_1_17_w, q_1_1_16_w}  = {ominusdq_1_1_w[179:144]};   
assign  {q_1_1_23_w, q_1_1_22_w, q_1_1_21_w, q_1_1_20_w}  = {ominusdq_1_1_w[215:180]};   
assign  {q_1_1_27_w, q_1_1_26_w, q_1_1_25_w, q_1_1_24_w}  = {ominusdq_1_1_w[251:216]};   
assign  {q_1_1_31_w, q_1_1_30_w, q_1_1_29_w, q_1_1_28_w}  = {ominusdq_1_1_w[287:252]}; 

assign  {q_1_2_3_w , q_1_2_2_w , q_1_2_1_w , q_1_2_0_w }  = {ominusdq_1_2_w[ 35:0  ]};   
assign  {q_1_2_7_w , q_1_2_6_w , q_1_2_5_w , q_1_2_4_w }  = {ominusdq_1_2_w[ 71:36 ]};   
assign  {q_1_2_11_w, q_1_2_10_w, q_1_2_9_w , q_1_2_8_w }  = {ominusdq_1_2_w[107:72 ]};   
assign  {q_1_2_15_w, q_1_2_14_w, q_1_2_13_w, q_1_2_12_w}  = {ominusdq_1_2_w[143:108]};   
assign  {q_1_2_19_w, q_1_2_18_w, q_1_2_17_w, q_1_2_16_w}  = {ominusdq_1_2_w[179:144]};   
assign  {q_1_2_23_w, q_1_2_22_w, q_1_2_21_w, q_1_2_20_w}  = {ominusdq_1_2_w[215:180]};   
assign  {q_1_2_27_w, q_1_2_26_w, q_1_2_25_w, q_1_2_24_w}  = {ominusdq_1_2_w[251:216]};   
assign  {q_1_2_31_w, q_1_2_30_w, q_1_2_29_w, q_1_2_28_w}  = {ominusdq_1_2_w[287:252]}; 

assign  {q_1_3_3_w , q_1_3_2_w , q_1_3_1_w , q_1_3_0_w }  = {ominusdq_1_3_w[ 35:0  ]};   
assign  {q_1_3_7_w , q_1_3_6_w , q_1_3_5_w , q_1_3_4_w }  = {ominusdq_1_3_w[ 71:36 ]};   
assign  {q_1_3_11_w, q_1_3_10_w, q_1_3_9_w , q_1_3_8_w }  = {ominusdq_1_3_w[107:72 ]};   
assign  {q_1_3_15_w, q_1_3_14_w, q_1_3_13_w, q_1_3_12_w}  = {ominusdq_1_3_w[143:108]};   
assign  {q_1_3_19_w, q_1_3_18_w, q_1_3_17_w, q_1_3_16_w}  = {ominusdq_1_3_w[179:144]};   
assign  {q_1_3_23_w, q_1_3_22_w, q_1_3_21_w, q_1_3_20_w}  = {ominusdq_1_3_w[215:180]};   
assign  {q_1_3_27_w, q_1_3_26_w, q_1_3_25_w, q_1_3_24_w}  = {ominusdq_1_3_w[251:216]};   
assign  {q_1_3_31_w, q_1_3_30_w, q_1_3_29_w, q_1_3_28_w}  = {ominusdq_1_3_w[287:252]}; 

assign  {q_2_0_3_w , q_2_0_2_w , q_2_0_1_w , q_2_0_0_w }  = {ominusdq_2_0_w[ 35:0  ]};   
assign  {q_2_0_7_w , q_2_0_6_w , q_2_0_5_w , q_2_0_4_w }  = {ominusdq_2_0_w[ 71:36 ]};   
assign  {q_2_0_11_w, q_2_0_10_w, q_2_0_9_w , q_2_0_8_w }  = {ominusdq_2_0_w[107:72 ]};   
assign  {q_2_0_15_w, q_2_0_14_w, q_2_0_13_w, q_2_0_12_w}  = {ominusdq_2_0_w[143:108]};   
assign  {q_2_0_19_w, q_2_0_18_w, q_2_0_17_w, q_2_0_16_w}  = {ominusdq_2_0_w[179:144]};   
assign  {q_2_0_23_w, q_2_0_22_w, q_2_0_21_w, q_2_0_20_w}  = {ominusdq_2_0_w[215:180]};   
assign  {q_2_0_27_w, q_2_0_26_w, q_2_0_25_w, q_2_0_24_w}  = {ominusdq_2_0_w[251:216]};   
assign  {q_2_0_31_w, q_2_0_30_w, q_2_0_29_w, q_2_0_28_w}  = {ominusdq_2_0_w[287:252]}; 

assign  {q_2_1_3_w , q_2_1_2_w , q_2_1_1_w , q_2_1_0_w }  = {ominusdq_2_1_w[ 35:0  ]};   
assign  {q_2_1_7_w , q_2_1_6_w , q_2_1_5_w , q_2_1_4_w }  = {ominusdq_2_1_w[ 71:36 ]};   
assign  {q_2_1_11_w, q_2_1_10_w, q_2_1_9_w , q_2_1_8_w }  = {ominusdq_2_1_w[107:72 ]};   
assign  {q_2_1_15_w, q_2_1_14_w, q_2_1_13_w, q_2_1_12_w}  = {ominusdq_2_1_w[143:108]};   
assign  {q_2_1_19_w, q_2_1_18_w, q_2_1_17_w, q_2_1_16_w}  = {ominusdq_2_1_w[179:144]};   
assign  {q_2_1_23_w, q_2_1_22_w, q_2_1_21_w, q_2_1_20_w}  = {ominusdq_2_1_w[215:180]};   
assign  {q_2_1_27_w, q_2_1_26_w, q_2_1_25_w, q_2_1_24_w}  = {ominusdq_2_1_w[251:216]};   
assign  {q_2_1_31_w, q_2_1_30_w, q_2_1_29_w, q_2_1_28_w}  = {ominusdq_2_1_w[287:252]}; 

assign  {q_2_2_3_w , q_2_2_2_w , q_2_2_1_w , q_2_2_0_w }  = {ominusdq_2_2_w[ 35:0  ]};   
assign  {q_2_2_7_w , q_2_2_6_w , q_2_2_5_w , q_2_2_4_w }  = {ominusdq_2_2_w[ 71:36 ]};   
assign  {q_2_2_11_w, q_2_2_10_w, q_2_2_9_w , q_2_2_8_w }  = {ominusdq_2_2_w[107:72 ]};   
assign  {q_2_2_15_w, q_2_2_14_w, q_2_2_13_w, q_2_2_12_w}  = {ominusdq_2_2_w[143:108]};   
assign  {q_2_2_19_w, q_2_2_18_w, q_2_2_17_w, q_2_2_16_w}  = {ominusdq_2_2_w[179:144]};   
assign  {q_2_2_23_w, q_2_2_22_w, q_2_2_21_w, q_2_2_20_w}  = {ominusdq_2_2_w[215:180]};   
assign  {q_2_2_27_w, q_2_2_26_w, q_2_2_25_w, q_2_2_24_w}  = {ominusdq_2_2_w[251:216]};   
assign  {q_2_2_31_w, q_2_2_30_w, q_2_2_29_w, q_2_2_28_w}  = {ominusdq_2_2_w[287:252]}; 

assign  {q_2_3_3_w , q_2_3_2_w , q_2_3_1_w , q_2_3_0_w }  = {ominusdq_2_3_w[ 35:0  ]};   
assign  {q_2_3_7_w , q_2_3_6_w , q_2_3_5_w , q_2_3_4_w }  = {ominusdq_2_3_w[ 71:36 ]};   
assign  {q_2_3_11_w, q_2_3_10_w, q_2_3_9_w , q_2_3_8_w }  = {ominusdq_2_3_w[107:72 ]};   
assign  {q_2_3_15_w, q_2_3_14_w, q_2_3_13_w, q_2_3_12_w}  = {ominusdq_2_3_w[143:108]};   
assign  {q_2_3_19_w, q_2_3_18_w, q_2_3_17_w, q_2_3_16_w}  = {ominusdq_2_3_w[179:144]};   
assign  {q_2_3_23_w, q_2_3_22_w, q_2_3_21_w, q_2_3_20_w}  = {ominusdq_2_3_w[215:180]};   
assign  {q_2_3_27_w, q_2_3_26_w, q_2_3_25_w, q_2_3_24_w}  = {ominusdq_2_3_w[251:216]};   
assign  {q_2_3_31_w, q_2_3_30_w, q_2_3_29_w, q_2_3_28_w}  = {ominusdq_2_3_w[287:252]}; 

assign  {q_3_0_3_w , q_3_0_2_w , q_3_0_1_w , q_3_0_0_w }  = {ominusdq_3_0_w[ 35:0  ]};   
assign  {q_3_0_7_w , q_3_0_6_w , q_3_0_5_w , q_3_0_4_w }  = {ominusdq_3_0_w[ 71:36 ]};   
assign  {q_3_0_11_w, q_3_0_10_w, q_3_0_9_w , q_3_0_8_w }  = {ominusdq_3_0_w[107:72 ]};   
assign  {q_3_0_15_w, q_3_0_14_w, q_3_0_13_w, q_3_0_12_w}  = {ominusdq_3_0_w[143:108]};   
assign  {q_3_0_19_w, q_3_0_18_w, q_3_0_17_w, q_3_0_16_w}  = {ominusdq_3_0_w[179:144]};   
assign  {q_3_0_23_w, q_3_0_22_w, q_3_0_21_w, q_3_0_20_w}  = {ominusdq_3_0_w[215:180]};   
assign  {q_3_0_27_w, q_3_0_26_w, q_3_0_25_w, q_3_0_24_w}  = {ominusdq_3_0_w[251:216]};   
assign  {q_3_0_31_w, q_3_0_30_w, q_3_0_29_w, q_3_0_28_w}  = {ominusdq_3_0_w[287:252]}; 

assign  {q_3_1_3_w , q_3_1_2_w , q_3_1_1_w , q_3_1_0_w }  = {ominusdq_3_1_w[ 35:0  ]};   
assign  {q_3_1_7_w , q_3_1_6_w , q_3_1_5_w , q_3_1_4_w }  = {ominusdq_3_1_w[ 71:36 ]};   
assign  {q_3_1_11_w, q_3_1_10_w, q_3_1_9_w , q_3_1_8_w }  = {ominusdq_3_1_w[107:72 ]};   
assign  {q_3_1_15_w, q_3_1_14_w, q_3_1_13_w, q_3_1_12_w}  = {ominusdq_3_1_w[143:108]};   
assign  {q_3_1_19_w, q_3_1_18_w, q_3_1_17_w, q_3_1_16_w}  = {ominusdq_3_1_w[179:144]};   
assign  {q_3_1_23_w, q_3_1_22_w, q_3_1_21_w, q_3_1_20_w}  = {ominusdq_3_1_w[215:180]};   
assign  {q_3_1_27_w, q_3_1_26_w, q_3_1_25_w, q_3_1_24_w}  = {ominusdq_3_1_w[251:216]};   
assign  {q_3_1_31_w, q_3_1_30_w, q_3_1_29_w, q_3_1_28_w}  = {ominusdq_3_1_w[287:252]}; 

assign  {q_3_2_3_w , q_3_2_2_w , q_3_2_1_w , q_3_2_0_w }  = {ominusdq_3_2_w[ 35:0  ]};   
assign  {q_3_2_7_w , q_3_2_6_w , q_3_2_5_w , q_3_2_4_w }  = {ominusdq_3_2_w[ 71:36 ]};   
assign  {q_3_2_11_w, q_3_2_10_w, q_3_2_9_w , q_3_2_8_w }  = {ominusdq_3_2_w[107:72 ]};   
assign  {q_3_2_15_w, q_3_2_14_w, q_3_2_13_w, q_3_2_12_w}  = {ominusdq_3_2_w[143:108]};   
assign  {q_3_2_19_w, q_3_2_18_w, q_3_2_17_w, q_3_2_16_w}  = {ominusdq_3_2_w[179:144]};   
assign  {q_3_2_23_w, q_3_2_22_w, q_3_2_21_w, q_3_2_20_w}  = {ominusdq_3_2_w[215:180]};   
assign  {q_3_2_27_w, q_3_2_26_w, q_3_2_25_w, q_3_2_24_w}  = {ominusdq_3_2_w[251:216]};   
assign  {q_3_2_31_w, q_3_2_30_w, q_3_2_29_w, q_3_2_28_w}  = {ominusdq_3_2_w[287:252]}; 

assign  {q_3_3_3_w , q_3_3_2_w , q_3_3_1_w , q_3_3_0_w }  = {ominusdq_3_3_w[ 35:0  ]};   
assign  {q_3_3_7_w , q_3_3_6_w , q_3_3_5_w , q_3_3_4_w }  = {ominusdq_3_3_w[ 71:36 ]};   
assign  {q_3_3_11_w, q_3_3_10_w, q_3_3_9_w , q_3_3_8_w }  = {ominusdq_3_3_w[107:72 ]};   
assign  {q_3_3_15_w, q_3_3_14_w, q_3_3_13_w, q_3_3_12_w}  = {ominusdq_3_3_w[143:108]};   
assign  {q_3_3_19_w, q_3_3_18_w, q_3_3_17_w, q_3_3_16_w}  = {ominusdq_3_3_w[179:144]};   
assign  {q_3_3_23_w, q_3_3_22_w, q_3_3_21_w, q_3_3_20_w}  = {ominusdq_3_3_w[215:180]};   
assign  {q_3_3_27_w, q_3_3_26_w, q_3_3_25_w, q_3_3_24_w}  = {ominusdq_3_3_w[251:216]};   
assign  {q_3_3_31_w, q_3_3_30_w, q_3_3_29_w, q_3_3_28_w}  = {ominusdq_3_3_w[287:252]}; 

assign  b_state_0_w  =  p_0_0_0_w  +  p_0_1_0_w  +  p_0_2_0_w  +  p_0_3_0_w +
                        p_1_0_0_w  +  p_1_1_0_w  +  p_1_2_0_w  +  p_1_3_0_w +
                        p_2_0_0_w  +  p_2_1_0_w  +  p_2_2_0_w  +  p_2_3_0_w +
                        p_3_0_0_w  +  p_3_1_0_w  +  p_3_2_0_w  +  p_3_3_0_w +
                        q_0_0_0_w  +  q_0_1_0_w  +  q_0_2_0_w  +  q_0_3_0_w +
                        q_1_0_0_w  +  q_1_1_0_w  +  q_1_2_0_w  +  q_1_3_0_w +
                        q_2_0_0_w  +  q_2_1_0_w  +  q_2_2_0_w  +  q_2_3_0_w +
                        q_3_0_0_w  +  q_3_1_0_w  +  q_3_2_0_w  +  q_3_3_0_w ;

assign  b_state_1_w  =  p_0_0_1_w  +  p_0_1_1_w  +  p_0_2_1_w  +  p_0_3_1_w +
                        p_1_0_1_w  +  p_1_1_1_w  +  p_1_2_1_w  +  p_1_3_1_w +
                        p_2_0_1_w  +  p_2_1_1_w  +  p_2_2_1_w  +  p_2_3_1_w +
                        p_3_0_1_w  +  p_3_1_1_w  +  p_3_2_1_w  +  p_3_3_1_w +
                        q_0_0_1_w  +  q_0_1_1_w  +  q_0_2_1_w  +  q_0_3_1_w +
                        q_1_0_1_w  +  q_1_1_1_w  +  q_1_2_1_w  +  q_1_3_1_w +
                        q_2_0_1_w  +  q_2_1_1_w  +  q_2_2_1_w  +  q_2_3_1_w +
                        q_3_0_1_w  +  q_3_1_1_w  +  q_3_2_1_w  +  q_3_3_1_w ;

assign  b_state_2_w  =  p_0_0_2_w  +  p_0_1_2_w  +  p_0_2_2_w  +  p_0_3_2_w +
                        p_1_0_2_w  +  p_1_1_2_w  +  p_1_2_2_w  +  p_1_3_2_w +
                        p_2_0_2_w  +  p_2_1_2_w  +  p_2_2_2_w  +  p_2_3_2_w +
                        p_3_0_2_w  +  p_3_1_2_w  +  p_3_2_2_w  +  p_3_3_2_w +
                        q_0_0_2_w  +  q_0_1_2_w  +  q_0_2_2_w  +  q_0_3_2_w +
                        q_1_0_2_w  +  q_1_1_2_w  +  q_1_2_2_w  +  q_1_3_2_w +
                        q_2_0_2_w  +  q_2_1_2_w  +  q_2_2_2_w  +  q_2_3_2_w +
                        q_3_0_2_w  +  q_3_1_2_w  +  q_3_2_2_w  +  q_3_3_2_w ;

assign  b_state_3_w  =  p_0_0_3_w  +  p_0_1_3_w  +  p_0_2_3_w  +  p_0_3_3_w +
                        p_1_0_3_w  +  p_1_1_3_w  +  p_1_2_3_w  +  p_1_3_3_w +
                        p_2_0_3_w  +  p_2_1_3_w  +  p_2_2_3_w  +  p_2_3_3_w +
                        p_3_0_3_w  +  p_3_1_3_w  +  p_3_2_3_w  +  p_3_3_3_w +
                        q_0_0_3_w  +  q_0_1_3_w  +  q_0_2_3_w  +  q_0_3_3_w +
                        q_1_0_3_w  +  q_1_1_3_w  +  q_1_2_3_w  +  q_1_3_3_w +
                        q_2_0_3_w  +  q_2_1_3_w  +  q_2_2_3_w  +  q_2_3_3_w +
                        q_3_0_3_w  +  q_3_1_3_w  +  q_3_2_3_w  +  q_3_3_3_w ;

assign  b_state_4_w  =  p_0_0_4_w  +  p_0_1_4_w  +  p_0_2_4_w  +  p_0_3_4_w +
                        p_1_0_4_w  +  p_1_1_4_w  +  p_1_2_4_w  +  p_1_3_4_w +
                        p_2_0_4_w  +  p_2_1_4_w  +  p_2_2_4_w  +  p_2_3_4_w +
                        p_3_0_4_w  +  p_3_1_4_w  +  p_3_2_4_w  +  p_3_3_4_w +
                        q_0_0_4_w  +  q_0_1_4_w  +  q_0_2_4_w  +  q_0_3_4_w +
                        q_1_0_4_w  +  q_1_1_4_w  +  q_1_2_4_w  +  q_1_3_4_w +
                        q_2_0_4_w  +  q_2_1_4_w  +  q_2_2_4_w  +  q_2_3_4_w +
                        q_3_0_4_w  +  q_3_1_4_w  +  q_3_2_4_w  +  q_3_3_4_w ;

assign  b_state_5_w  =  p_0_0_5_w  +  p_0_1_5_w  +  p_0_2_5_w  +  p_0_3_5_w +
                        p_1_0_5_w  +  p_1_1_5_w  +  p_1_2_5_w  +  p_1_3_5_w +
                        p_2_0_5_w  +  p_2_1_5_w  +  p_2_2_5_w  +  p_2_3_5_w +
                        p_3_0_5_w  +  p_3_1_5_w  +  p_3_2_5_w  +  p_3_3_5_w +
                        q_0_0_5_w  +  q_0_1_5_w  +  q_0_2_5_w  +  q_0_3_5_w +
                        q_1_0_5_w  +  q_1_1_5_w  +  q_1_2_5_w  +  q_1_3_5_w +
                        q_2_0_5_w  +  q_2_1_5_w  +  q_2_2_5_w  +  q_2_3_5_w +
                        q_3_0_5_w  +  q_3_1_5_w  +  q_3_2_5_w  +  q_3_3_5_w ;

assign  b_state_6_w  =  p_0_0_6_w  +  p_0_1_6_w  +  p_0_2_6_w  +  p_0_3_6_w +
                        p_1_0_6_w  +  p_1_1_6_w  +  p_1_2_6_w  +  p_1_3_6_w +
                        p_2_0_6_w  +  p_2_1_6_w  +  p_2_2_6_w  +  p_2_3_6_w +
                        p_3_0_6_w  +  p_3_1_6_w  +  p_3_2_6_w  +  p_3_3_6_w +
                        q_0_0_6_w  +  q_0_1_6_w  +  q_0_2_6_w  +  q_0_3_6_w +
                        q_1_0_6_w  +  q_1_1_6_w  +  q_1_2_6_w  +  q_1_3_6_w +
                        q_2_0_6_w  +  q_2_1_6_w  +  q_2_2_6_w  +  q_2_3_6_w +
                        q_3_0_6_w  +  q_3_1_6_w  +  q_3_2_6_w  +  q_3_3_6_w ;

assign  b_state_7_w  =  p_0_0_7_w  +  p_0_1_7_w  +  p_0_2_7_w  +  p_0_3_7_w +
                        p_1_0_7_w  +  p_1_1_7_w  +  p_1_2_7_w  +  p_1_3_7_w +
                        p_2_0_7_w  +  p_2_1_7_w  +  p_2_2_7_w  +  p_2_3_7_w +
                        p_3_0_7_w  +  p_3_1_7_w  +  p_3_2_7_w  +  p_3_3_7_w +
                        q_0_0_7_w  +  q_0_1_7_w  +  q_0_2_7_w  +  q_0_3_7_w +
                        q_1_0_7_w  +  q_1_1_7_w  +  q_1_2_7_w  +  q_1_3_7_w +
                        q_2_0_7_w  +  q_2_1_7_w  +  q_2_2_7_w  +  q_2_3_7_w +
                        q_3_0_7_w  +  q_3_1_7_w  +  q_3_2_7_w  +  q_3_3_7_w ;

assign  b_state_8_w  =  p_0_0_8_w  +  p_0_1_8_w  +  p_0_2_8_w  +  p_0_3_8_w +
                        p_1_0_8_w  +  p_1_1_8_w  +  p_1_2_8_w  +  p_1_3_8_w +
                        p_2_0_8_w  +  p_2_1_8_w  +  p_2_2_8_w  +  p_2_3_8_w +
                        p_3_0_8_w  +  p_3_1_8_w  +  p_3_2_8_w  +  p_3_3_8_w +
                        q_0_0_8_w  +  q_0_1_8_w  +  q_0_2_8_w  +  q_0_3_8_w +
                        q_1_0_8_w  +  q_1_1_8_w  +  q_1_2_8_w  +  q_1_3_8_w +
                        q_2_0_8_w  +  q_2_1_8_w  +  q_2_2_8_w  +  q_2_3_8_w +
                        q_3_0_8_w  +  q_3_1_8_w  +  q_3_2_8_w  +  q_3_3_8_w ;

assign  b_state_9_w  =  p_0_0_9_w  +  p_0_1_9_w  +  p_0_2_9_w  +  p_0_3_9_w +
                        p_1_0_9_w  +  p_1_1_9_w  +  p_1_2_9_w  +  p_1_3_9_w +
                        p_2_0_9_w  +  p_2_1_9_w  +  p_2_2_9_w  +  p_2_3_9_w +
                        p_3_0_9_w  +  p_3_1_9_w  +  p_3_2_9_w  +  p_3_3_9_w +
                        q_0_0_9_w  +  q_0_1_9_w  +  q_0_2_9_w  +  q_0_3_9_w +
                        q_1_0_9_w  +  q_1_1_9_w  +  q_1_2_9_w  +  q_1_3_9_w +
                        q_2_0_9_w  +  q_2_1_9_w  +  q_2_2_9_w  +  q_2_3_9_w +
                        q_3_0_9_w  +  q_3_1_9_w  +  q_3_2_9_w  +  q_3_3_9_w ;

assign  b_state_10_w  = p_0_0_10_w  +  p_0_1_10_w  +  p_0_2_10_w  +  p_0_3_10_w +
                        p_1_0_10_w  +  p_1_1_10_w  +  p_1_2_10_w  +  p_1_3_10_w +
                        p_2_0_10_w  +  p_2_1_10_w  +  p_2_2_10_w  +  p_2_3_10_w +
                        p_3_0_10_w  +  p_3_1_10_w  +  p_3_2_10_w  +  p_3_3_10_w +
                        q_0_0_10_w  +  q_0_1_10_w  +  q_0_2_10_w  +  q_0_3_10_w +
                        q_1_0_10_w  +  q_1_1_10_w  +  q_1_2_10_w  +  q_1_3_10_w +
                        q_2_0_10_w  +  q_2_1_10_w  +  q_2_2_10_w  +  q_2_3_10_w +
                        q_3_0_10_w  +  q_3_1_10_w  +  q_3_2_10_w  +  q_3_3_10_w ;

assign  b_state_11_w  = p_0_0_11_w  +  p_0_1_11_w  +  p_0_2_11_w  +  p_0_3_11_w +
                        p_1_0_11_w  +  p_1_1_11_w  +  p_1_2_11_w  +  p_1_3_11_w +
                        p_2_0_11_w  +  p_2_1_11_w  +  p_2_2_11_w  +  p_2_3_11_w +
                        p_3_0_11_w  +  p_3_1_11_w  +  p_3_2_11_w  +  p_3_3_11_w +
                        q_0_0_11_w  +  q_0_1_11_w  +  q_0_2_11_w  +  q_0_3_11_w +
                        q_1_0_11_w  +  q_1_1_11_w  +  q_1_2_11_w  +  q_1_3_11_w +
                        q_2_0_11_w  +  q_2_1_11_w  +  q_2_2_11_w  +  q_2_3_11_w +
                        q_3_0_11_w  +  q_3_1_11_w  +  q_3_2_11_w  +  q_3_3_11_w ;

assign  b_state_12_w  = p_0_0_12_w  +  p_0_1_12_w  +  p_0_2_12_w  +  p_0_3_12_w +
                        p_1_0_12_w  +  p_1_1_12_w  +  p_1_2_12_w  +  p_1_3_12_w +
                        p_2_0_12_w  +  p_2_1_12_w  +  p_2_2_12_w  +  p_2_3_12_w +
                        p_3_0_12_w  +  p_3_1_12_w  +  p_3_2_12_w  +  p_3_3_12_w +
                        q_0_0_12_w  +  q_0_1_12_w  +  q_0_2_12_w  +  q_0_3_12_w +
                        q_1_0_12_w  +  q_1_1_12_w  +  q_1_2_12_w  +  q_1_3_12_w +
                        q_2_0_12_w  +  q_2_1_12_w  +  q_2_2_12_w  +  q_2_3_12_w +
                        q_3_0_12_w  +  q_3_1_12_w  +  q_3_2_12_w  +  q_3_3_12_w ;

assign  b_state_13_w  = p_0_0_13_w  +  p_0_1_13_w  +  p_0_2_13_w  +  p_0_3_13_w +
                        p_1_0_13_w  +  p_1_1_13_w  +  p_1_2_13_w  +  p_1_3_13_w +
                        p_2_0_13_w  +  p_2_1_13_w  +  p_2_2_13_w  +  p_2_3_13_w +
                        p_3_0_13_w  +  p_3_1_13_w  +  p_3_2_13_w  +  p_3_3_13_w +
                        q_0_0_13_w  +  q_0_1_13_w  +  q_0_2_13_w  +  q_0_3_13_w +
                        q_1_0_13_w  +  q_1_1_13_w  +  q_1_2_13_w  +  q_1_3_13_w +
                        q_2_0_13_w  +  q_2_1_13_w  +  q_2_2_13_w  +  q_2_3_13_w +
                        q_3_0_13_w  +  q_3_1_13_w  +  q_3_2_13_w  +  q_3_3_13_w ;

assign  b_state_14_w  = p_0_0_14_w  +  p_0_1_14_w  +  p_0_2_14_w  +  p_0_3_14_w +
                        p_1_0_14_w  +  p_1_1_14_w  +  p_1_2_14_w  +  p_1_3_14_w +
                        p_2_0_14_w  +  p_2_1_14_w  +  p_2_2_14_w  +  p_2_3_14_w +
                        p_3_0_14_w  +  p_3_1_14_w  +  p_3_2_14_w  +  p_3_3_14_w +
                        q_0_0_14_w  +  q_0_1_14_w  +  q_0_2_14_w  +  q_0_3_14_w +
                        q_1_0_14_w  +  q_1_1_14_w  +  q_1_2_14_w  +  q_1_3_14_w +
                        q_2_0_14_w  +  q_2_1_14_w  +  q_2_2_14_w  +  q_2_3_14_w +
                        q_3_0_14_w  +  q_3_1_14_w  +  q_3_2_14_w  +  q_3_3_14_w ;

assign  b_state_15_w  = p_0_0_15_w  +  p_0_1_15_w  +  p_0_2_15_w  +  p_0_3_15_w +
                        p_1_0_15_w  +  p_1_1_15_w  +  p_1_2_15_w  +  p_1_3_15_w +
                        p_2_0_15_w  +  p_2_1_15_w  +  p_2_2_15_w  +  p_2_3_15_w +
                        p_3_0_15_w  +  p_3_1_15_w  +  p_3_2_15_w  +  p_3_3_15_w +
                        q_0_0_15_w  +  q_0_1_15_w  +  q_0_2_15_w  +  q_0_3_15_w +
                        q_1_0_15_w  +  q_1_1_15_w  +  q_1_2_15_w  +  q_1_3_15_w +
                        q_2_0_15_w  +  q_2_1_15_w  +  q_2_2_15_w  +  q_2_3_15_w +
                        q_3_0_15_w  +  q_3_1_15_w  +  q_3_2_15_w  +  q_3_3_15_w ;

assign  b_state_16_w  = p_0_0_16_w  +  p_0_1_16_w  +  p_0_2_16_w  +  p_0_3_16_w +
                        p_1_0_16_w  +  p_1_1_16_w  +  p_1_2_16_w  +  p_1_3_16_w +
                        p_2_0_16_w  +  p_2_1_16_w  +  p_2_2_16_w  +  p_2_3_16_w +
                        p_3_0_16_w  +  p_3_1_16_w  +  p_3_2_16_w  +  p_3_3_16_w +
                        q_0_0_16_w  +  q_0_1_16_w  +  q_0_2_16_w  +  q_0_3_16_w +
                        q_1_0_16_w  +  q_1_1_16_w  +  q_1_2_16_w  +  q_1_3_16_w +
                        q_2_0_16_w  +  q_2_1_16_w  +  q_2_2_16_w  +  q_2_3_16_w +
                        q_3_0_16_w  +  q_3_1_16_w  +  q_3_2_16_w  +  q_3_3_16_w ;

assign  b_state_17_w  = p_0_0_17_w  +  p_0_1_17_w  +  p_0_2_17_w  +  p_0_3_17_w +
                        p_1_0_17_w  +  p_1_1_17_w  +  p_1_2_17_w  +  p_1_3_17_w +
                        p_2_0_17_w  +  p_2_1_17_w  +  p_2_2_17_w  +  p_2_3_17_w +
                        p_3_0_17_w  +  p_3_1_17_w  +  p_3_2_17_w  +  p_3_3_17_w +
                        q_0_0_17_w  +  q_0_1_17_w  +  q_0_2_17_w  +  q_0_3_17_w +
                        q_1_0_17_w  +  q_1_1_17_w  +  q_1_2_17_w  +  q_1_3_17_w +
                        q_2_0_17_w  +  q_2_1_17_w  +  q_2_2_17_w  +  q_2_3_17_w +
                        q_3_0_17_w  +  q_3_1_17_w  +  q_3_2_17_w  +  q_3_3_17_w ;

assign  b_state_18_w  = p_0_0_18_w  +  p_0_1_18_w  +  p_0_2_18_w  +  p_0_3_18_w +
                        p_1_0_18_w  +  p_1_1_18_w  +  p_1_2_18_w  +  p_1_3_18_w +
                        p_2_0_18_w  +  p_2_1_18_w  +  p_2_2_18_w  +  p_2_3_18_w +
                        p_3_0_18_w  +  p_3_1_18_w  +  p_3_2_18_w  +  p_3_3_18_w +
                        q_0_0_18_w  +  q_0_1_18_w  +  q_0_2_18_w  +  q_0_3_18_w +
                        q_1_0_18_w  +  q_1_1_18_w  +  q_1_2_18_w  +  q_1_3_18_w +
                        q_2_0_18_w  +  q_2_1_18_w  +  q_2_2_18_w  +  q_2_3_18_w +
                        q_3_0_18_w  +  q_3_1_18_w  +  q_3_2_18_w  +  q_3_3_18_w ;

assign  b_state_19_w  = p_0_0_19_w  +  p_0_1_19_w  +  p_0_2_19_w  +  p_0_3_19_w +
                        p_1_0_19_w  +  p_1_1_19_w  +  p_1_2_19_w  +  p_1_3_19_w +
                        p_2_0_19_w  +  p_2_1_19_w  +  p_2_2_19_w  +  p_2_3_19_w +
                        p_3_0_19_w  +  p_3_1_19_w  +  p_3_2_19_w  +  p_3_3_19_w +
                        q_0_0_19_w  +  q_0_1_19_w  +  q_0_2_19_w  +  q_0_3_19_w +
                        q_1_0_19_w  +  q_1_1_19_w  +  q_1_2_19_w  +  q_1_3_19_w +
                        q_2_0_19_w  +  q_2_1_19_w  +  q_2_2_19_w  +  q_2_3_19_w +
                        q_3_0_19_w  +  q_3_1_19_w  +  q_3_2_19_w  +  q_3_3_19_w ;

assign  b_state_20_w  = p_0_0_20_w  +  p_0_1_20_w  +  p_0_2_20_w  +  p_0_3_20_w +
                        p_1_0_20_w  +  p_1_1_20_w  +  p_1_2_20_w  +  p_1_3_20_w +
                        p_2_0_20_w  +  p_2_1_20_w  +  p_2_2_20_w  +  p_2_3_20_w +
                        p_3_0_20_w  +  p_3_1_20_w  +  p_3_2_20_w  +  p_3_3_20_w +
                        q_0_0_20_w  +  q_0_1_20_w  +  q_0_2_20_w  +  q_0_3_20_w +
                        q_1_0_20_w  +  q_1_1_20_w  +  q_1_2_20_w  +  q_1_3_20_w +
                        q_2_0_20_w  +  q_2_1_20_w  +  q_2_2_20_w  +  q_2_3_20_w +
                        q_3_0_20_w  +  q_3_1_20_w  +  q_3_2_20_w  +  q_3_3_20_w ;

assign  b_state_21_w  = p_0_0_21_w  +  p_0_1_21_w  +  p_0_2_21_w  +  p_0_3_21_w +
                        p_1_0_21_w  +  p_1_1_21_w  +  p_1_2_21_w  +  p_1_3_21_w +
                        p_2_0_21_w  +  p_2_1_21_w  +  p_2_2_21_w  +  p_2_3_21_w +
                        p_3_0_21_w  +  p_3_1_21_w  +  p_3_2_21_w  +  p_3_3_21_w +
                        q_0_0_21_w  +  q_0_1_21_w  +  q_0_2_21_w  +  q_0_3_21_w +
                        q_1_0_21_w  +  q_1_1_21_w  +  q_1_2_21_w  +  q_1_3_21_w +
                        q_2_0_21_w  +  q_2_1_21_w  +  q_2_2_21_w  +  q_2_3_21_w +
                        q_3_0_21_w  +  q_3_1_21_w  +  q_3_2_21_w  +  q_3_3_21_w ;

assign  b_state_22_w  = p_0_0_22_w  +  p_0_1_22_w  +  p_0_2_22_w  +  p_0_3_22_w +
                        p_1_0_22_w  +  p_1_1_22_w  +  p_1_2_22_w  +  p_1_3_22_w +
                        p_2_0_22_w  +  p_2_1_22_w  +  p_2_2_22_w  +  p_2_3_22_w +
                        p_3_0_22_w  +  p_3_1_22_w  +  p_3_2_22_w  +  p_3_3_22_w +
                        q_0_0_22_w  +  q_0_1_22_w  +  q_0_2_22_w  +  q_0_3_22_w +
                        q_1_0_22_w  +  q_1_1_22_w  +  q_1_2_22_w  +  q_1_3_22_w +
                        q_2_0_22_w  +  q_2_1_22_w  +  q_2_2_22_w  +  q_2_3_22_w +
                        q_3_0_22_w  +  q_3_1_22_w  +  q_3_2_22_w  +  q_3_3_22_w ;

assign  b_state_23_w  = p_0_0_23_w  +  p_0_1_23_w  +  p_0_2_23_w  +  p_0_3_23_w +
                        p_1_0_23_w  +  p_1_1_23_w  +  p_1_2_23_w  +  p_1_3_23_w +
                        p_2_0_23_w  +  p_2_1_23_w  +  p_2_2_23_w  +  p_2_3_23_w +
                        p_3_0_23_w  +  p_3_1_23_w  +  p_3_2_23_w  +  p_3_3_23_w +
                        q_0_0_23_w  +  q_0_1_23_w  +  q_0_2_23_w  +  q_0_3_23_w +
                        q_1_0_23_w  +  q_1_1_23_w  +  q_1_2_23_w  +  q_1_3_23_w +
                        q_2_0_23_w  +  q_2_1_23_w  +  q_2_2_23_w  +  q_2_3_23_w +
                        q_3_0_23_w  +  q_3_1_23_w  +  q_3_2_23_w  +  q_3_3_23_w ;

assign  b_state_24_w  = p_0_0_24_w  +  p_0_1_24_w  +  p_0_2_24_w  +  p_0_3_24_w +
                        p_1_0_24_w  +  p_1_1_24_w  +  p_1_2_24_w  +  p_1_3_24_w +
                        p_2_0_24_w  +  p_2_1_24_w  +  p_2_2_24_w  +  p_2_3_24_w +
                        p_3_0_24_w  +  p_3_1_24_w  +  p_3_2_24_w  +  p_3_3_24_w +
                        q_0_0_24_w  +  q_0_1_24_w  +  q_0_2_24_w  +  q_0_3_24_w +
                        q_1_0_24_w  +  q_1_1_24_w  +  q_1_2_24_w  +  q_1_3_24_w +
                        q_2_0_24_w  +  q_2_1_24_w  +  q_2_2_24_w  +  q_2_3_24_w +
                        q_3_0_24_w  +  q_3_1_24_w  +  q_3_2_24_w  +  q_3_3_24_w ;

assign  b_state_25_w  = p_0_0_25_w  +  p_0_1_25_w  +  p_0_2_25_w  +  p_0_3_25_w +
                        p_1_0_25_w  +  p_1_1_25_w  +  p_1_2_25_w  +  p_1_3_25_w +
                        p_2_0_25_w  +  p_2_1_25_w  +  p_2_2_25_w  +  p_2_3_25_w +
                        p_3_0_25_w  +  p_3_1_25_w  +  p_3_2_25_w  +  p_3_3_25_w +
                        q_0_0_25_w  +  q_0_1_25_w  +  q_0_2_25_w  +  q_0_3_25_w +
                        q_1_0_25_w  +  q_1_1_25_w  +  q_1_2_25_w  +  q_1_3_25_w +
                        q_2_0_25_w  +  q_2_1_25_w  +  q_2_2_25_w  +  q_2_3_25_w +
                        q_3_0_25_w  +  q_3_1_25_w  +  q_3_2_25_w  +  q_3_3_25_w ;

assign  b_state_26_w  = p_0_0_26_w  +  p_0_1_26_w  +  p_0_2_26_w  +  p_0_3_26_w +
                        p_1_0_26_w  +  p_1_1_26_w  +  p_1_2_26_w  +  p_1_3_26_w +
                        p_2_0_26_w  +  p_2_1_26_w  +  p_2_2_26_w  +  p_2_3_26_w +
                        p_3_0_26_w  +  p_3_1_26_w  +  p_3_2_26_w  +  p_3_3_26_w +
                        q_0_0_26_w  +  q_0_1_26_w  +  q_0_2_26_w  +  q_0_3_26_w +
                        q_1_0_26_w  +  q_1_1_26_w  +  q_1_2_26_w  +  q_1_3_26_w +
                        q_2_0_26_w  +  q_2_1_26_w  +  q_2_2_26_w  +  q_2_3_26_w +
                        q_3_0_26_w  +  q_3_1_26_w  +  q_3_2_26_w  +  q_3_3_26_w ;

assign  b_state_27_w  = p_0_0_27_w  +  p_0_1_27_w  +  p_0_2_27_w  +  p_0_3_27_w +
                        p_1_0_27_w  +  p_1_1_27_w  +  p_1_2_27_w  +  p_1_3_27_w +
                        p_2_0_27_w  +  p_2_1_27_w  +  p_2_2_27_w  +  p_2_3_27_w +
                        p_3_0_27_w  +  p_3_1_27_w  +  p_3_2_27_w  +  p_3_3_27_w +
                        q_0_0_27_w  +  q_0_1_27_w  +  q_0_2_27_w  +  q_0_3_27_w +
                        q_1_0_27_w  +  q_1_1_27_w  +  q_1_2_27_w  +  q_1_3_27_w +
                        q_2_0_27_w  +  q_2_1_27_w  +  q_2_2_27_w  +  q_2_3_27_w +
                        q_3_0_27_w  +  q_3_1_27_w  +  q_3_2_27_w  +  q_3_3_27_w ;

assign  b_state_28_w  = p_0_0_28_w  +  p_0_1_28_w  +  p_0_2_28_w  +  p_0_3_28_w +
                        p_1_0_28_w  +  p_1_1_28_w  +  p_1_2_28_w  +  p_1_3_28_w +
                        p_2_0_28_w  +  p_2_1_28_w  +  p_2_2_28_w  +  p_2_3_28_w +
                        p_3_0_28_w  +  p_3_1_28_w  +  p_3_2_28_w  +  p_3_3_28_w +
                        q_0_0_28_w  +  q_0_1_28_w  +  q_0_2_28_w  +  q_0_3_28_w +
                        q_1_0_28_w  +  q_1_1_28_w  +  q_1_2_28_w  +  q_1_3_28_w +
                        q_2_0_28_w  +  q_2_1_28_w  +  q_2_2_28_w  +  q_2_3_28_w +
                        q_3_0_28_w  +  q_3_1_28_w  +  q_3_2_28_w  +  q_3_3_28_w ;

assign  b_state_29_w  = p_0_0_29_w  +  p_0_1_29_w  +  p_0_2_29_w  +  p_0_3_29_w +
                        p_1_0_29_w  +  p_1_1_29_w  +  p_1_2_29_w  +  p_1_3_29_w +
                        p_2_0_29_w  +  p_2_1_29_w  +  p_2_2_29_w  +  p_2_3_29_w +
                        p_3_0_29_w  +  p_3_1_29_w  +  p_3_2_29_w  +  p_3_3_29_w +
                        q_0_0_29_w  +  q_0_1_29_w  +  q_0_2_29_w  +  q_0_3_29_w +
                        q_1_0_29_w  +  q_1_1_29_w  +  q_1_2_29_w  +  q_1_3_29_w +
                        q_2_0_29_w  +  q_2_1_29_w  +  q_2_2_29_w  +  q_2_3_29_w +
                        q_3_0_29_w  +  q_3_1_29_w  +  q_3_2_29_w  +  q_3_3_29_w ;

assign  b_state_30_w  = p_0_0_30_w  +  p_0_1_30_w  +  p_0_2_30_w  +  p_0_3_30_w +
                        p_1_0_30_w  +  p_1_1_30_w  +  p_1_2_30_w  +  p_1_3_30_w +
                        p_2_0_30_w  +  p_2_1_30_w  +  p_2_2_30_w  +  p_2_3_30_w +
                        p_3_0_30_w  +  p_3_1_30_w  +  p_3_2_30_w  +  p_3_3_30_w +
                        q_0_0_30_w  +  q_0_1_30_w  +  q_0_2_30_w  +  q_0_3_30_w +
                        q_1_0_30_w  +  q_1_1_30_w  +  q_1_2_30_w  +  q_1_3_30_w +
                        q_2_0_30_w  +  q_2_1_30_w  +  q_2_2_30_w  +  q_2_3_30_w +
                        q_3_0_30_w  +  q_3_1_30_w  +  q_3_2_30_w  +  q_3_3_30_w ;

assign  b_state_31_w  = p_0_0_31_w  +  p_0_1_31_w  +  p_0_2_31_w  +  p_0_3_31_w +
                        p_1_0_31_w  +  p_1_1_31_w  +  p_1_2_31_w  +  p_1_3_31_w +
                        p_2_0_31_w  +  p_2_1_31_w  +  p_2_2_31_w  +  p_2_3_31_w +
                        p_3_0_31_w  +  p_3_1_31_w  +  p_3_2_31_w  +  p_3_3_31_w +
                        q_0_0_31_w  +  q_0_1_31_w  +  q_0_2_31_w  +  q_0_3_31_w +
                        q_1_0_31_w  +  q_1_1_31_w  +  q_1_2_31_w  +  q_1_3_31_w +
                        q_2_0_31_w  +  q_2_1_31_w  +  q_2_2_31_w  +  q_2_3_31_w +
                        q_3_0_31_w  +  q_3_1_31_w  +  q_3_2_31_w  +  q_3_3_31_w ;

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_0_r   <=                 'd0           ;
	else if(state_clear_w)
	    b_state_0_r   <=                 'd0           ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_0_r   <=    b_state_0_r +  b_state_0_w ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_1_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_1_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_1_r   <=    b_state_1_r +  b_state_1_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_2_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_2_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_2_r   <=    b_state_2_r +  b_state_2_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_3_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_3_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_3_r   <=    b_state_3_r +  b_state_3_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_4_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_4_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_4_r   <=    b_state_4_r +  b_state_4_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_5_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_5_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_5_r   <=    b_state_5_r +  b_state_5_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_6_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_6_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_6_r   <=    b_state_6_r +  b_state_6_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_7_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_7_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_7_r   <=    b_state_7_r +  b_state_7_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_8_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_8_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_8_r   <=    b_state_8_r +  b_state_8_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_9_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_9_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_9_r   <=    b_state_9_r +  b_state_9_w  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_10_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_10_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_10_r   <=    b_state_10_r +  b_state_10_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_11_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_11_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_11_r   <=    b_state_11_r +  b_state_11_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_12_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_12_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_12_r   <=    b_state_12_r +  b_state_12_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_13_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_13_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_13_r   <=    b_state_13_r +  b_state_13_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_14_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_14_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_14_r   <=    b_state_14_r +  b_state_14_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_15_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_15_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_15_r   <=    b_state_15_r +  b_state_15_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_16_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_16_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_16_r   <=    b_state_16_r +  b_state_16_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_17_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_17_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_17_r   <=    b_state_17_r +  b_state_17_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_18_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_18_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_18_r   <=    b_state_18_r +  b_state_18_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_19_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_19_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_19_r   <=    b_state_19_r +  b_state_19_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_20_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_20_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_20_r   <=    b_state_20_r +  b_state_20_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_21_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_21_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_21_r   <=    b_state_21_r +  b_state_21_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_22_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_22_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_22_r   <=    b_state_22_r +  b_state_22_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_23_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_23_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_23_r   <=    b_state_23_r +  b_state_23_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_24_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_24_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_24_r   <=    b_state_24_r +  b_state_24_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_25_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_25_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_25_r   <=    b_state_25_r +  b_state_25_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_26_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_26_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_26_r   <=    b_state_26_r +  b_state_26_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_27_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_27_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_27_r   <=    b_state_27_r +  b_state_27_w ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_28_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_28_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_28_r   <=    b_state_28_r +  b_state_28_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_29_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_29_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_29_r   <=    b_state_29_r +  b_state_29_w;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_30_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_30_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_30_r   <=    b_state_30_r +  b_state_30_w ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        b_state_31_r   <=                 'd0            ;
	else if(state_clear_w)
	    b_state_31_r   <=                 'd0            ; // clear for next LCU 
    else if(is_luma_i&&is_hor_w)
        b_state_31_r   <=    b_state_31_r +  b_state_31_w;
end 

assign  b_num_0_w  =  indexp_0_0_w[0]  + indexp_0_1_w[0]  + indexp_0_2_w[0]  + indexp_0_3_w[0]  +
                       indexp_1_0_w[0]  + indexp_1_1_w[0]  + indexp_1_2_w[0]  + indexp_1_3_w[0]  +
                       indexp_2_0_w[0]  + indexp_2_1_w[0]  + indexp_2_2_w[0]  + indexp_2_3_w[0]  +
                       indexp_3_0_w[0]  + indexp_3_1_w[0]  + indexp_3_2_w[0]  + indexp_3_3_w[0]  +
                       indexq_0_0_w[0]  + indexq_0_1_w[0]  + indexq_0_2_w[0]  + indexq_0_3_w[0]  +
                       indexq_1_0_w[0]  + indexq_1_1_w[0]  + indexq_1_2_w[0]  + indexq_1_3_w[0]  +
                       indexq_2_0_w[0]  + indexq_2_1_w[0]  + indexq_2_2_w[0]  + indexq_2_3_w[0]  +
                       indexq_3_0_w[0]  + indexq_3_1_w[0]  + indexq_3_2_w[0]  + indexq_3_3_w[0]  ;

assign  b_num_1_w  =  indexp_0_0_w[1]  + indexp_0_1_w[1]  + indexp_0_2_w[1]  + indexp_0_3_w[1]  +
                       indexp_1_0_w[1]  + indexp_1_1_w[1]  + indexp_1_2_w[1]  + indexp_1_3_w[1]  +
                       indexp_2_0_w[1]  + indexp_2_1_w[1]  + indexp_2_2_w[1]  + indexp_2_3_w[1]  +
                       indexp_3_0_w[1]  + indexp_3_1_w[1]  + indexp_3_2_w[1]  + indexp_3_3_w[1]  +
                       indexq_0_0_w[1]  + indexq_0_1_w[1]  + indexq_0_2_w[1]  + indexq_0_3_w[1]  +
                       indexq_1_0_w[1]  + indexq_1_1_w[1]  + indexq_1_2_w[1]  + indexq_1_3_w[1]  +
                       indexq_2_0_w[1]  + indexq_2_1_w[1]  + indexq_2_2_w[1]  + indexq_2_3_w[1]  +
                       indexq_3_0_w[1]  + indexq_3_1_w[1]  + indexq_3_2_w[1]  + indexq_3_3_w[1]  ;

assign  b_num_2_w  =  indexp_0_0_w[2]  + indexp_0_1_w[2]  + indexp_0_2_w[2]  + indexp_0_3_w[2]  +
                       indexp_1_0_w[2]  + indexp_1_1_w[2]  + indexp_1_2_w[2]  + indexp_1_3_w[2]  +
                       indexp_2_0_w[2]  + indexp_2_1_w[2]  + indexp_2_2_w[2]  + indexp_2_3_w[2]  +
                       indexp_3_0_w[2]  + indexp_3_1_w[2]  + indexp_3_2_w[2]  + indexp_3_3_w[2]  +
                       indexq_0_0_w[2]  + indexq_0_1_w[2]  + indexq_0_2_w[2]  + indexq_0_3_w[2]  +
                       indexq_1_0_w[2]  + indexq_1_1_w[2]  + indexq_1_2_w[2]  + indexq_1_3_w[2]  +
                       indexq_2_0_w[2]  + indexq_2_1_w[2]  + indexq_2_2_w[2]  + indexq_2_3_w[2]  +
                       indexq_3_0_w[2]  + indexq_3_1_w[2]  + indexq_3_2_w[2]  + indexq_3_3_w[2]  ;

assign  b_num_3_w  =  indexp_0_0_w[3]  + indexp_0_1_w[3]  + indexp_0_2_w[3]  + indexp_0_3_w[3]  +
                       indexp_1_0_w[3]  + indexp_1_1_w[3]  + indexp_1_2_w[3]  + indexp_1_3_w[3]  +
                       indexp_2_0_w[3]  + indexp_2_1_w[3]  + indexp_2_2_w[3]  + indexp_2_3_w[3]  +
                       indexp_3_0_w[3]  + indexp_3_1_w[3]  + indexp_3_2_w[3]  + indexp_3_3_w[3]  +
                       indexq_0_0_w[3]  + indexq_0_1_w[3]  + indexq_0_2_w[3]  + indexq_0_3_w[3]  +
                       indexq_1_0_w[3]  + indexq_1_1_w[3]  + indexq_1_2_w[3]  + indexq_1_3_w[3]  +
                       indexq_2_0_w[3]  + indexq_2_1_w[3]  + indexq_2_2_w[3]  + indexq_2_3_w[3]  +
                       indexq_3_0_w[3]  + indexq_3_1_w[3]  + indexq_3_2_w[3]  + indexq_3_3_w[3]  ;

assign  b_num_4_w  =  indexp_0_0_w[4]  + indexp_0_1_w[4]  + indexp_0_2_w[4]  + indexp_0_3_w[4]  +
                       indexp_1_0_w[4]  + indexp_1_1_w[4]  + indexp_1_2_w[4]  + indexp_1_3_w[4]  +
                       indexp_2_0_w[4]  + indexp_2_1_w[4]  + indexp_2_2_w[4]  + indexp_2_3_w[4]  +
                       indexp_3_0_w[4]  + indexp_3_1_w[4]  + indexp_3_2_w[4]  + indexp_3_3_w[4]  +
                       indexq_0_0_w[4]  + indexq_0_1_w[4]  + indexq_0_2_w[4]  + indexq_0_3_w[4]  +
                       indexq_1_0_w[4]  + indexq_1_1_w[4]  + indexq_1_2_w[4]  + indexq_1_3_w[4]  +
                       indexq_2_0_w[4]  + indexq_2_1_w[4]  + indexq_2_2_w[4]  + indexq_2_3_w[4]  +
                       indexq_3_0_w[4]  + indexq_3_1_w[4]  + indexq_3_2_w[4]  + indexq_3_3_w[4]  ;

assign  b_num_5_w  =  indexp_0_0_w[5]  + indexp_0_1_w[5]  + indexp_0_2_w[5]  + indexp_0_3_w[5]  +
                       indexp_1_0_w[5]  + indexp_1_1_w[5]  + indexp_1_2_w[5]  + indexp_1_3_w[5]  +
                       indexp_2_0_w[5]  + indexp_2_1_w[5]  + indexp_2_2_w[5]  + indexp_2_3_w[5]  +
                       indexp_3_0_w[5]  + indexp_3_1_w[5]  + indexp_3_2_w[5]  + indexp_3_3_w[5]  +
                       indexq_0_0_w[5]  + indexq_0_1_w[5]  + indexq_0_2_w[5]  + indexq_0_3_w[5]  +
                       indexq_1_0_w[5]  + indexq_1_1_w[5]  + indexq_1_2_w[5]  + indexq_1_3_w[5]  +
                       indexq_2_0_w[5]  + indexq_2_1_w[5]  + indexq_2_2_w[5]  + indexq_2_3_w[5]  +
                       indexq_3_0_w[5]  + indexq_3_1_w[5]  + indexq_3_2_w[5]  + indexq_3_3_w[5]  ;

assign  b_num_6_w  =  indexp_0_0_w[6]  + indexp_0_1_w[6]  + indexp_0_2_w[6]  + indexp_0_3_w[6]  +
                       indexp_1_0_w[6]  + indexp_1_1_w[6]  + indexp_1_2_w[6]  + indexp_1_3_w[6]  +
                       indexp_2_0_w[6]  + indexp_2_1_w[6]  + indexp_2_2_w[6]  + indexp_2_3_w[6]  +
                       indexp_3_0_w[6]  + indexp_3_1_w[6]  + indexp_3_2_w[6]  + indexp_3_3_w[6]  +
                       indexq_0_0_w[6]  + indexq_0_1_w[6]  + indexq_0_2_w[6]  + indexq_0_3_w[6]  +
                       indexq_1_0_w[6]  + indexq_1_1_w[6]  + indexq_1_2_w[6]  + indexq_1_3_w[6]  +
                       indexq_2_0_w[6]  + indexq_2_1_w[6]  + indexq_2_2_w[6]  + indexq_2_3_w[6]  +
                       indexq_3_0_w[6]  + indexq_3_1_w[6]  + indexq_3_2_w[6]  + indexq_3_3_w[6]  ;

assign  b_num_7_w  =  indexp_0_0_w[7]  + indexp_0_1_w[7]  + indexp_0_2_w[7]  + indexp_0_3_w[7]  +
                       indexp_1_0_w[7]  + indexp_1_1_w[7]  + indexp_1_2_w[7]  + indexp_1_3_w[7]  +
                       indexp_2_0_w[7]  + indexp_2_1_w[7]  + indexp_2_2_w[7]  + indexp_2_3_w[7]  +
                       indexp_3_0_w[7]  + indexp_3_1_w[7]  + indexp_3_2_w[7]  + indexp_3_3_w[7]  +
                       indexq_0_0_w[7]  + indexq_0_1_w[7]  + indexq_0_2_w[7]  + indexq_0_3_w[7]  +
                       indexq_1_0_w[7]  + indexq_1_1_w[7]  + indexq_1_2_w[7]  + indexq_1_3_w[7]  +
                       indexq_2_0_w[7]  + indexq_2_1_w[7]  + indexq_2_2_w[7]  + indexq_2_3_w[7]  +
                       indexq_3_0_w[7]  + indexq_3_1_w[7]  + indexq_3_2_w[7]  + indexq_3_3_w[7]  ;

assign  b_num_8_w  =  indexp_0_0_w[8]  + indexp_0_1_w[8]  + indexp_0_2_w[8]  + indexp_0_3_w[8]  +
                       indexp_1_0_w[8]  + indexp_1_1_w[8]  + indexp_1_2_w[8]  + indexp_1_3_w[8]  +
                       indexp_2_0_w[8]  + indexp_2_1_w[8]  + indexp_2_2_w[8]  + indexp_2_3_w[8]  +
                       indexp_3_0_w[8]  + indexp_3_1_w[8]  + indexp_3_2_w[8]  + indexp_3_3_w[8]  +
                       indexq_0_0_w[8]  + indexq_0_1_w[8]  + indexq_0_2_w[8]  + indexq_0_3_w[8]  +
                       indexq_1_0_w[8]  + indexq_1_1_w[8]  + indexq_1_2_w[8]  + indexq_1_3_w[8]  +
                       indexq_2_0_w[8]  + indexq_2_1_w[8]  + indexq_2_2_w[8]  + indexq_2_3_w[8]  +
                       indexq_3_0_w[8]  + indexq_3_1_w[8]  + indexq_3_2_w[8]  + indexq_3_3_w[8]  ;

assign  b_num_9_w  =  indexp_0_0_w[9]  + indexp_0_1_w[9]  + indexp_0_2_w[9]  + indexp_0_3_w[9]  +
                       indexp_1_0_w[9]  + indexp_1_1_w[9]  + indexp_1_2_w[9]  + indexp_1_3_w[9]  +
                       indexp_2_0_w[9]  + indexp_2_1_w[9]  + indexp_2_2_w[9]  + indexp_2_3_w[9]  +
                       indexp_3_0_w[9]  + indexp_3_1_w[9]  + indexp_3_2_w[9]  + indexp_3_3_w[9]  +
                       indexq_0_0_w[9]  + indexq_0_1_w[9]  + indexq_0_2_w[9]  + indexq_0_3_w[9]  +
                       indexq_1_0_w[9]  + indexq_1_1_w[9]  + indexq_1_2_w[9]  + indexq_1_3_w[9]  +
                       indexq_2_0_w[9]  + indexq_2_1_w[9]  + indexq_2_2_w[9]  + indexq_2_3_w[9]  +
                       indexq_3_0_w[9]  + indexq_3_1_w[9]  + indexq_3_2_w[9]  + indexq_3_3_w[9]  ;

assign  b_num_10_w  =  indexp_0_0_w[10]  + indexp_0_1_w[10]  + indexp_0_2_w[10]  + indexp_0_3_w[10]  +
                       indexp_1_0_w[10]  + indexp_1_1_w[10]  + indexp_1_2_w[10]  + indexp_1_3_w[10]  +
                       indexp_2_0_w[10]  + indexp_2_1_w[10]  + indexp_2_2_w[10]  + indexp_2_3_w[10]  +
                       indexp_3_0_w[10]  + indexp_3_1_w[10]  + indexp_3_2_w[10]  + indexp_3_3_w[10]  +
                       indexq_0_0_w[10]  + indexq_0_1_w[10]  + indexq_0_2_w[10]  + indexq_0_3_w[10]  +
                       indexq_1_0_w[10]  + indexq_1_1_w[10]  + indexq_1_2_w[10]  + indexq_1_3_w[10]  +
                       indexq_2_0_w[10]  + indexq_2_1_w[10]  + indexq_2_2_w[10]  + indexq_2_3_w[10]  +
                       indexq_3_0_w[10]  + indexq_3_1_w[10]  + indexq_3_2_w[10]  + indexq_3_3_w[10]  ;

assign  b_num_11_w  =  indexp_0_0_w[11]  + indexp_0_1_w[11]  + indexp_0_2_w[11]  + indexp_0_3_w[11]  +
                       indexp_1_0_w[11]  + indexp_1_1_w[11]  + indexp_1_2_w[11]  + indexp_1_3_w[11]  +
                       indexp_2_0_w[11]  + indexp_2_1_w[11]  + indexp_2_2_w[11]  + indexp_2_3_w[11]  +
                       indexp_3_0_w[11]  + indexp_3_1_w[11]  + indexp_3_2_w[11]  + indexp_3_3_w[11]  +
                       indexq_0_0_w[11]  + indexq_0_1_w[11]  + indexq_0_2_w[11]  + indexq_0_3_w[11]  +
                       indexq_1_0_w[11]  + indexq_1_1_w[11]  + indexq_1_2_w[11]  + indexq_1_3_w[11]  +
                       indexq_2_0_w[11]  + indexq_2_1_w[11]  + indexq_2_2_w[11]  + indexq_2_3_w[11]  +
                       indexq_3_0_w[11]  + indexq_3_1_w[11]  + indexq_3_2_w[11]  + indexq_3_3_w[11]  ;

assign  b_num_12_w  =  indexp_0_0_w[12]  + indexp_0_1_w[12]  + indexp_0_2_w[12]  + indexp_0_3_w[12]  +
                       indexp_1_0_w[12]  + indexp_1_1_w[12]  + indexp_1_2_w[12]  + indexp_1_3_w[12]  +
                       indexp_2_0_w[12]  + indexp_2_1_w[12]  + indexp_2_2_w[12]  + indexp_2_3_w[12]  +
                       indexp_3_0_w[12]  + indexp_3_1_w[12]  + indexp_3_2_w[12]  + indexp_3_3_w[12]  +
                       indexq_0_0_w[12]  + indexq_0_1_w[12]  + indexq_0_2_w[12]  + indexq_0_3_w[12]  +
                       indexq_1_0_w[12]  + indexq_1_1_w[12]  + indexq_1_2_w[12]  + indexq_1_3_w[12]  +
                       indexq_2_0_w[12]  + indexq_2_1_w[12]  + indexq_2_2_w[12]  + indexq_2_3_w[12]  +
                       indexq_3_0_w[12]  + indexq_3_1_w[12]  + indexq_3_2_w[12]  + indexq_3_3_w[12]  ;

assign  b_num_13_w  =  indexp_0_0_w[13]  + indexp_0_1_w[13]  + indexp_0_2_w[13]  + indexp_0_3_w[13]  +
                       indexp_1_0_w[13]  + indexp_1_1_w[13]  + indexp_1_2_w[13]  + indexp_1_3_w[13]  +
                       indexp_2_0_w[13]  + indexp_2_1_w[13]  + indexp_2_2_w[13]  + indexp_2_3_w[13]  +
                       indexp_3_0_w[13]  + indexp_3_1_w[13]  + indexp_3_2_w[13]  + indexp_3_3_w[13]  +
                       indexq_0_0_w[13]  + indexq_0_1_w[13]  + indexq_0_2_w[13]  + indexq_0_3_w[13]  +
                       indexq_1_0_w[13]  + indexq_1_1_w[13]  + indexq_1_2_w[13]  + indexq_1_3_w[13]  +
                       indexq_2_0_w[13]  + indexq_2_1_w[13]  + indexq_2_2_w[13]  + indexq_2_3_w[13]  +
                       indexq_3_0_w[13]  + indexq_3_1_w[13]  + indexq_3_2_w[13]  + indexq_3_3_w[13]  ;

assign  b_num_14_w  =  indexp_0_0_w[14]  + indexp_0_1_w[14]  + indexp_0_2_w[14]  + indexp_0_3_w[14]  +
                       indexp_1_0_w[14]  + indexp_1_1_w[14]  + indexp_1_2_w[14]  + indexp_1_3_w[14]  +
                       indexp_2_0_w[14]  + indexp_2_1_w[14]  + indexp_2_2_w[14]  + indexp_2_3_w[14]  +
                       indexp_3_0_w[14]  + indexp_3_1_w[14]  + indexp_3_2_w[14]  + indexp_3_3_w[14]  +
                       indexq_0_0_w[14]  + indexq_0_1_w[14]  + indexq_0_2_w[14]  + indexq_0_3_w[14]  +
                       indexq_1_0_w[14]  + indexq_1_1_w[14]  + indexq_1_2_w[14]  + indexq_1_3_w[14]  +
                       indexq_2_0_w[14]  + indexq_2_1_w[14]  + indexq_2_2_w[14]  + indexq_2_3_w[14]  +
                       indexq_3_0_w[14]  + indexq_3_1_w[14]  + indexq_3_2_w[14]  + indexq_3_3_w[14]  ;

assign  b_num_15_w  =  indexp_0_0_w[15]  + indexp_0_1_w[15]  + indexp_0_2_w[15]  + indexp_0_3_w[15]  +
                       indexp_1_0_w[15]  + indexp_1_1_w[15]  + indexp_1_2_w[15]  + indexp_1_3_w[15]  +
                       indexp_2_0_w[15]  + indexp_2_1_w[15]  + indexp_2_2_w[15]  + indexp_2_3_w[15]  +
                       indexp_3_0_w[15]  + indexp_3_1_w[15]  + indexp_3_2_w[15]  + indexp_3_3_w[15]  +
                       indexq_0_0_w[15]  + indexq_0_1_w[15]  + indexq_0_2_w[15]  + indexq_0_3_w[15]  +
                       indexq_1_0_w[15]  + indexq_1_1_w[15]  + indexq_1_2_w[15]  + indexq_1_3_w[15]  +
                       indexq_2_0_w[15]  + indexq_2_1_w[15]  + indexq_2_2_w[15]  + indexq_2_3_w[15]  +
                       indexq_3_0_w[15]  + indexq_3_1_w[15]  + indexq_3_2_w[15]  + indexq_3_3_w[15]  ;

assign  b_num_16_w  =  indexp_0_0_w[16]  + indexp_0_1_w[16]  + indexp_0_2_w[16]  + indexp_0_3_w[16]  +
                       indexp_1_0_w[16]  + indexp_1_1_w[16]  + indexp_1_2_w[16]  + indexp_1_3_w[16]  +
                       indexp_2_0_w[16]  + indexp_2_1_w[16]  + indexp_2_2_w[16]  + indexp_2_3_w[16]  +
                       indexp_3_0_w[16]  + indexp_3_1_w[16]  + indexp_3_2_w[16]  + indexp_3_3_w[16]  +
                       indexq_0_0_w[16]  + indexq_0_1_w[16]  + indexq_0_2_w[16]  + indexq_0_3_w[16]  +
                       indexq_1_0_w[16]  + indexq_1_1_w[16]  + indexq_1_2_w[16]  + indexq_1_3_w[16]  +
                       indexq_2_0_w[16]  + indexq_2_1_w[16]  + indexq_2_2_w[16]  + indexq_2_3_w[16]  +
                       indexq_3_0_w[16]  + indexq_3_1_w[16]  + indexq_3_2_w[16]  + indexq_3_3_w[16]  ;

assign  b_num_17_w  =  indexp_0_0_w[17]  + indexp_0_1_w[17]  + indexp_0_2_w[17]  + indexp_0_3_w[17]  +
                       indexp_1_0_w[17]  + indexp_1_1_w[17]  + indexp_1_2_w[17]  + indexp_1_3_w[17]  +
                       indexp_2_0_w[17]  + indexp_2_1_w[17]  + indexp_2_2_w[17]  + indexp_2_3_w[17]  +
                       indexp_3_0_w[17]  + indexp_3_1_w[17]  + indexp_3_2_w[17]  + indexp_3_3_w[17]  +
                       indexq_0_0_w[17]  + indexq_0_1_w[17]  + indexq_0_2_w[17]  + indexq_0_3_w[17]  +
                       indexq_1_0_w[17]  + indexq_1_1_w[17]  + indexq_1_2_w[17]  + indexq_1_3_w[17]  +
                       indexq_2_0_w[17]  + indexq_2_1_w[17]  + indexq_2_2_w[17]  + indexq_2_3_w[17]  +
                       indexq_3_0_w[17]  + indexq_3_1_w[17]  + indexq_3_2_w[17]  + indexq_3_3_w[17]  ;

assign  b_num_18_w  =  indexp_0_0_w[18]  + indexp_0_1_w[18]  + indexp_0_2_w[18]  + indexp_0_3_w[18]  +
                       indexp_1_0_w[18]  + indexp_1_1_w[18]  + indexp_1_2_w[18]  + indexp_1_3_w[18]  +
                       indexp_2_0_w[18]  + indexp_2_1_w[18]  + indexp_2_2_w[18]  + indexp_2_3_w[18]  +
                       indexp_3_0_w[18]  + indexp_3_1_w[18]  + indexp_3_2_w[18]  + indexp_3_3_w[18]  +
                       indexq_0_0_w[18]  + indexq_0_1_w[18]  + indexq_0_2_w[18]  + indexq_0_3_w[18]  +
                       indexq_1_0_w[18]  + indexq_1_1_w[18]  + indexq_1_2_w[18]  + indexq_1_3_w[18]  +
                       indexq_2_0_w[18]  + indexq_2_1_w[18]  + indexq_2_2_w[18]  + indexq_2_3_w[18]  +
                       indexq_3_0_w[18]  + indexq_3_1_w[18]  + indexq_3_2_w[18]  + indexq_3_3_w[18]  ;

assign  b_num_19_w  =  indexp_0_0_w[19]  + indexp_0_1_w[19]  + indexp_0_2_w[19]  + indexp_0_3_w[19]  +
                       indexp_1_0_w[19]  + indexp_1_1_w[19]  + indexp_1_2_w[19]  + indexp_1_3_w[19]  +
                       indexp_2_0_w[19]  + indexp_2_1_w[19]  + indexp_2_2_w[19]  + indexp_2_3_w[19]  +
                       indexp_3_0_w[19]  + indexp_3_1_w[19]  + indexp_3_2_w[19]  + indexp_3_3_w[19]  +
                       indexq_0_0_w[19]  + indexq_0_1_w[19]  + indexq_0_2_w[19]  + indexq_0_3_w[19]  +
                       indexq_1_0_w[19]  + indexq_1_1_w[19]  + indexq_1_2_w[19]  + indexq_1_3_w[19]  +
                       indexq_2_0_w[19]  + indexq_2_1_w[19]  + indexq_2_2_w[19]  + indexq_2_3_w[19]  +
                       indexq_3_0_w[19]  + indexq_3_1_w[19]  + indexq_3_2_w[19]  + indexq_3_3_w[19]  ;

assign  b_num_20_w  =  indexp_0_0_w[20]  + indexp_0_1_w[20]  + indexp_0_2_w[20]  + indexp_0_3_w[20]  +
                       indexp_1_0_w[20]  + indexp_1_1_w[20]  + indexp_1_2_w[20]  + indexp_1_3_w[20]  +
                       indexp_2_0_w[20]  + indexp_2_1_w[20]  + indexp_2_2_w[20]  + indexp_2_3_w[20]  +
                       indexp_3_0_w[20]  + indexp_3_1_w[20]  + indexp_3_2_w[20]  + indexp_3_3_w[20]  +
                       indexq_0_0_w[20]  + indexq_0_1_w[20]  + indexq_0_2_w[20]  + indexq_0_3_w[20]  +
                       indexq_1_0_w[20]  + indexq_1_1_w[20]  + indexq_1_2_w[20]  + indexq_1_3_w[20]  +
                       indexq_2_0_w[20]  + indexq_2_1_w[20]  + indexq_2_2_w[20]  + indexq_2_3_w[20]  +
                       indexq_3_0_w[20]  + indexq_3_1_w[20]  + indexq_3_2_w[20]  + indexq_3_3_w[20]  ;

assign  b_num_21_w  =  indexp_0_0_w[21]  + indexp_0_1_w[21]  + indexp_0_2_w[21]  + indexp_0_3_w[21]  +
                       indexp_1_0_w[21]  + indexp_1_1_w[21]  + indexp_1_2_w[21]  + indexp_1_3_w[21]  +
                       indexp_2_0_w[21]  + indexp_2_1_w[21]  + indexp_2_2_w[21]  + indexp_2_3_w[21]  +
                       indexp_3_0_w[21]  + indexp_3_1_w[21]  + indexp_3_2_w[21]  + indexp_3_3_w[21]  +
                       indexq_0_0_w[21]  + indexq_0_1_w[21]  + indexq_0_2_w[21]  + indexq_0_3_w[21]  +
                       indexq_1_0_w[21]  + indexq_1_1_w[21]  + indexq_1_2_w[21]  + indexq_1_3_w[21]  +
                       indexq_2_0_w[21]  + indexq_2_1_w[21]  + indexq_2_2_w[21]  + indexq_2_3_w[21]  +
                       indexq_3_0_w[21]  + indexq_3_1_w[21]  + indexq_3_2_w[21]  + indexq_3_3_w[21]  ;

assign  b_num_22_w  =  indexp_0_0_w[22]  + indexp_0_1_w[22]  + indexp_0_2_w[22]  + indexp_0_3_w[22]  +
                       indexp_1_0_w[22]  + indexp_1_1_w[22]  + indexp_1_2_w[22]  + indexp_1_3_w[22]  +
                       indexp_2_0_w[22]  + indexp_2_1_w[22]  + indexp_2_2_w[22]  + indexp_2_3_w[22]  +
                       indexp_3_0_w[22]  + indexp_3_1_w[22]  + indexp_3_2_w[22]  + indexp_3_3_w[22]  +
                       indexq_0_0_w[22]  + indexq_0_1_w[22]  + indexq_0_2_w[22]  + indexq_0_3_w[22]  +
                       indexq_1_0_w[22]  + indexq_1_1_w[22]  + indexq_1_2_w[22]  + indexq_1_3_w[22]  +
                       indexq_2_0_w[22]  + indexq_2_1_w[22]  + indexq_2_2_w[22]  + indexq_2_3_w[22]  +
                       indexq_3_0_w[22]  + indexq_3_1_w[22]  + indexq_3_2_w[22]  + indexq_3_3_w[22]  ;

assign  b_num_23_w  =  indexp_0_0_w[23]  + indexp_0_1_w[23]  + indexp_0_2_w[23]  + indexp_0_3_w[23]  +
                       indexp_1_0_w[23]  + indexp_1_1_w[23]  + indexp_1_2_w[23]  + indexp_1_3_w[23]  +
                       indexp_2_0_w[23]  + indexp_2_1_w[23]  + indexp_2_2_w[23]  + indexp_2_3_w[23]  +
                       indexp_3_0_w[23]  + indexp_3_1_w[23]  + indexp_3_2_w[23]  + indexp_3_3_w[23]  +
                       indexq_0_0_w[23]  + indexq_0_1_w[23]  + indexq_0_2_w[23]  + indexq_0_3_w[23]  +
                       indexq_1_0_w[23]  + indexq_1_1_w[23]  + indexq_1_2_w[23]  + indexq_1_3_w[23]  +
                       indexq_2_0_w[23]  + indexq_2_1_w[23]  + indexq_2_2_w[23]  + indexq_2_3_w[23]  +
                       indexq_3_0_w[23]  + indexq_3_1_w[23]  + indexq_3_2_w[23]  + indexq_3_3_w[23]  ;

assign  b_num_24_w  =  indexp_0_0_w[24]  + indexp_0_1_w[24]  + indexp_0_2_w[24]  + indexp_0_3_w[24]  +
                       indexp_1_0_w[24]  + indexp_1_1_w[24]  + indexp_1_2_w[24]  + indexp_1_3_w[24]  +
                       indexp_2_0_w[24]  + indexp_2_1_w[24]  + indexp_2_2_w[24]  + indexp_2_3_w[24]  +
                       indexp_3_0_w[24]  + indexp_3_1_w[24]  + indexp_3_2_w[24]  + indexp_3_3_w[24]  +
                       indexq_0_0_w[24]  + indexq_0_1_w[24]  + indexq_0_2_w[24]  + indexq_0_3_w[24]  +
                       indexq_1_0_w[24]  + indexq_1_1_w[24]  + indexq_1_2_w[24]  + indexq_1_3_w[24]  +
                       indexq_2_0_w[24]  + indexq_2_1_w[24]  + indexq_2_2_w[24]  + indexq_2_3_w[24]  +
                       indexq_3_0_w[24]  + indexq_3_1_w[24]  + indexq_3_2_w[24]  + indexq_3_3_w[24]  ;

assign  b_num_25_w  =  indexp_0_0_w[25]  + indexp_0_1_w[25]  + indexp_0_2_w[25]  + indexp_0_3_w[25]  +
                       indexp_1_0_w[25]  + indexp_1_1_w[25]  + indexp_1_2_w[25]  + indexp_1_3_w[25]  +
                       indexp_2_0_w[25]  + indexp_2_1_w[25]  + indexp_2_2_w[25]  + indexp_2_3_w[25]  +
                       indexp_3_0_w[25]  + indexp_3_1_w[25]  + indexp_3_2_w[25]  + indexp_3_3_w[25]  +
                       indexq_0_0_w[25]  + indexq_0_1_w[25]  + indexq_0_2_w[25]  + indexq_0_3_w[25]  +
                       indexq_1_0_w[25]  + indexq_1_1_w[25]  + indexq_1_2_w[25]  + indexq_1_3_w[25]  +
                       indexq_2_0_w[25]  + indexq_2_1_w[25]  + indexq_2_2_w[25]  + indexq_2_3_w[25]  +
                       indexq_3_0_w[25]  + indexq_3_1_w[25]  + indexq_3_2_w[25]  + indexq_3_3_w[25]  ;

assign  b_num_26_w  =  indexp_0_0_w[26]  + indexp_0_1_w[26]  + indexp_0_2_w[26]  + indexp_0_3_w[26]  +
                       indexp_1_0_w[26]  + indexp_1_1_w[26]  + indexp_1_2_w[26]  + indexp_1_3_w[26]  +
                       indexp_2_0_w[26]  + indexp_2_1_w[26]  + indexp_2_2_w[26]  + indexp_2_3_w[26]  +
                       indexp_3_0_w[26]  + indexp_3_1_w[26]  + indexp_3_2_w[26]  + indexp_3_3_w[26]  +
                       indexq_0_0_w[26]  + indexq_0_1_w[26]  + indexq_0_2_w[26]  + indexq_0_3_w[26]  +
                       indexq_1_0_w[26]  + indexq_1_1_w[26]  + indexq_1_2_w[26]  + indexq_1_3_w[26]  +
                       indexq_2_0_w[26]  + indexq_2_1_w[26]  + indexq_2_2_w[26]  + indexq_2_3_w[26]  +
                       indexq_3_0_w[26]  + indexq_3_1_w[26]  + indexq_3_2_w[26]  + indexq_3_3_w[26]  ;

assign  b_num_27_w  =  indexp_0_0_w[27]  + indexp_0_1_w[27]  + indexp_0_2_w[27]  + indexp_0_3_w[27]  +
                       indexp_1_0_w[27]  + indexp_1_1_w[27]  + indexp_1_2_w[27]  + indexp_1_3_w[27]  +
                       indexp_2_0_w[27]  + indexp_2_1_w[27]  + indexp_2_2_w[27]  + indexp_2_3_w[27]  +
                       indexp_3_0_w[27]  + indexp_3_1_w[27]  + indexp_3_2_w[27]  + indexp_3_3_w[27]  +
                       indexq_0_0_w[27]  + indexq_0_1_w[27]  + indexq_0_2_w[27]  + indexq_0_3_w[27]  +
                       indexq_1_0_w[27]  + indexq_1_1_w[27]  + indexq_1_2_w[27]  + indexq_1_3_w[27]  +
                       indexq_2_0_w[27]  + indexq_2_1_w[27]  + indexq_2_2_w[27]  + indexq_2_3_w[27]  +
                       indexq_3_0_w[27]  + indexq_3_1_w[27]  + indexq_3_2_w[27]  + indexq_3_3_w[27]  ;

assign  b_num_28_w  =  indexp_0_0_w[28]  + indexp_0_1_w[28]  + indexp_0_2_w[28]  + indexp_0_3_w[28]  +
                       indexp_1_0_w[28]  + indexp_1_1_w[28]  + indexp_1_2_w[28]  + indexp_1_3_w[28]  +
                       indexp_2_0_w[28]  + indexp_2_1_w[28]  + indexp_2_2_w[28]  + indexp_2_3_w[28]  +
                       indexp_3_0_w[28]  + indexp_3_1_w[28]  + indexp_3_2_w[28]  + indexp_3_3_w[28]  +
                       indexq_0_0_w[28]  + indexq_0_1_w[28]  + indexq_0_2_w[28]  + indexq_0_3_w[28]  +
                       indexq_1_0_w[28]  + indexq_1_1_w[28]  + indexq_1_2_w[28]  + indexq_1_3_w[28]  +
                       indexq_2_0_w[28]  + indexq_2_1_w[28]  + indexq_2_2_w[28]  + indexq_2_3_w[28]  +
                       indexq_3_0_w[28]  + indexq_3_1_w[28]  + indexq_3_2_w[28]  + indexq_3_3_w[28]  ;

assign  b_num_29_w  =  indexp_0_0_w[29]  + indexp_0_1_w[29]  + indexp_0_2_w[29]  + indexp_0_3_w[29]  +
                       indexp_1_0_w[29]  + indexp_1_1_w[29]  + indexp_1_2_w[29]  + indexp_1_3_w[29]  +
                       indexp_2_0_w[29]  + indexp_2_1_w[29]  + indexp_2_2_w[29]  + indexp_2_3_w[29]  +
                       indexp_3_0_w[29]  + indexp_3_1_w[29]  + indexp_3_2_w[29]  + indexp_3_3_w[29]  +
                       indexq_0_0_w[29]  + indexq_0_1_w[29]  + indexq_0_2_w[29]  + indexq_0_3_w[29]  +
                       indexq_1_0_w[29]  + indexq_1_1_w[29]  + indexq_1_2_w[29]  + indexq_1_3_w[29]  +
                       indexq_2_0_w[29]  + indexq_2_1_w[29]  + indexq_2_2_w[29]  + indexq_2_3_w[29]  +
                       indexq_3_0_w[29]  + indexq_3_1_w[29]  + indexq_3_2_w[29]  + indexq_3_3_w[29]  ;

assign  b_num_30_w  =  indexp_0_0_w[30]  + indexp_0_1_w[30]  + indexp_0_2_w[30]  + indexp_0_3_w[30]  +
                       indexp_1_0_w[30]  + indexp_1_1_w[30]  + indexp_1_2_w[30]  + indexp_1_3_w[30]  +
                       indexp_2_0_w[30]  + indexp_2_1_w[30]  + indexp_2_2_w[30]  + indexp_2_3_w[30]  +
                       indexp_3_0_w[30]  + indexp_3_1_w[30]  + indexp_3_2_w[30]  + indexp_3_3_w[30]  +
                       indexq_0_0_w[30]  + indexq_0_1_w[30]  + indexq_0_2_w[30]  + indexq_0_3_w[30]  +
                       indexq_1_0_w[30]  + indexq_1_1_w[30]  + indexq_1_2_w[30]  + indexq_1_3_w[30]  +
                       indexq_2_0_w[30]  + indexq_2_1_w[30]  + indexq_2_2_w[30]  + indexq_2_3_w[30]  +
                       indexq_3_0_w[30]  + indexq_3_1_w[30]  + indexq_3_2_w[30]  + indexq_3_3_w[30]  ;

assign  b_num_31_w  =  indexp_0_0_w[31]  + indexp_0_1_w[31]  + indexp_0_2_w[31]  + indexp_0_3_w[31]  +
                       indexp_1_0_w[31]  + indexp_1_1_w[31]  + indexp_1_2_w[31]  + indexp_1_3_w[31]  +
                       indexp_2_0_w[31]  + indexp_2_1_w[31]  + indexp_2_2_w[31]  + indexp_2_3_w[31]  +
                       indexp_3_0_w[31]  + indexp_3_1_w[31]  + indexp_3_2_w[31]  + indexp_3_3_w[31]  +
                       indexq_0_0_w[31]  + indexq_0_1_w[31]  + indexq_0_2_w[31]  + indexq_0_3_w[31]  +
                       indexq_1_0_w[31]  + indexq_1_1_w[31]  + indexq_1_2_w[31]  + indexq_1_3_w[31]  +
                       indexq_2_0_w[31]  + indexq_2_1_w[31]  + indexq_2_2_w[31]  + indexq_2_3_w[31]  +
                       indexq_3_0_w[31]  + indexq_3_1_w[31]  + indexq_3_2_w[31]  + indexq_3_3_w[31]  ;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_0_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_0_r  =  13'd0 ;
    else 
        b_num_0_r  =  b_num_0_r  + b_num_0_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_1_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_1_r  =  13'd0 ;
    else 
        b_num_1_r  =  b_num_1_r  + b_num_1_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_2_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_2_r  =  13'd0 ;
    else 
        b_num_2_r  =  b_num_2_r  + b_num_2_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_3_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_3_r  =  13'd0 ;
    else 
        b_num_3_r  =  b_num_3_r  + b_num_3_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_4_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_4_r  =  13'd0 ;
    else 
        b_num_4_r  =  b_num_4_r  + b_num_4_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_5_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_5_r  =  13'd0 ;
    else 
        b_num_5_r  =  b_num_5_r  + b_num_5_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_6_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_6_r  =  13'd0 ;
    else 
        b_num_6_r  =  b_num_6_r  + b_num_6_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_7_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_7_r  =  13'd0 ;
    else 
        b_num_7_r  =  b_num_7_r  + b_num_7_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_8_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_8_r  =  13'd0 ;
    else 
        b_num_8_r  =  b_num_8_r  + b_num_8_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_9_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_9_r  =  13'd0 ;
    else 
        b_num_9_r  =  b_num_9_r  + b_num_9_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_10_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_10_r  =  13'd0 ;
    else 
        b_num_10_r  =  b_num_10_r  + b_num_10_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_11_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_11_r  =  13'd0 ;
    else 
        b_num_11_r  =  b_num_11_r  + b_num_11_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_12_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_12_r  =  13'd0 ;
    else 
        b_num_12_r  =  b_num_12_r  + b_num_12_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_13_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_13_r  =  13'd0 ;
    else 
        b_num_13_r  =  b_num_13_r  + b_num_13_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_14_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_14_r  =  13'd0 ;
    else 
        b_num_14_r  =  b_num_14_r  + b_num_14_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_15_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_15_r  =  13'd0 ;
    else 
        b_num_15_r  =  b_num_15_r  + b_num_15_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_16_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_16_r  =  13'd0 ;
    else 
        b_num_16_r  =  b_num_16_r  + b_num_16_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_17_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_17_r  =  13'd0 ;
    else 
        b_num_17_r  =  b_num_17_r  + b_num_17_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_18_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_18_r  =  13'd0 ;
    else 
        b_num_18_r  =  b_num_18_r  + b_num_18_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_19_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_19_r  =  13'd0 ;
    else 
        b_num_19_r  =  b_num_19_r  + b_num_19_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_20_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_20_r  =  13'd0 ;
    else 
        b_num_20_r  =  b_num_20_r  + b_num_20_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_21_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_21_r  =  13'd0 ;
    else 
        b_num_21_r  =  b_num_21_r  + b_num_21_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_22_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_22_r  =  13'd0 ;
    else 
        b_num_22_r  =  b_num_22_r  + b_num_22_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_23_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_23_r  =  13'd0 ;
    else 
        b_num_23_r  =  b_num_23_r  + b_num_23_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_24_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_24_r  =  13'd0 ;
    else 
        b_num_24_r  =  b_num_24_r  + b_num_24_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_25_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_25_r  =  13'd0 ;
    else 
        b_num_25_r  =  b_num_25_r  + b_num_25_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_26_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_26_r  =  13'd0 ;
    else 
        b_num_26_r  =  b_num_26_r  + b_num_26_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_27_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_27_r  =  13'd0 ;
    else 
        b_num_27_r  =  b_num_27_r  + b_num_27_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_28_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_28_r  =  13'd0 ;
    else 
        b_num_28_r  =  b_num_28_r  + b_num_28_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_29_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_29_r  =  13'd0 ;
    else 
        b_num_29_r  =  b_num_29_r  + b_num_29_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_30_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_30_r  =  13'd0 ;
    else 
        b_num_30_r  =  b_num_30_r  + b_num_30_w;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        b_num_31_r  =  13'd0 ;
    else if(state_clear_w)
        b_num_31_r  =  13'd0 ;
    else 
        b_num_31_r  =  b_num_31_r  + b_num_31_w;
end

wire signed   [      2    :0 ] b_offset_0_w       ;   
wire signed   [      2    :0 ] b_offset_1_w       ;   
wire signed   [      2    :0 ] b_offset_2_w       ;   
wire signed   [      2    :0 ] b_offset_3_w       ;   
wire signed   [      2    :0 ] b_offset_4_w       ;   
wire signed   [      2    :0 ] b_offset_5_w       ;   
wire signed   [      2    :0 ] b_offset_6_w       ;   
wire signed   [      2    :0 ] b_offset_7_w       ;   
wire signed   [      2    :0 ] b_offset_8_w       ;   
wire signed   [      2    :0 ] b_offset_9_w       ;   
wire signed   [      2    :0 ] b_offset_10_w      ;   
wire signed   [      2    :0 ] b_offset_11_w      ;   
wire signed   [      2    :0 ] b_offset_12_w      ;   
wire signed   [      2    :0 ] b_offset_13_w      ;   
wire signed   [      2    :0 ] b_offset_14_w      ;   
wire signed   [      2    :0 ] b_offset_15_w      ;   
wire signed   [      2    :0 ] b_offset_16_w      ;   
wire signed   [      2    :0 ] b_offset_17_w      ;   
wire signed   [      2    :0 ] b_offset_18_w      ;   
wire signed   [      2    :0 ] b_offset_19_w      ;   
wire signed   [      2    :0 ] b_offset_20_w      ;   
wire signed   [      2    :0 ] b_offset_21_w      ;   
wire signed   [      2    :0 ] b_offset_22_w      ;   
wire signed   [      2    :0 ] b_offset_23_w      ;   
wire signed   [      2    :0 ] b_offset_24_w      ;   
wire signed   [      2    :0 ] b_offset_25_w      ;   
wire signed   [      2    :0 ] b_offset_26_w      ;   
wire signed   [      2    :0 ] b_offset_27_w      ;   
wire signed   [      2    :0 ] b_offset_28_w      ;   
wire signed   [      2    :0 ] b_offset_29_w      ;   
wire signed   [      2    :0 ] b_offset_30_w      ;   
wire signed   [      2    :0 ] b_offset_31_w      ; 

wire signed   [DIS_WIDTH-1:0 ] b_distortion_0_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_1_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_2_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_3_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_4_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_5_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_6_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_7_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_8_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_9_w   ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_10_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_11_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_12_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_13_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_14_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_15_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_16_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_17_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_18_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_19_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_20_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_21_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_22_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_23_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_24_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_25_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_26_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_27_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_28_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_29_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_30_w  ;   
wire signed   [DIS_WIDTH-1:0 ] b_distortion_31_w  ;   

wire signed   [      11   :0 ] sao_offset_w       ;   
wire          [      4    :0 ] sao_type_w         ;


db_sao_cal_offset   uoffset0(                           
             .b_state_i      ( b_state_0_r       ),
             .b_num_i        ( b_num_0_r         ),
             .data_valid_i   ( data_end_r        ),
             .b_offset_o     ( b_offset_0_w      ),
             .b_distortion_o ( b_distortion_0_w  ) 
             );                               

db_sao_cal_offset   uoffset1(                           
             .b_state_i      ( b_state_1_r       ),
             .b_num_i        ( b_num_1_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_1_w      ),
             .b_distortion_o ( b_distortion_1_w  ) 
             );                               

db_sao_cal_offset   uoffset2(                           
             .b_state_i      ( b_state_2_r       ),
             .b_num_i        ( b_num_2_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_2_w      ),
             .b_distortion_o ( b_distortion_2_w  ) 
             );                               

db_sao_cal_offset   uoffset3(                           
             .b_state_i      ( b_state_3_r       ),
             .b_num_i        ( b_num_3_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_3_w      ),
             .b_distortion_o ( b_distortion_3_w  ) 
             );                               

db_sao_cal_offset   uoffset4(                           
             .b_state_i      ( b_state_4_r       ),
             .b_num_i        ( b_num_4_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_4_w      ),
             .b_distortion_o ( b_distortion_4_w  ) 
             );                               

db_sao_cal_offset   uoffset5(                           
             .b_state_i      ( b_state_5_r       ),
             .b_num_i        ( b_num_5_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_5_w      ),
             .b_distortion_o ( b_distortion_5_w  ) 
             );                               

db_sao_cal_offset   uoffset6(                           
             .b_state_i      ( b_state_6_r       ),
             .b_num_i        ( b_num_6_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_6_w      ),
             .b_distortion_o ( b_distortion_6_w  ) 
             );                               

db_sao_cal_offset   uoffset7(                           
             .b_state_i      ( b_state_7_r       ),
             .b_num_i        ( b_num_7_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_7_w      ),
             .b_distortion_o ( b_distortion_7_w  ) 
             );                               

db_sao_cal_offset   uoffset8(                           
             .b_state_i      ( b_state_8_r       ),
             .b_num_i        ( b_num_8_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_8_w      ),
             .b_distortion_o ( b_distortion_8_w  ) 
             );                               

db_sao_cal_offset   uoffset9(                           
             .b_state_i      ( b_state_9_r       ),
             .b_num_i        ( b_num_9_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_9_w      ),
             .b_distortion_o ( b_distortion_9_w  ) 
             );                               

db_sao_cal_offset   uoffset10(                           
             .b_state_i      ( b_state_10_r       ),
             .b_num_i        ( b_num_10_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_10_w      ),
             .b_distortion_o ( b_distortion_10_w  ) 
             );                               

db_sao_cal_offset   uoffset11(                           
             .b_state_i      ( b_state_11_r       ),
             .b_num_i        ( b_num_11_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_11_w      ),
             .b_distortion_o ( b_distortion_11_w  ) 
             );                               

db_sao_cal_offset   uoffset12(                           
             .b_state_i      ( b_state_12_r       ),
             .b_num_i        ( b_num_12_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_12_w      ),
             .b_distortion_o ( b_distortion_12_w  ) 
             );                               

db_sao_cal_offset   uoffset13(                           
             .b_state_i      ( b_state_13_r       ),
             .b_num_i        ( b_num_13_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_13_w      ),
             .b_distortion_o ( b_distortion_13_w  ) 
             );                               

db_sao_cal_offset   uoffset14(                           
             .b_state_i      ( b_state_14_r       ),
             .b_num_i        ( b_num_14_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_14_w      ),
             .b_distortion_o ( b_distortion_14_w  ) 
             );                               

db_sao_cal_offset   uoffset15(                           
             .b_state_i      ( b_state_15_r       ),
             .b_num_i        ( b_num_15_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_15_w      ),
             .b_distortion_o ( b_distortion_15_w  ) 
             );                               

db_sao_cal_offset   uoffset16(                           
             .b_state_i      ( b_state_16_r       ),
             .b_num_i        ( b_num_16_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_16_w      ),
             .b_distortion_o ( b_distortion_16_w  ) 
             );                               

db_sao_cal_offset   uoffset17(                           
             .b_state_i      ( b_state_17_r       ),
             .b_num_i        ( b_num_17_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_17_w      ),
             .b_distortion_o ( b_distortion_17_w  ) 
             );                               

db_sao_cal_offset   uoffset18(                           
             .b_state_i      ( b_state_18_r       ),
             .b_num_i        ( b_num_18_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_18_w      ),
             .b_distortion_o ( b_distortion_18_w  ) 
             );                               

db_sao_cal_offset   uoffset19(                           
             .b_state_i      ( b_state_19_r       ),
             .b_num_i        ( b_num_19_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_19_w      ),
             .b_distortion_o ( b_distortion_19_w  ) 
             );                               

db_sao_cal_offset   uoffset20(                           
             .b_state_i      ( b_state_20_r       ),
             .b_num_i        ( b_num_20_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_20_w      ),
             .b_distortion_o ( b_distortion_20_w  ) 
             );                               

db_sao_cal_offset   uoffset21(                           
             .b_state_i      ( b_state_21_r       ),
             .b_num_i        ( b_num_21_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_21_w      ),
             .b_distortion_o ( b_distortion_21_w  ) 
             );                               

db_sao_cal_offset   uoffset22(                           
             .b_state_i      ( b_state_22_r       ),
             .b_num_i        ( b_num_22_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_22_w      ),
             .b_distortion_o ( b_distortion_22_w  ) 
             );                               

db_sao_cal_offset   uoffset23(                           
             .b_state_i      ( b_state_23_r       ),
             .b_num_i        ( b_num_23_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_23_w      ),
             .b_distortion_o ( b_distortion_23_w  ) 
             );                               

db_sao_cal_offset   uoffset24(                           
             .b_state_i      ( b_state_24_r       ),
             .b_num_i        ( b_num_24_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_24_w      ),
             .b_distortion_o ( b_distortion_24_w  ) 
             );                               

db_sao_cal_offset   uoffset25(                           
             .b_state_i      ( b_state_25_r       ),
             .b_num_i        ( b_num_25_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_25_w      ),
             .b_distortion_o ( b_distortion_25_w  ) 
             );                               

db_sao_cal_offset   uoffset26(                           
             .b_state_i      ( b_state_26_r       ),
             .b_num_i        ( b_num_26_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_26_w      ),
             .b_distortion_o ( b_distortion_26_w  ) 
             );                               

db_sao_cal_offset   uoffset27(                           
             .b_state_i      ( b_state_27_r       ),
             .b_num_i        ( b_num_27_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_27_w      ),
             .b_distortion_o ( b_distortion_27_w  ) 
             );                               

db_sao_cal_offset   uoffset28(                           
             .b_state_i      ( b_state_28_r       ),
             .b_num_i        ( b_num_28_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_28_w      ),
             .b_distortion_o ( b_distortion_28_w  ) 
             );                               

db_sao_cal_offset   uoffset29(                           
             .b_state_i      ( b_state_29_r       ),
             .b_num_i        ( b_num_29_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_29_w      ),
             .b_distortion_o ( b_distortion_29_w  ) 
             );                               

db_sao_cal_offset   uoffset30(                           
             .b_state_i      ( b_state_30_r       ),
             .b_num_i        ( b_num_30_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_30_w      ),
             .b_distortion_o ( b_distortion_30_w  ) 
             );                               

db_sao_cal_offset   uoffset31(                           
             .b_state_i      ( b_state_31_r       ),
             .b_num_i        ( b_num_31_r         ),
             .data_valid_i   ( data_end_r         ),
             .b_offset_o     ( b_offset_31_w      ),
             .b_distortion_o ( b_distortion_31_w  ) 
             );                        

db_sao_type_dicision utypedicision(                  
                    .clk              ( clk                ),
                    .rst_n            ( rst_n              ),
					.data_valid_i     ( data_end_r         ),
					.data_over_i      ( state_clear_w      ),
                    .b_offset_0_i     ( b_offset_0_w       ),
                    .b_offset_1_i     ( b_offset_1_w       ),
                    .b_offset_2_i     ( b_offset_2_w       ),
                    .b_offset_3_i     ( b_offset_3_w       ),
                    .b_offset_4_i     ( b_offset_4_w       ),
                    .b_offset_5_i     ( b_offset_5_w       ),
                    .b_offset_6_i     ( b_offset_6_w       ),
                    .b_offset_7_i     ( b_offset_7_w       ),
                    .b_offset_8_i     ( b_offset_8_w       ),
                    .b_offset_9_i     ( b_offset_9_w       ),
                    .b_offset_10_i    ( b_offset_10_w      ),
                    .b_offset_11_i    ( b_offset_11_w      ),
                    .b_offset_12_i    ( b_offset_12_w      ),
                    .b_offset_13_i    ( b_offset_13_w      ),
                    .b_offset_14_i    ( b_offset_14_w      ),
                    .b_offset_15_i    ( b_offset_15_w      ),
                    .b_offset_16_i    ( b_offset_16_w      ),
                    .b_offset_17_i    ( b_offset_17_w      ),
                    .b_offset_18_i    ( b_offset_18_w      ),
                    .b_offset_19_i    ( b_offset_19_w      ),
                    .b_offset_20_i    ( b_offset_20_w      ),
                    .b_offset_21_i    ( b_offset_21_w      ),
                    .b_offset_22_i    ( b_offset_22_w      ),
                    .b_offset_23_i    ( b_offset_23_w      ),
                    .b_offset_24_i    ( b_offset_24_w      ),
                    .b_offset_25_i    ( b_offset_25_w      ),
                    .b_offset_26_i    ( b_offset_26_w      ),
                    .b_offset_27_i    ( b_offset_27_w      ),
                    .b_offset_28_i    ( b_offset_28_w      ),
                    .b_offset_29_i    ( b_offset_29_w      ),
                    .b_offset_30_i    ( b_offset_30_w      ),
                    .b_offset_31_i    ( b_offset_31_w      ),
                    .b_distortion_0_i ( b_distortion_0_w   ),
                    .b_distortion_1_i ( b_distortion_1_w   ),
                    .b_distortion_2_i ( b_distortion_2_w   ),
                    .b_distortion_3_i ( b_distortion_3_w   ),
                    .b_distortion_4_i ( b_distortion_4_w   ),
                    .b_distortion_5_i ( b_distortion_5_w   ),
                    .b_distortion_6_i ( b_distortion_6_w   ),
                    .b_distortion_7_i ( b_distortion_7_w   ),
                    .b_distortion_8_i ( b_distortion_8_w   ),
                    .b_distortion_9_i ( b_distortion_9_w   ),
                    .b_distortion_10_i( b_distortion_10_w  ),
                    .b_distortion_11_i( b_distortion_11_w  ),
                    .b_distortion_12_i( b_distortion_12_w  ),
                    .b_distortion_13_i( b_distortion_13_w  ),
                    .b_distortion_14_i( b_distortion_14_w  ),
                    .b_distortion_15_i( b_distortion_15_w  ),
                    .b_distortion_16_i( b_distortion_16_w  ),
                    .b_distortion_17_i( b_distortion_17_w  ),
                    .b_distortion_18_i( b_distortion_18_w  ),
                    .b_distortion_19_i( b_distortion_19_w  ),
                    .b_distortion_20_i( b_distortion_20_w  ),
                    .b_distortion_21_i( b_distortion_21_w  ),
                    .b_distortion_22_i( b_distortion_22_w  ),
                    .b_distortion_23_i( b_distortion_23_w  ),
                    .b_distortion_24_i( b_distortion_24_w  ),
                    .b_distortion_25_i( b_distortion_25_w  ),
                    .b_distortion_26_i( b_distortion_26_w  ),
                    .b_distortion_27_i( b_distortion_27_w  ),
                    .b_distortion_28_i( b_distortion_28_w  ),
                    .b_distortion_29_i( b_distortion_29_w  ),
                    .b_distortion_30_i( b_distortion_30_w  ),
                    .b_distortion_31_i( b_distortion_31_w  ),
					.b_band_o         ( sao_type_w         ),
                    .b_offset_o       ( sao_offset_w       )
                );   

assign  sao_data_o  =  {sao_type_w,sao_offset_w};  





endmodule 