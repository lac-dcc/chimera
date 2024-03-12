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
// Filename       : db_sao_add_offset.v
// Author         : Chewein
// Created        : 2015-03-25
// Description    : TOP module of SAO 
//-------------------------------------------------------------------
module db_sao_add_offset(
                            mb_db_data_i     ,
                            sao_add_i        ,
                            mb_db_data_o     
                        );
//---------------------------------------------------------------------------
//
//                        INPUT/OUTPUT DECLARATION 
//
//----------------------------------------------------------------------------
parameter DATA_WIDTH	=	 128	            ;

input    [DATA_WIDTH-1:0]  mb_db_data_i         ; // pixels after deblocking 						
input    [          16:0]  sao_add_i            ; 						
output   [DATA_WIDTH-1:0]  mb_db_data_o         ; // pixels after sao  					 					

wire     [DATA_WIDTH-1:0]  mb_db_data_w         ; // pixels after sao 
wire        [4:0]          sao_add_type_0_w     ;
wire        [4:0]          sao_add_type_1_w     ;
wire        [4:0]          sao_add_type_2_w     ;
wire        [4:0]          sao_add_type_3_w     ;
wire signed [2:0]          sao_add_offset_0_w   ;
wire signed [2:0]          sao_add_offset_1_w   ;
wire signed [2:0]          sao_add_offset_2_w   ;
wire signed [2:0]          sao_add_offset_3_w   ;


assign  sao_add_offset_0_w = sao_add_i[ 2:0 ]       ;
assign  sao_add_offset_1_w = sao_add_i[ 5:3 ]       ;
assign  sao_add_offset_2_w = sao_add_i[ 8:6 ]       ;
assign  sao_add_offset_3_w = sao_add_i[11:9 ]       ;
assign  sao_add_type_0_w   = sao_add_i[16:12]       ;			
assign  sao_add_type_1_w   = sao_add_i[16:12] + 2'd1;			
assign  sao_add_type_2_w   = sao_add_i[16:12] + 2'd2;			
assign  sao_add_type_3_w   = sao_add_i[16:12] + 2'd3;			


wire  signed     [8:0]     db_pixel_0_0_w       ;
wire  signed     [8:0]     db_pixel_0_1_w       ;
wire  signed     [8:0]     db_pixel_0_2_w       ;
wire  signed     [8:0]     db_pixel_0_3_w       ;
wire  signed     [8:0]     db_pixel_1_0_w       ;
wire  signed     [8:0]     db_pixel_1_1_w       ;
wire  signed     [8:0]     db_pixel_1_2_w       ;
wire  signed     [8:0]     db_pixel_1_3_w       ;
wire  signed     [8:0]     db_pixel_2_0_w       ;
wire  signed     [8:0]     db_pixel_2_1_w       ;
wire  signed     [8:0]     db_pixel_2_2_w       ;
wire  signed     [8:0]     db_pixel_2_3_w       ;
wire  signed     [8:0]     db_pixel_3_0_w       ;
wire  signed     [8:0]     db_pixel_3_1_w       ;
wire  signed     [8:0]     db_pixel_3_2_w       ;
wire  signed     [8:0]     db_pixel_3_3_w       ;

reg   signed     [8:0]     db_pixel_0_0_r       ;
reg   signed     [8:0]     db_pixel_0_1_r       ;
reg   signed     [8:0]     db_pixel_0_2_r       ;
reg   signed     [8:0]     db_pixel_0_3_r       ;
reg   signed     [8:0]     db_pixel_1_0_r       ;
reg   signed     [8:0]     db_pixel_1_1_r       ;
reg   signed     [8:0]     db_pixel_1_2_r       ;
reg   signed     [8:0]     db_pixel_1_3_r       ;
reg   signed     [8:0]     db_pixel_2_0_r       ;
reg   signed     [8:0]     db_pixel_2_1_r       ;
reg   signed     [8:0]     db_pixel_2_2_r       ;
reg   signed     [8:0]     db_pixel_2_3_r       ;
reg   signed     [8:0]     db_pixel_3_0_r       ;
reg   signed     [8:0]     db_pixel_3_1_r       ;
reg   signed     [8:0]     db_pixel_3_2_r       ;
reg   signed     [8:0]     db_pixel_3_3_r       ;

