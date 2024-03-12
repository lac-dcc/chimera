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
// Filename       : db_sao_cal_diff.v
// Author         : Chewein
// Created        : 2015-03-16
// Description    : Calculation the difference between original pixels 
//                  and Debloking pixels
//-------------------------------------------------------------------
module db_sao_cal_diff(
                   dp_i          ,
                   op_i          , 
				   data_valid_i  ,
                   ominusdp_o    ,
				   index_o
                ); 
//---------------------------------------------------------------------------
//
//                        INPUT/OUTPUT DECLARATION 
//
//----------------------------------------------------------------------------
input           [  7:0 ]       dp_i              ;
input           [  7:0 ]       op_i              ;
input                          data_valid_i      ;
output          [287:0 ]       ominusdp_o        ;
output          [ 31:0 ]       index_o           ;

wire  signed    [  8:0 ]       ominusdp_w        ;
reg             [287:0 ]       ominusdp_t        ;

reg             [ 31:0]        index_r           ;

assign          ominusdp_w   =    op_i  -  dp_i  ;


always @* begin 
    case(dp_i[7:3])
        5'd0 : begin ominusdp_t  = {279'b0,ominusdp_w       }; index_r = 32'b00000000000000000000000000000001 ; end 
        5'd1 : begin ominusdp_t  = {270'b0,ominusdp_w,  9'd0}; index_r = 32'b00000000000000000000000000000010 ; end 
        5'd2 : begin ominusdp_t  = {261'b0,ominusdp_w, 18'd0}; index_r = 32'b00000000000000000000000000000100 ; end 
        5'd3 : begin ominusdp_t  = {252'b0,ominusdp_w, 27'd0}; index_r = 32'b00000000000000000000000000001000 ; end 
        5'd4 : begin ominusdp_t  = {243'b0,ominusdp_w, 36'd0}; index_r = 32'b00000000000000000000000000010000 ; end 
        5'd5 : begin ominusdp_t  = {234'b0,ominusdp_w, 45'd0}; index_r = 32'b00000000000000000000000000100000 ; end 
        5'd6 : begin ominusdp_t  = {225'b0,ominusdp_w, 54'd0}; index_r = 32'b00000000000000000000000001000000 ; end 
        5'd7 : begin ominusdp_t  = {216'b0,ominusdp_w, 63'd0}; index_r = 32'b00000000000000000000000010000000 ; end 
        5'd8 : begin ominusdp_t  = {207'b0,ominusdp_w, 72'd0}; index_r = 32'b00000000000000000000000100000000 ; end 
        5'd9 : begin ominusdp_t  = {198'b0,ominusdp_w, 81'd0}; index_r = 32'b00000000000000000000001000000000 ; end 
		5'd10: begin ominusdp_t  = {189'b0,ominusdp_w, 90'd0}; index_r = 32'b00000000000000000000010000000000 ; end 
		5'd11: begin ominusdp_t  = {180'b0,ominusdp_w, 99'd0}; index_r = 32'b00000000000000000000100000000000 ; end 
		5'd12: begin ominusdp_t  = {171'b0,ominusdp_w,108'd0}; index_r = 32'b00000000000000000001000000000000 ; end 
		5'd13: begin ominusdp_t  = {162'b0,ominusdp_w,117'd0}; index_r = 32'b00000000000000000010000000000000 ; end 
		5'd14: begin ominusdp_t  = {153'b0,ominusdp_w,126'd0}; index_r = 32'b00000000000000000100000000000000 ; end 
		5'd15: begin ominusdp_t  = {144'b0,ominusdp_w,135'd0}; index_r = 32'b00000000000000001000000000000000 ; end 
		5'd16: begin ominusdp_t  = {135'b0,ominusdp_w,144'd0}; index_r = 32'b00000000000000010000000000000000 ; end 
		5'd17: begin ominusdp_t  = {126'b0,ominusdp_w,153'd0}; index_r = 32'b00000000000000100000000000000000 ; end 
		5'd18: begin ominusdp_t  = {117'b0,ominusdp_w,162'd0}; index_r = 32'b00000000000001000000000000000000 ; end 
		5'd19: begin ominusdp_t  = {108'b0,ominusdp_w,171'd0}; index_r = 32'b00000000000010000000000000000000 ; end 
		5'd20: begin ominusdp_t  = { 99'b0,ominusdp_w,180'd0}; index_r = 32'b00000000000100000000000000000000 ; end 
		5'd21: begin ominusdp_t  = { 90'b0,ominusdp_w,189'd0}; index_r = 32'b00000000001000000000000000000000 ; end 
		5'd22: begin ominusdp_t  = { 81'b0,ominusdp_w,198'd0}; index_r = 32'b00000000010000000000000000000000 ; end 
		5'd23: begin ominusdp_t  = { 72'b0,ominusdp_w,207'd0}; index_r = 32'b00000000100000000000000000000000 ; end 
		5'd24: begin ominusdp_t  = { 63'b0,ominusdp_w,216'd0}; index_r = 32'b00000001000000000000000000000000 ; end 
		5'd25: begin ominusdp_t  = { 54'b0,ominusdp_w,225'd0}; index_r = 32'b00000010000000000000000000000000 ; end 
		5'd26: begin ominusdp_t  = { 45'b0,ominusdp_w,234'd0}; index_r = 32'b00000100000000000000000000000000 ; end 
		5'd27: begin ominusdp_t  = { 36'b0,ominusdp_w,243'd0}; index_r = 32'b00001000000000000000000000000000 ; end 
		5'd28: begin ominusdp_t  = { 27'b0,ominusdp_w,252'd0}; index_r = 32'b00010000000000000000000000000000 ; end 
		5'd29: begin ominusdp_t  = { 18'b0,ominusdp_w,261'd0}; index_r = 32'b00100000000000000000000000000000 ; end 
		5'd30: begin ominusdp_t  = {  9'b0,ominusdp_w,270'd0}; index_r = 32'b01000000000000000000000000000000 ; end 
		5'd31: begin ominusdp_t  = {       ominusdp_w,279'd0}; index_r = 32'b10000000000000000000000000000000 ; end 
    endcase 
end 

assign   ominusdp_o = data_valid_i ? 287'd0 : ominusdp_t;
assign   index_o    = data_valid_i ? 32'd0  : index_r   ;


endmodule 
