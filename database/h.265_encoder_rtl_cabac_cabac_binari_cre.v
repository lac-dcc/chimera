//-----------------------------------------------------------------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-----------------------------------------------------------------------------------------------------------------------------
// Filename       : cabac_binari_cre.v
// Author         : chewein
// Created        : 2014-10-18
// Description    : syntax element binarization
//-----------------------------------------------------------------------------------------------------------------------------      
`include "enc_defines.v"

module cabac_binari_cre(
                            clk                 ,                        
                            rst_n               , 
							coded_flag_i        ,
                            coded_symbol_i      , 
                            go_param_i          , 
                            ctx_pair_cre_0_o    , 
                            ctx_pair_cre_1_o    , 
                            ctx_pair_cre_2_o    , 
                            ctx_pair_cre_3_o    ,
							ctx_pair_valid_num_o
                        );
//-----------------------------------------------------------------------------------------------------------------------------
//
//               input and output signals declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
input                                  clk                                     ;
input                                  rst_n                                   ;
input                                  coded_flag_i                            ;
input    [ 15:0 ]                      coded_symbol_i                          ;  
input    [  2:0 ]                      go_param_i                              ; // maximum : 4 

output   [ 10:0 ]                      ctx_pair_cre_0_o                        ; // coeff_cnt_i = 5'd11
output   [ 10:0 ]                      ctx_pair_cre_1_o                        ; // coeff_cnt_i = 5'd11
output   [ 10:0 ]                      ctx_pair_cre_2_o                        ; // coeff_cnt_i = 5'd11
output   [ 10:0 ]                      ctx_pair_cre_3_o                        ; // coeff_cnt_i = 5'd11
output   [  2:0  ]                     ctx_pair_valid_num_o                    ;

reg      [ 10:0 ]                      ctx_pair_cre_0_o                        ; 
reg      [ 10:0 ]                      ctx_pair_cre_1_o                        ; 
reg      [ 10:0 ]                      ctx_pair_cre_2_o                        ; 
reg      [ 10:0 ]                      ctx_pair_cre_3_o                        ; 
//-----------------------------------------------------------------------------------------------------------------------------
//
//              calculation length1 , length2 ,bins1, bins2 : symbol <(3<<go_param_i) : coeff_cnt_i = 5'd8 
//
//-----------------------------------------------------------------------------------------------------------------------------

wire                                   symbol_lt_param_w                       ;

wire     [  3:0 ]                      cre_length_0_0_w                        ; // coeff_cnt_i = 5'd9
wire     [  3:0 ]                      cre_length_0_1_w                        ; // coeff_cnt_i = 5'd9
wire     [ 10:0 ]                      cre_bins_0_0_w                          ; // coeff_cnt_i = 5'd9
reg      [ 10:0 ]                      cre_bins_0_1_r                          ; // coeff_cnt_i = 5'd9


assign   symbol_lt_param_w   =        (coded_symbol_i<(8'b0000011<<go_param_i));

assign   cre_length_0_0_w    =        (coded_symbol_i>>go_param_i) + 1'b1      ;
assign   cre_length_0_1_w    =        {1'b0,go_param_i }                       ;
assign   cre_bins_0_0_w      =        (11'd1<<cre_length_0_0_w)-2'd2           ;
   
always @* begin 
    case(go_param_i)
        3'd0  :   cre_bins_0_1_r  =  11'd0                                     ; // coded_symbol_i % 1 
        3'd1  :   cre_bins_0_1_r  =  {6'b0,4'b0000,coded_symbol_i[0]  }        ; // coded_symbol_i % 2
        3'd2  :   cre_bins_0_1_r  =  {6'b0,3'b000 ,coded_symbol_i[1:0]}        ; // coded_symbol_i % 4
        3'd3  :   cre_bins_0_1_r  =  {6'b0,2'b00  ,coded_symbol_i[2:0]}        ; // coded_symbol_i % 8
        3'd4  :   cre_bins_0_1_r  =  {6'b0,1'b0   ,coded_symbol_i[3:0]}        ; // coded_symbol_i % 16 
       default:   cre_bins_0_1_r  =  11'd0                                     ;
    endcase 
end 

reg                                    coded_flag_d1_r                         ;
reg                                    symbol_lt_param_d1_r                    ;
reg      [  3:0 ]                      cre_length_0_0_d1_r                     ; // coeff_cnt_i = 5'd10
reg      [  3:0 ]                      cre_length_0_1_d1_r                     ; // coeff_cnt_i = 5'd10
reg      [ 10:0 ]                      cre_bins_0_0_d1_r                       ; // coeff_cnt_i = 5'd10
reg      [ 10:0 ]                      cre_bins_0_1_d1_r                       ; // coeff_cnt_i = 5'd10
reg      [  2:0 ]                      go_param_d1_r                           ;

// delay 1 cycle 
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
	    coded_flag_d1_r           <=     1'b0                                  ; 
	    symbol_lt_param_d1_r      <=     1'b0                                  ;
        cre_length_0_0_d1_r       <=     4'd0                                  ;
        cre_length_0_1_d1_r       <=     4'd0                                  ;
        cre_bins_0_0_d1_r         <=     11'd0                                 ;
        cre_bins_0_1_d1_r         <=     11'd0                                 ;
		go_param_d1_r             <=     3'd0                                  ;
    end  
	else begin 
	    coded_flag_d1_r           <=     coded_flag_i                          ;
	    symbol_lt_param_d1_r      <=     symbol_lt_param_w                     ;
	    cre_length_0_0_d1_r       <=     cre_length_0_0_w                      ;
	    cre_length_0_1_d1_r       <=     cre_length_0_1_w                      ;
	    cre_bins_0_0_d1_r         <=     cre_bins_0_0_w                        ;
	    cre_bins_0_1_d1_r         <=     cre_bins_0_1_r                        ;
		go_param_d1_r             <=     go_param_i                            ;
    end 
end 




//-----------------------------------------------------------------------------------------------------------------------------
//
//              calculation length1 , length2 ,bins1, bins2 : symbol >=(3<<go_param_i) : coeff_cnt_i = 5'd8 
//
//-----------------------------------------------------------------------------------------------------------------------------

wire     [  3:0 ]            cre_length_1_0_w                                  ; // coeff_cnt_i = 5'd10
wire     [  3:0 ]            cre_length_1_1_w                                  ; // coeff_cnt_i = 5'd10
wire     [ 10:0 ]            cre_bins_1_0_w                                    ; // coeff_cnt_i = 5'd10
wire     [ 10:0 ]            cre_bins_1_1_w                                    ; // coeff_cnt_i = 5'd10

wire     [  3:0 ]            length_i ={1'b0,go_param_i}                       ;
wire     [ 15:0 ]            symbol_i =coded_symbol_i-(8'b00000011<<go_param_i);

wire     [ 15:0 ]            symbol_0_0_w     ,    symbol_0_1_w                ; // coeff_cnt_i = 5'd9 
wire     [ 15:0 ]            symbol_0_2_w     ,    symbol_0_3_w                ; // coeff_cnt_i = 5'd9 
wire     [  3:0 ]            length_0_0_w     ,    length_0_1_w                ; // coeff_cnt_i = 5'd9 
wire     [  3:0 ]            length_0_2_w     ,    length_0_3_w                ; // coeff_cnt_i = 5'd9 

reg      [ 15:0 ]            symbol_1_0_r                                      ; // coeff_cnt_i = 5'd10  
wire     [ 15:0 ]                                  symbol_1_1_w                ; // coeff_cnt_i = 5'd10  
wire     [ 15:0 ]            symbol_1_2_w     ,    symbol_1_3_w                ; // coeff_cnt_i = 5'd10  
reg      [  3:0 ]            length_1_0_r                                      ; // coeff_cnt_i = 5'd10  
wire     [  3:0 ]                                  length_1_1_w                ; // coeff_cnt_i = 5'd10  
wire     [  3:0 ]            length_1_2_w     ,    length_1_3_w                ; // coeff_cnt_i = 5'd10  


assign   symbol_0_0_w  =  (symbol_i    >=(16'b1<<length_i    ))? ( symbol_i     - (16'b1<<length_i)     ): symbol_i      ;
assign   length_0_0_w  =  (symbol_i    >=(16'b1<<length_i    ))?   length_i      + 4'd1                  : length_i      ;

assign   symbol_0_1_w  =  (symbol_0_0_w>=(16'b1<<length_0_0_w))? ( symbol_0_0_w - ( 16'b1<<length_0_0_w)): symbol_0_0_w  ;
assign   length_0_1_w  =  (symbol_0_0_w>=(16'b1<<length_0_0_w))?  length_0_0_w  + 4'd1                   : length_0_0_w  ;

assign   symbol_0_2_w  =  (symbol_0_1_w>=(16'b1<<length_0_1_w))? ( symbol_0_1_w - (16'b1<<length_0_1_w) ): symbol_0_1_w  ;
assign   length_0_2_w  =  (symbol_0_1_w>=(16'b1<<length_0_1_w))?  length_0_1_w  + 4'd1                   : length_0_1_w  ;

assign   symbol_0_3_w  =  (symbol_0_2_w>=(16'b1<<length_0_2_w))? ( symbol_0_2_w - (16'b1<<length_0_2_w) ): symbol_0_2_w  ;
assign   length_0_3_w  =  (symbol_0_2_w>=(16'b1<<length_0_2_w))?  length_0_2_w  + 4'd1                   : length_0_2_w  ;

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        symbol_1_0_r   <=  16'd0                                               ;
		length_1_0_r   <=  4'd0                                                ;
    end 
    else if( (symbol_0_3_w>=(16'b1<<length_0_3_w) )  ) begin 
	    symbol_1_0_r   <=  symbol_0_3_w - (16'b1<<length_0_3_w)                ;
        length_1_0_r   <=  length_0_3_w   +   1'b1                             ;
	end 
	else begin 
	    symbol_1_0_r   <=   symbol_0_3_w                                       ;
	    length_1_0_r   <=   length_0_3_w                                       ;
	end 
end 

assign   symbol_1_1_w  =  (symbol_1_0_r>=(16'b1<<length_1_0_r))? symbol_1_0_r - ( 16'b1<<length_1_0_r )              :  symbol_1_0_r ;
assign   length_1_1_w  =  (symbol_1_0_r>=(16'b1<<length_1_0_r))? length_1_0_r  + 4'd1                                : length_1_0_r  ;

assign   symbol_1_2_w  =  (symbol_1_1_w>=(16'b1<<length_1_1_w))? symbol_1_1_w - (16'b1<<length_1_1_w  )              : symbol_1_1_w  ;
assign   length_1_2_w  =  (symbol_1_1_w>=(16'b1<<length_1_1_w))? length_1_1_w  + 4'd1                                : length_1_1_w  ;

assign   symbol_1_3_w  =  (symbol_1_2_w>=(16'b1<<length_1_2_w))? symbol_1_2_w - (16'b1<<length_1_2_w  )              : symbol_1_2_w  ;
assign   length_1_3_w  =  (symbol_1_2_w>=(16'b1<<length_1_2_w))? length_1_2_w  + 4'd1                                : length_1_2_w  ;

assign   cre_length_1_0_w   =  4'd4 + length_1_3_w - go_param_d1_r           ; // coeff_cnt_i = 5'd9
assign   cre_length_1_1_w   =  length_1_3_w                                  ; // coeff_cnt_i = 5'd9
assign   cre_bins_1_0_w     =  (11'd1<<cre_length_1_0_w)- 2'd2               ; // coeff_cnt_i = 5'd9
assign   cre_bins_1_1_w     =  symbol_1_3_w[10:0]                            ; // coeff_cnt_i = 5'd9








//-----------------------------------------------------------------------------------------------------------------------------
//
//              output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------



wire  [3:0]   length_0_d1_minus5_w   =     cre_length_0_0_d1_r-4'd5                             ;        
wire  [3:0]   length_1_d1_minus5_w   =     cre_length_0_1_d1_r-4'd5                             ;  

wire  [3:0]   length_2_d1_minus5_w   =     cre_length_1_0_w   -4'd5                             ;  
wire  [3:0]   length_3_d1_minus5_w   =     cre_length_1_1_w   -4'd5                             ;  
wire  [1:0]   coding_mdoe            =     {coded_flag_d1_r,!coded_flag_d1_r}                   ; 

reg   [2:0]   ctx_pair_valid_num_r                                                              ;

// ctx_pair_valid_num_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        ctx_pair_valid_num_r    <=      3'd0                                                    ;
	else if(coded_flag_d1_r)
        ctx_pair_valid_num_r    <=      3'd4                                                    ;
	else 
        ctx_pair_valid_num_r    <=      3'd0                                                    ;
end 

// ctx_pair_valid_num_o
assign        ctx_pair_valid_num_o   =      ctx_pair_valid_num_r                                ;


reg      [ 4:0 ]   length_total_r                                                               ;
reg      [19:0 ]   bins_total_r                                                                 ;

wire  [3:0]   length_total_minus5_w   =     length_total_r-4'd5                                 ;        
wire  [3:0]   length_total_minus10_w  =     length_total_r-4'd10                                ;  
wire  [3:0]   length_total_minus15_w  =     length_total_r-4'd15                                ;        
   
always @* begin 
    if(symbol_lt_param_d1_r) begin 
        length_total_r   =   cre_length_0_0_d1_r   +   cre_length_0_1_d1_r                      ;
		bins_total_r     =   (cre_bins_0_0_d1_r<<cre_length_0_1_d1_r) + cre_bins_0_1_d1_r[9:0]  ;
	end 	
	else                     begin 
	    length_total_r   =   cre_length_1_0_w      +  cre_length_1_1_w                          ;
	    bins_total_r     =   (cre_bins_1_0_w<<cre_length_1_1_w) + cre_bins_1_1_w[9:0]           ;
	end 
end 

always @(posedge clk or negedge rst_n) begin 
	if(!rst_n) begin 
        ctx_pair_cre_0_o    <=   {2'b01,1'b0,8'hff}   ;  
        ctx_pair_cre_1_o    <=   {2'b01,1'b0,8'hff}   ;  
        ctx_pair_cre_2_o    <=   {2'b01,1'b0,8'hff}   ;  
        ctx_pair_cre_3_o    <=   {2'b01,1'b0,8'hff}   ;  
    end 
    else if(length_total_r<5'd6)  begin 
        ctx_pair_cre_0_o    <=   {coding_mdoe,1'b0,length_total_r[2:0],bins_total_r[4:0]} ;
        ctx_pair_cre_1_o    <=   {2'b01,1'b0,8'hff}   ;
        ctx_pair_cre_2_o    <=   {2'b01,1'b0,8'hff}   ;
        ctx_pair_cre_3_o    <=   {2'b01,1'b0,8'hff}   ;
    end 
    else if(length_total_r<5'd11)  begin 
        ctx_pair_cre_0_o    <=   {coding_mdoe,1'b0,length_total_minus5_w[2:0],bins_total_r[9:5]} ;
        ctx_pair_cre_1_o    <=   {coding_mdoe,1'b0,3'd5                      ,bins_total_r[4:0]} ;
        ctx_pair_cre_2_o    <=   {2'b01,1'b0,8'hff}   ;
        ctx_pair_cre_3_o    <=   {2'b01,1'b0,8'hff}   ;
    end 
    else if(length_total_r<5'd16)  begin 
        ctx_pair_cre_0_o    <=   {coding_mdoe,1'b0,length_total_minus10_w[2:0],bins_total_r[14:10]} ;
        ctx_pair_cre_1_o    <=   {coding_mdoe,1'b0,3'd5                       ,bins_total_r[ 9:5 ]} ;
        ctx_pair_cre_2_o    <=   {coding_mdoe,1'b0,3'd5                       ,bins_total_r[ 4:0 ]} ;
        ctx_pair_cre_3_o    <=   {2'b01,1'b0,8'hff}   ;
    end 
    else begin 
        ctx_pair_cre_0_o    <=   {coding_mdoe,1'b0,length_total_minus15_w[2:0],bins_total_r[19:15]} ; 
        ctx_pair_cre_1_o    <=   {coding_mdoe,1'b0,3'd5                       ,bins_total_r[14:10]} ;
        ctx_pair_cre_2_o    <=   {coding_mdoe,1'b0,3'd5                       ,bins_total_r[ 9:5 ]} ;
        ctx_pair_cre_3_o    <=   {coding_mdoe,1'b0,3'd5                       ,bins_total_r[ 4:0 ]} ;
    end 
end 

/*
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        ctx_pair_cre_0_o    <=   11'd0                                                          ;
        ctx_pair_cre_1_o    <=   11'd0                                                          ;
    end 
	else if(symbol_lt_param_d1_r) begin 
        if(cre_length_0_0_d1_r<4'd6) begin 
            ctx_pair_cre_0_o    <=  {coding_mdoe,1'b0,cre_length_0_0_d1_r[2:0],cre_bins_0_0_d1_r[4:0] }; 
	        ctx_pair_cre_1_o    <=  {2'b01      ,1'b0,8'hff                                           };
        end 
        else begin 
            ctx_pair_cre_0_o    <=  {coding_mdoe,1'b0,length_0_d1_minus5_w[2:0],cre_bins_0_0_d1_r[9:5]}; 
	        ctx_pair_cre_1_o    <=  {coding_mdoe,1'b0,3'd5                     ,cre_bins_0_0_d1_r[4:0]};
        end 
    end
    else begin 
        if(cre_length_1_0_w<4'd6) begin 
            ctx_pair_cre_0_o    <=  {coding_mdoe,1'b0,cre_length_1_0_w[2:0]    ,cre_bins_1_0_w[4:0]   }; 
	        ctx_pair_cre_1_o    <=  {2'b01      ,1'b0,8'hff                                           };
        end 
        else begin 
            ctx_pair_cre_0_o    <=  {coding_mdoe,1'b0,length_2_d1_minus5_w[2:0],cre_bins_1_0_w[9:5]   }; 
	        ctx_pair_cre_1_o    <=  {coding_mdoe,1'b0,3'd5                     ,cre_bins_1_0_w[4:0]   };
        end 
	end 	
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        ctx_pair_cre_2_o    <=   11'd0                                                           ;
        ctx_pair_cre_3_o    <=   11'd0                                                           ;
    end 
	else if(symbol_lt_param_d1_r) begin 
        if(cre_length_0_1_d1_r<4'd6) begin 
            ctx_pair_cre_2_o    <=  {coding_mdoe,1'b0,cre_length_0_1_d1_r[2:0],cre_bins_0_1_d1_r[4:0] }; 
	        ctx_pair_cre_3_o    <=  {2'b01      ,1'b0,8'hff                                           };
        end 
        else begin 
            ctx_pair_cre_2_o    <=  {coding_mdoe,1'b0,length_1_d1_minus5_w[2:0],cre_bins_0_1_d1_r[9:5]}; 
	        ctx_pair_cre_3_o    <=  {coding_mdoe,1'b0,3'd5                     ,cre_bins_0_1_d1_r[4:0]};
        end 
    end
    else begin 
        if(cre_length_1_1_w<4'd6) begin 
            ctx_pair_cre_2_o    <=  {coding_mdoe,1'b0,cre_length_1_1_w[2:0]    ,cre_bins_1_1_w[4:0]   }; 
	        ctx_pair_cre_3_o    <=  {2'b01      ,1'b0,8'hff                                           };
        end 
        else begin 
            ctx_pair_cre_2_o    <=  {coding_mdoe,1'b0,length_3_d1_minus5_w[2:0],cre_bins_1_1_w[9:5]   }; 
	        ctx_pair_cre_3_o    <=  {coding_mdoe,1'b0,3'd5                     ,cre_bins_1_1_w[4:0]   };
        end         
    end 	
end 

*/







endmodule 