assign      db_pixel_0_0_w  =   {1'b0,mb_db_data_i[  7:  0]};
assign      db_pixel_0_1_w  =   {1'b0,mb_db_data_i[ 15:  8]};
assign      db_pixel_0_2_w  =   {1'b0,mb_db_data_i[ 23: 16]};
assign      db_pixel_0_3_w  =   {1'b0,mb_db_data_i[ 31: 24]};
assign      db_pixel_1_0_w  =   {1'b0,mb_db_data_i[ 39: 32]};
assign      db_pixel_1_1_w  =   {1'b0,mb_db_data_i[ 47: 40]};
assign      db_pixel_1_2_w  =   {1'b0,mb_db_data_i[ 55: 48]};
assign      db_pixel_1_3_w  =   {1'b0,mb_db_data_i[ 63: 56]};
assign      db_pixel_2_0_w  =   {1'b0,mb_db_data_i[ 71: 64]};
assign      db_pixel_2_1_w  =   {1'b0,mb_db_data_i[ 79: 72]};
assign      db_pixel_2_2_w  =   {1'b0,mb_db_data_i[ 87: 80]};
assign      db_pixel_2_3_w  =   {1'b0,mb_db_data_i[ 95: 88]};
assign      db_pixel_3_0_w  =   {1'b0,mb_db_data_i[103: 96]};
assign      db_pixel_3_1_w  =   {1'b0,mb_db_data_i[111:104]};
assign      db_pixel_3_2_w  =   {1'b0,mb_db_data_i[119:112]};
assign      db_pixel_3_3_w  =   {1'b0,mb_db_data_i[127:120]};

always @* begin                                                 
    if(db_pixel_0_0_w[7:3]==sao_add_type_0_w)                   
        db_pixel_0_0_r  =   db_pixel_0_0_w + sao_add_offset_0_w;
    else if(db_pixel_0_0_w[7:3]==sao_add_type_1_w)              
        db_pixel_0_0_r  =   db_pixel_0_0_w + sao_add_offset_1_w;
    else if(db_pixel_0_0_w[7:3]==sao_add_type_2_w)              
        db_pixel_0_0_r  =   db_pixel_0_0_w + sao_add_offset_2_w;
    else if(db_pixel_0_0_w[7:3]==sao_add_type_3_w)              
        db_pixel_0_0_r  =   db_pixel_0_0_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_0_0_r  =   db_pixel_0_0_w                     ;
end 

always @* begin                                                 
    if(db_pixel_0_1_w[7:3]==sao_add_type_0_w)                   
        db_pixel_0_1_r  =   db_pixel_0_1_w + sao_add_offset_0_w;
    else if(db_pixel_0_1_w[7:3]==sao_add_type_1_w)              
        db_pixel_0_1_r  =   db_pixel_0_1_w + sao_add_offset_1_w;
    else if(db_pixel_0_1_w[7:3]==sao_add_type_2_w)              
        db_pixel_0_1_r  =   db_pixel_0_1_w + sao_add_offset_2_w;
    else if(db_pixel_0_1_w[7:3]==sao_add_type_3_w)              
        db_pixel_0_1_r  =   db_pixel_0_1_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_0_1_r  =   db_pixel_0_1_w                     ;
end 

always @* begin                                                 
    if(db_pixel_0_2_w[7:3]==sao_add_type_0_w)                   
        db_pixel_0_2_r  =   db_pixel_0_2_w + sao_add_offset_0_w;
    else if(db_pixel_0_2_w[7:3]==sao_add_type_1_w)              
        db_pixel_0_2_r  =   db_pixel_0_2_w + sao_add_offset_1_w;
    else if(db_pixel_0_2_w[7:3]==sao_add_type_2_w)              
        db_pixel_0_2_r  =   db_pixel_0_2_w + sao_add_offset_2_w;
    else if(db_pixel_0_2_w[7:3]==sao_add_type_3_w)              
        db_pixel_0_2_r  =   db_pixel_0_2_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_0_2_r  =   db_pixel_0_2_w                     ;
end 

always @* begin                                                 
    if(db_pixel_0_3_w[7:3]==sao_add_type_0_w)                   
        db_pixel_0_3_r  =   db_pixel_0_3_w + sao_add_offset_0_w;
    else if(db_pixel_0_3_w[7:3]==sao_add_type_1_w)              
        db_pixel_0_3_r  =   db_pixel_0_3_w + sao_add_offset_1_w;
    else if(db_pixel_0_3_w[7:3]==sao_add_type_2_w)              
        db_pixel_0_3_r  =   db_pixel_0_3_w + sao_add_offset_2_w;
    else if(db_pixel_0_3_w[7:3]==sao_add_type_3_w)              
        db_pixel_0_3_r  =   db_pixel_0_3_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_0_3_r  =   db_pixel_0_3_w                     ;
end 

always @* begin                                                 
    if(db_pixel_1_0_w[7:3]==sao_add_type_0_w)                   
        db_pixel_1_0_r  =   db_pixel_1_0_w + sao_add_offset_0_w;
    else if(db_pixel_1_0_w[7:3]==sao_add_type_1_w)              
        db_pixel_1_0_r  =   db_pixel_1_0_w + sao_add_offset_1_w;
    else if(db_pixel_1_0_w[7:3]==sao_add_type_2_w)              
        db_pixel_1_0_r  =   db_pixel_1_0_w + sao_add_offset_2_w;
    else if(db_pixel_1_0_w[7:3]==sao_add_type_3_w)              
        db_pixel_1_0_r  =   db_pixel_1_0_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_1_0_r  =   db_pixel_1_0_w                     ;
end 

always @* begin                                                 
    if(db_pixel_1_1_w[7:3]==sao_add_type_0_w)                   
        db_pixel_1_1_r  =   db_pixel_1_1_w + sao_add_offset_0_w;
    else if(db_pixel_1_1_w[7:3]==sao_add_type_1_w)              
        db_pixel_1_1_r  =   db_pixel_1_1_w + sao_add_offset_1_w;
    else if(db_pixel_1_1_w[7:3]==sao_add_type_2_w)              
        db_pixel_1_1_r  =   db_pixel_1_1_w + sao_add_offset_2_w;
    else if(db_pixel_1_1_w[7:3]==sao_add_type_3_w)              
        db_pixel_1_1_r  =   db_pixel_1_1_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_1_1_r  =   db_pixel_1_1_w                     ;
end 

always @* begin                                                 
    if(db_pixel_1_2_w[7:3]==sao_add_type_0_w)                   
        db_pixel_1_2_r  =   db_pixel_1_2_w + sao_add_offset_0_w;
    else if(db_pixel_1_2_w[7:3]==sao_add_type_1_w)              
        db_pixel_1_2_r  =   db_pixel_1_2_w + sao_add_offset_1_w;
    else if(db_pixel_1_2_w[7:3]==sao_add_type_2_w)              
        db_pixel_1_2_r  =   db_pixel_1_2_w + sao_add_offset_2_w;
    else if(db_pixel_1_2_w[7:3]==sao_add_type_3_w)              
        db_pixel_1_2_r  =   db_pixel_1_2_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_1_2_r  =   db_pixel_1_2_w                     ;
end 

always @* begin                                                 
    if(db_pixel_1_3_w[7:3]==sao_add_type_0_w)                   
        db_pixel_1_3_r  =   db_pixel_1_3_w + sao_add_offset_0_w;
    else if(db_pixel_1_3_w[7:3]==sao_add_type_1_w)              
        db_pixel_1_3_r  =   db_pixel_1_3_w + sao_add_offset_1_w;
    else if(db_pixel_1_3_w[7:3]==sao_add_type_2_w)              
        db_pixel_1_3_r  =   db_pixel_1_3_w + sao_add_offset_2_w;
    else if(db_pixel_1_3_w[7:3]==sao_add_type_3_w)              
        db_pixel_1_3_r  =   db_pixel_1_3_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_1_3_r  =   db_pixel_1_3_w                     ;
end 

always @* begin                                                 
    if(db_pixel_2_0_w[7:3]==sao_add_type_0_w)                   
        db_pixel_2_0_r  =   db_pixel_2_0_w + sao_add_offset_0_w;
    else if(db_pixel_2_0_w[7:3]==sao_add_type_1_w)              
        db_pixel_2_0_r  =   db_pixel_2_0_w + sao_add_offset_1_w;
    else if(db_pixel_2_0_w[7:3]==sao_add_type_2_w)              
        db_pixel_2_0_r  =   db_pixel_2_0_w + sao_add_offset_2_w;
    else if(db_pixel_2_0_w[7:3]==sao_add_type_3_w)              
        db_pixel_2_0_r  =   db_pixel_2_0_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_2_0_r  =   db_pixel_2_0_w                     ;
end 

always @* begin                                                 
    if(db_pixel_2_1_w[7:3]==sao_add_type_0_w)                   
        db_pixel_2_1_r  =   db_pixel_2_1_w + sao_add_offset_0_w;
    else if(db_pixel_2_1_w[7:3]==sao_add_type_1_w)              
        db_pixel_2_1_r  =   db_pixel_2_1_w + sao_add_offset_1_w;
    else if(db_pixel_2_1_w[7:3]==sao_add_type_2_w)              
        db_pixel_2_1_r  =   db_pixel_2_1_w + sao_add_offset_2_w;
    else if(db_pixel_2_1_w[7:3]==sao_add_type_3_w)              
        db_pixel_2_1_r  =   db_pixel_2_1_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_2_1_r  =   db_pixel_2_1_w                     ;
end 

always @* begin                                                 
    if(db_pixel_2_2_w[7:3]==sao_add_type_0_w)                   
        db_pixel_2_2_r  =   db_pixel_2_2_w + sao_add_offset_0_w;
    else if(db_pixel_2_2_w[7:3]==sao_add_type_1_w)              
        db_pixel_2_2_r  =   db_pixel_2_2_w + sao_add_offset_1_w;
    else if(db_pixel_2_2_w[7:3]==sao_add_type_2_w)              
        db_pixel_2_2_r  =   db_pixel_2_2_w + sao_add_offset_2_w;
    else if(db_pixel_2_2_w[7:3]==sao_add_type_3_w)              
        db_pixel_2_2_r  =   db_pixel_2_2_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_2_2_r  =   db_pixel_2_2_w                     ;
end 

always @* begin                                                 
    if(db_pixel_2_3_w[7:3]==sao_add_type_0_w)                   
        db_pixel_2_3_r  =   db_pixel_2_3_w + sao_add_offset_0_w;
    else if(db_pixel_2_3_w[7:3]==sao_add_type_1_w)              
        db_pixel_2_3_r  =   db_pixel_2_3_w + sao_add_offset_1_w;
    else if(db_pixel_2_3_w[7:3]==sao_add_type_2_w)              
        db_pixel_2_3_r  =   db_pixel_2_3_w + sao_add_offset_2_w;
    else if(db_pixel_2_3_w[7:3]==sao_add_type_3_w)              
        db_pixel_2_3_r  =   db_pixel_2_3_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_2_3_r  =   db_pixel_2_3_w                     ;
end 

always @* begin                                                 
    if(db_pixel_3_0_w[7:3]==sao_add_type_0_w)                   
        db_pixel_3_0_r  =   db_pixel_3_0_w + sao_add_offset_0_w;
    else if(db_pixel_3_0_w[7:3]==sao_add_type_1_w)              
        db_pixel_3_0_r  =   db_pixel_3_0_w + sao_add_offset_1_w;
    else if(db_pixel_3_0_w[7:3]==sao_add_type_2_w)              
        db_pixel_3_0_r  =   db_pixel_3_0_w + sao_add_offset_2_w;
    else if(db_pixel_3_0_w[7:3]==sao_add_type_3_w)              
        db_pixel_3_0_r  =   db_pixel_3_0_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_3_0_r  =   db_pixel_3_0_w                     ;
end 

always @* begin                                                 
    if(db_pixel_3_1_w[7:3]==sao_add_type_0_w)                   
        db_pixel_3_1_r  =   db_pixel_3_1_w + sao_add_offset_0_w;
    else if(db_pixel_3_1_w[7:3]==sao_add_type_1_w)              
        db_pixel_3_1_r  =   db_pixel_3_1_w + sao_add_offset_1_w;
    else if(db_pixel_3_1_w[7:3]==sao_add_type_2_w)              
        db_pixel_3_1_r  =   db_pixel_3_1_w + sao_add_offset_2_w;
    else if(db_pixel_3_1_w[7:3]==sao_add_type_3_w)              
        db_pixel_3_1_r  =   db_pixel_3_1_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_3_1_r  =   db_pixel_3_1_w                     ;
end 

always @* begin                                                 
    if(db_pixel_3_2_w[7:3]==sao_add_type_0_w)                   
        db_pixel_3_2_r  =   db_pixel_3_2_w + sao_add_offset_0_w;
    else if(db_pixel_3_2_w[7:3]==sao_add_type_1_w)              
        db_pixel_3_2_r  =   db_pixel_3_2_w + sao_add_offset_1_w;
    else if(db_pixel_3_2_w[7:3]==sao_add_type_2_w)              
        db_pixel_3_2_r  =   db_pixel_3_2_w + sao_add_offset_2_w;
    else if(db_pixel_3_2_w[7:3]==sao_add_type_3_w)              
        db_pixel_3_2_r  =   db_pixel_3_2_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_3_2_r  =   db_pixel_3_2_w                     ;
end 

always @* begin                                                 
    if(db_pixel_3_3_w[7:3]==sao_add_type_0_w)                   
        db_pixel_3_3_r  =   db_pixel_3_3_w + sao_add_offset_0_w;
    else if(db_pixel_3_3_w[7:3]==sao_add_type_1_w)              
        db_pixel_3_3_r  =   db_pixel_3_3_w + sao_add_offset_1_w;
    else if(db_pixel_3_3_w[7:3]==sao_add_type_2_w)              
        db_pixel_3_3_r  =   db_pixel_3_3_w + sao_add_offset_2_w;
    else if(db_pixel_3_3_w[7:3]==sao_add_type_3_w)              
        db_pixel_3_3_r  =   db_pixel_3_3_w + sao_add_offset_3_w;
    else                                                        
        db_pixel_3_3_r  =   db_pixel_3_3_w                     ;
end 


assign mb_db_data_w = {db_pixel_3_3_r[7:0],db_pixel_3_2_r[7:0],db_pixel_3_1_r[7:0],db_pixel_3_0_r[7:0],
                       db_pixel_2_3_r[7:0],db_pixel_2_2_r[7:0],db_pixel_2_1_r[7:0],db_pixel_2_0_r[7:0],
                       db_pixel_1_3_r[7:0],db_pixel_1_2_r[7:0],db_pixel_1_1_r[7:0],db_pixel_1_0_r[7:0],
                       db_pixel_0_3_r[7:0],db_pixel_0_2_r[7:0],db_pixel_0_1_r[7:0],db_pixel_0_0_r[7:0]};

assign  mb_db_data_o       = mb_db_data_w           ;






endmodule 							