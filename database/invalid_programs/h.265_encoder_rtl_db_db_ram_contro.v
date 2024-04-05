//***************************************************--
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan UniYVERsity
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//*****************************************************
// Filename       : db_ram_contro.v
// AutYHOR        : Chewein
// Created        : 2014-04-18
// Description    : the ram controller           
//*****************************************************
`include "./enc_defines.v"
module db_ram_contro	(
					   clk   		  ,
					   rst_n 		  ,
					   start_i		  ,
					   cnt_i		  ,
					   state_i        ,
					   mb_x_i         ,
					   mb_y_i		  ,
					   mb_x_total_i   ,
					   f_p_i		  ,
					   f_q_i		  ,					   
					   //output       
					   op_enable_o    , // original enable 
					   oq_enable_o    , // original enable 
					   op_o           , // original pixels 
					   oq_o           , // original pixels
					   p_o			  ,
					   q_o			  ,

					   tq_ren_o  	  ,
					   tq_raddr_o	  ,
					   tq_rdata_i	  ,

					   tq_ori_data_i  ,

					   mb_db_en_o	  ,
					   mb_db_rw_o	  , // db pixel read/write 0: read, 1: write
					   mb_db_addr_o   ,
					   mb_db_data_o   ,
					   
					   db_wen_o 	  , // write to external memory     
					   db_w4x4_x_o 	  , // write to external memory 
					   db_w4x4_y_o 	  , // write to external memory 
					   db_wprevious_o , // write to external memory   
					   db_wdone_o     , // write to external memory   
					   db_wsel_o      , // write to external memory   
					   db_wdata_o 	  , // write to external memory    
					   
					   mb_db_ren_o    , // read top pixels enable
					   mb_db_r4x4_o   , // the index x 
					   mb_db_ridx_o   , // the index y
					   mb_db_data_i   ,
					   
					   is_ver_o       ,
					   is_luma_o      ,
                       sao_data_end_o 				   
					);
//***********************************************************************************************************************************************
//                                             
//    	PARAMETERS DECLARATION               
//                                             
//***********************************************************************************************************************************************
parameter DATA_WIDTH = 128	;

parameter IDLE   = 3'b000, LOAD  = 3'b001, YVER  = 3'b011,YHOR	=3'b010;
parameter CVER   = 3'b110, CHOR  = 3'b111, OUTLT = 3'b101,OUT   =3'b100;

//***********************************************************************************************************************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
//***********************************************************************************************************************************************
input 		                clk				        ;
input                       rst_n       	        ;
input                       start_i     	        ;
input [8:0]					cnt_i				    ;
input [2:0]					state_i				    ;
input [8-1:0]               mb_x_i                  ;
input [8-1:0]               mb_y_i				    ;
input [`PIC_X_WIDTH-1:0]    mb_x_total_i        	;// Total LCU number-1 in X ,PIC_X_WIDTH = 8

output 			            tq_ren_o		        ; //tq read enable
output[8:0]	                tq_raddr_o		        ; //tq read address
   
input [DATA_WIDTH-1:0]      tq_rdata_i	            ; //tq read data of an 8x8cu,COEFF_WIDTH = 16

input [DATA_WIDTH-1:0]      tq_ori_data_i           ; //tq read data of original pixels 
   
input [DATA_WIDTH-1:0]      f_p_i				    ;//filtered p
input [DATA_WIDTH-1:0]      f_q_i				    ;//filtered q
 
output                      op_enable_o             ; // original pixel enable
output                      oq_enable_o             ; // original pixel enable 
 
output[DATA_WIDTH-1:0]      op_o					;//original pixels
output[DATA_WIDTH-1:0]      oq_o					;//original pixels
output[DATA_WIDTH-1:0]      p_o					    ;//not filtered p
output[DATA_WIDTH-1:0]      q_o					    ;//not filtered q

output 					    mb_db_en_o	            ;
output 				  		mb_db_rw_o	            ;// db pixel read/write 0: read, 1: write
output[8:0]				    mb_db_addr_o            ;
output[DATA_WIDTH-1:0]		mb_db_data_o            ;

output 	 [1-1:0] 	        db_wen_o 	            ;// db write enable 
output 	 [5-1:0] 	        db_w4x4_x_o 	        ;// db write 4x4 block index in x 
output 	 [5-1:0] 	        db_w4x4_y_o 	        ;// db write 4x4 block index in y 
output   [1-1:0]            db_wprevious_o          ;// db write previous lcu data , 1: previous,0:current 
output   [1-1:0]            db_wdone_o              ;// db write previous lcu done
output   [2-1:0]            db_wsel_o               ;// db write 4x4 block sel : 0x:luma, 10: u, 11:v
output 	 [DATA_WIDTH-1:0] 	db_wdata_o 	            ;// db write 4x4 block data 

output					    mb_db_ren_o             ;// read top pixels enable
output[5-1:0]   		    mb_db_r4x4_o            ;// the index x 
output[2-1:0]			    mb_db_ridx_o            ;// the index y
input [DATA_WIDTH-1:0]		mb_db_data_i            ;

output                      is_ver_o			    ;//1:ver ,0:hor
output                      is_luma_o               ;//1:luma,0:chroma
output                      sao_data_end_o          ;

reg   [8:0]	                tq_raddr_o		        ; //tq read address
reg   [DATA_WIDTH-1:0]      p_o					    ;
reg   [DATA_WIDTH-1:0]      q_o					    ;
reg   [DATA_WIDTH-1:0]      mb_db_data_o		    ;
reg   [8:0]	                tq_raddr_r		        ; //tq read address

reg    		          	    rom0_cena_r 			;// chip enable, low active
wire   		          	    rom0_rena_w 			;// read enable, low active
reg     		            rom0_wena_r 			;// write enable, low active
reg   [7:0] 		  	    rom0_addra_r			;// address input
reg   [DATA_WIDTH-1:0]      rom0_dataa_i_r			;// data input
wire  [DATA_WIDTH-1:0]      rom0_dataa_o_w			;// read

reg    		          	    rom1_cena_r 			;// chip enable, low active
wire   		          	    rom1_rena_w 			;// read enable, low active
reg     		            rom1_wena_r 			;// write enable, low active
reg   [7:0] 		  	    rom1_addra_r			;// address input
reg   [DATA_WIDTH-1:0]      rom1_dataa_i_r			;// data input
wire  [DATA_WIDTH-1:0]      rom1_dataa_o_w			;// read

reg    		          	    rom0_cenb_r 			;// chip enable, low active
reg   		          	    rom0_renb_r 			;// read enable, low active
wire    		            rom0_wenb_w 			;// write enable, low active
reg   [7:0] 		  	    rom0_addrb_r			;// address input
wire  [DATA_WIDTH-1:0]      rom0_datab_i_w			;// data input
wire  [DATA_WIDTH-1:0]      rom0_datab_o_w			;// read

reg    		          	    rom1_cenb_r 			;// chip enable, low active
reg   		          	    rom1_renb_r 			;// read enable, low active
wire    		            rom1_wenb_w 			;// write enable, low active
reg   [7:0] 		  	    rom1_addrb_r			;// address input
wire  [DATA_WIDTH-1:0]      rom1_datab_i_w			;// data input
wire  [DATA_WIDTH-1:0]      rom1_datab_o_w			;// read

reg    		          	    rom_l0_cena_r 			;// chip enable
wire   		          	    rom_l0_rena_w 			;// read enable
reg     		            rom_l0_wena_r 			;// write enable
reg   [3:0] 		  	    rom_l0_addra_r			;// address 
reg   [DATA_WIDTH-1:0]      rom_l0_dataa_i_r		;// data input
wire  [DATA_WIDTH-1:0]      rom_l0_dataa_o_w		;// read

reg    		          	    rom_l1_cena_r 			;// chip enable
wire   		          	    rom_l1_rena_w 			;// read enable
reg     		            rom_l1_wena_r 			;// write enable
reg   [3:0] 		  	    rom_l1_addra_r			;// address 
reg   [DATA_WIDTH-1:0]      rom_l1_dataa_i_r		;// data input
wire  [DATA_WIDTH-1:0]      rom_l1_dataa_o_w		;// read

reg    		          	    rom_l0_cenb_r 			;// chip enable, low active
reg   		          	    rom_l0_renb_r 			;// read enable, low active
wire    		            rom_l0_wenb_w 			;// write enable, low active
reg   [3:0] 		  	    rom_l0_addrb_r			;// address input
wire  [DATA_WIDTH-1:0]      rom_l0_datab_i_w		;// data input
wire  [DATA_WIDTH-1:0]      rom_l0_datab_o_w		;// read

reg    		          	    rom_l1_cenb_r 			;// chip enable, low active
reg   		          	    rom_l1_renb_r 			;// read enable, low active
wire    		            rom_l1_wenb_w 			;// write enable, low active
reg   [3:0] 		  	    rom_l1_addrb_r			;// address input
wire  [DATA_WIDTH-1:0]      rom_l1_datab_i_w		;// data input
wire  [DATA_WIDTH-1:0]      rom_l1_datab_o_w		;// read

reg    		          	    rom_top_cena_r 			;// chip enable, low active
wire   		          	    rom_top_rena_w 			;// read enable, low active
reg     		            rom_top_wena_r 			;// write enable, low active
reg   [4:0] 		  	    rom_top_addra_r			;// address input
reg   [DATA_WIDTH-1:0]      rom_top_dataa_i_r		;// data input
wire  [DATA_WIDTH-1:0]      rom_top_dataa_o_w		;// read

reg    		          	    rom_top_cenb_r 			;// chip enable, low active
reg   		          	    rom_top_renb_r 			;// read enable, low active
wire    		            rom_top_wenb_w 			;// write enable, low active
reg   [4:0] 		  	    rom_top_addrb_r			;// address input
wire  [DATA_WIDTH-1:0]      rom_top_datab_i_w		;// data input
wire  [DATA_WIDTH-1:0]      rom_top_datab_o_w		;// read
  
reg   [DATA_WIDTH-1:0]      y_tl					;
reg   [DATA_WIDTH-1:0]      u_tl					;
reg   [DATA_WIDTH-1:0]      v_tl					;

//***********************************************************************************************************************************************
//                                             
//     read top pixels             
//                                             
//***********************************************************************************************************************************************

// OUTLT 
//  0  -   15: 0000000-0001111 left y
// 16  -   23: 0010000-0010111 left u
// 24  -   31: 0011000-0011111 left v
// 32  -   47: 0100000-0101111 top  y
// 48  -   55: 0110000-0110111 top  u
// 56  -   63: 0111000-0111111 top  v
//         64: 1000000-1000000 top left y 
//         65: 1000001-1000001 top left u
//         66: 1000010-1000010 top left v

// OUT
//   0  -   255: 000000000-011111111   y
// 256  -   319: 100000000-100111111   u
// 320  -   383: 101000000-101111111   v
reg      [7-1:0]            cnt_r                   ;
reg      [1-1:0]            db_wen_r                ;
reg      [1-1:0]            db_wprevious_r          ;// db write previous lcu data , 1: previous,0:current 
reg      [2-1:0]            db_wsel_r               ;// db write 4x4 block sel : 0x:luma, 10: u, 11:v
reg      [1-1:0]            db_wdone_r              ;// db write previous lcu done

reg    	 [5-1:0] 	        db_w4x4_x_r 	        ;// db write 4x4 block index in x 
reg    	 [5-1:0] 	        db_w4x4_y_r 	        ;// db write 4x4 block index in y 

// db_wen_r
/*
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
	    db_wen_r  <=    1'b1    ;
    else if(state_i == OUTLT) begin 
        if(mb_x_i&&mb_y_i)
            db_wen_r <=  1'b0    ;
        else if(mb_y_i)
		    db_wen_r <=  cnt_i[6];
		else if(mb_x_i)
		    db_wen_r <=  !(!cnt_i[6:5]);
        else 
		    db_wen_r <=  1'b1    ;
    end 
	else if(state_i == OUT)
	    db_wen_r <=  1'b0 ;
	else 
        db_wen_r <=  1'b1 ;
end 
*/
always @* begin 
    if(state_i == OUTLT) begin 
        if(mb_x_i&&mb_y_i)
            db_wen_r =  !cnt_i;
        else if(mb_y_i)
		    db_wen_r =  cnt_i[6]||!cnt_i;
		else if(mb_x_i)
		    db_wen_r =  !(!cnt_r[6:5]);
        else 
		    db_wen_r =  1'b1    ;
    end 
	else if(state_i == OUT)
	    db_wen_r =  !cnt_i;
	else 
        db_wen_r =  1'b1 ;
end 

// db_wprevious_r
always @* begin 
    if(state_i == OUTLT)
		db_wprevious_r     <=    !cnt_r[5] ; 
	else
        db_wprevious_r     <=    1'b0      ;
end 

// db_wsel_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        db_wsel_r     <=  2'b00             ;
    else if(state_i == OUTLT&&cnt_i[6])   // 64...66
        db_wsel_r     <=  cnt_i[1:0] + 1'b1 ;
    else if(state_i == OUTLT)
        db_wsel_r     <=  cnt_i[4:3]        ;
	else 
	    db_wsel_r     <=  {cnt_i[8],cnt_i[6]};
end 

// db_wdone_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        db_wdone_r  <=  1'b0  ;
    else if(mb_x_i=='d0)
        db_wdone_r  <=  1'b0  ;
	else if(mb_x_i == mb_x_total_i && state_i == OUT)// cnt_i == 0 || cnt_i == 384
	    db_wdone_r  <=  !cnt_i || (cnt_i == 9'd384); 
    else if(mb_x_i&& state_i == OUT)
	    db_wdone_r  <=  !cnt_i; // previous done  
	else 
	    db_wdone_r  <=  1'b0  ;
end 

// db_w4x4_x_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        db_w4x4_x_r   <=    5'd0 ;
    else if( state_i==OUTLT) begin // OUTLT 
        case(cnt_i[6:4])  
		    3'd0 : db_w4x4_x_r   <= 5'd15                  ;// left y 
		    3'd1 : db_w4x4_x_r   <= 5'd7                   ;// left u and v 
		    3'd2 : db_w4x4_x_r   <= {1'd0,cnt_i[3:0]      };// top y 
		    3'd3 : db_w4x4_x_r   <= {2'd0,cnt_i[2:0]      };// top u and v 
		    3'd4 : db_w4x4_x_r   <= {1'd0,!cnt_i[1:0],3'd7};// top left y u v  
		  default: db_w4x4_x_r   <=    5'd0                ;
		endcase
    end 
	else if(state_i == OUT) begin 
        case(cnt_i[8])  
		    1'd0 : db_w4x4_x_r   <= {1'd0,cnt_i[3:0]    };// current y 
		    1'd1 : db_w4x4_x_r   <= {2'd0,cnt_i[2:0]    };// current u and v
		endcase
	end 
end 

// db_w4x4_y_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        db_w4x4_y_r   <=    5'd0 ;
    else if( state_i==OUTLT) begin // OUTLT 
        case(cnt_i[6:4])  
		    3'd0 : db_w4x4_y_r   <= {1'b0,cnt_i[3:0]}   ;// left y 
		    3'd1 : db_w4x4_y_r   <= {2'b0,cnt_i[2:0]}   ;// left u and v 
		    3'd2 : db_w4x4_y_r   <= 5'd16               ;// top y 
		    3'd3 : db_w4x4_y_r   <= 5'd8                ;// top u and v 
		    3'd4 : db_w4x4_y_r   <= {!(cnt_i[1]||cnt_i[0]),cnt_i[1]||cnt_i[0],3'd0};// top left y:16 ,u and v:8
		  default: db_w4x4_y_r   <= 5'd0                ;
		endcase
    end 
	else if(state_i == OUT) begin 
        case(cnt_i[8])  
		    1'd0 : db_w4x4_y_r   <= {1'd0,cnt_i[7:4]    };// current y 
		    1'd1 : db_w4x4_y_r   <= {2'd0,cnt_i[5:3]    };// current u and v
		endcase
	end 
end 


assign   db_wen_o 	     =   db_wen_r 	     ;
assign   db_w4x4_x_o 	 =   db_w4x4_x_r 	 ;
assign   db_w4x4_y_o 	 =   db_w4x4_y_r 	 ;
assign   db_wprevious_o  =   db_wprevious_r  ;
assign   db_wdone_o      =   db_wdone_r      ;
assign   db_wsel_o       =   db_wsel_r       ;
assign   db_wdata_o 	 =   mb_db_data_o 	 ;

//***********************************************************************************************************************************************
//                                             
//     read top pixels             
//                                             
//***********************************************************************************************************************************************

wire	 [1-1:0] 	            db_ren_o    	     ; // db read enable 
wire	 [5-1:0] 	            db_r4x4_o 	         ; // db_read 4x4 block index 
wire	 [2-1:0] 	            db_ridx_o 	         ; // db read pixel index in the block 

reg 	                        db_ren_r 	         ; // db read pixel data
reg 	                        db_ren_d_r 	         ; // db read pixel data
reg 	 [16*`PIXEL_WIDTH-1:0] 	db_rdata_r 	         ; // db read pixel data

wire                            rom_top_load_en_w	 ; // load pixels to top lcu 
wire     [5-1:0]                rom_top_load_addr_w	 ; // load pixels to top lcu 

assign  db_ren_o  = !(mb_y_i&&state_i==LOAD && !cnt_i[8:7])         ;//mb_y && load state && 0...127 cycles   
assign  db_r4x4_o = cnt_i[6:2]                                      ;
assign  db_ridx_o = cnt_i[1:0]                                      ;

assign  rom_top_load_en_w  = db_ren_d_r || cnt_i[1:0]  ; 
assign  rom_top_load_addr_w= db_r4x4_o - 2'd1          ;

always@(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        db_ren_r   <=  1'd0     ;
        db_ren_d_r <=  1'd0     ;
		cnt_r      <=  7'd0     ;
	end 
	else begin  
        db_ren_r   <= db_ren_o  ;
        db_ren_d_r <= db_ren_r  ;
		cnt_r      <= cnt_i     ;
	end
end 

always@(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        db_rdata_r <=  128'd0     ;
	else if(!db_ren_r)begin 
        case(cnt_r[1:0])
	        2'd0:db_rdata_r  <={                   mb_db_data_i[127:96],96'd0};
	        2'd1:db_rdata_r  <={db_rdata_r[127:96],mb_db_data_i[ 95:64],64'd0};
            2'd2:db_rdata_r  <={db_rdata_r[127:64],mb_db_data_i[ 63:32],32'd0};
            2'd3:db_rdata_r  <={db_rdata_r[127:32],mb_db_data_i[ 31:0 ]      };
        endcase
    end
end 

assign      mb_db_ren_o    =   db_ren_o    	 ;
assign      mb_db_r4x4_o   =   db_r4x4_o 	 ;
assign      mb_db_ridx_o   =   db_ridx_o 	 ;

//***********************************************************************************************************************************************
//                                             
//    							tq Controller signals              
//                                             
//***********************************************************************************************************************************************

assign 		tq_ren_o  	   =   state_i != LOAD						;//low active
assign      is_ver_o	   =   state_i == CVER || state_i == YVER	;
assign      is_luma_o      =   state_i == YVER || state_i == YHOR   ;
assign      sao_data_end_o =   state_i == YHOR &&  cnt_i  == 9'd132 ;

/*		
always @* begin
	case(cnt_i[0])
		1'b0:tq_raddr_o[0] =  1'b0;  
		1'b1:tq_raddr_o[0] =  1'b1;
	 default:tq_raddr_o[0] =  1'b0;
	endcase
end

always @* begin
	case(cnt_i[4])
		1'b0:tq_raddr_o[1] =  1'b0;  
		1'b1:tq_raddr_o[1] =  1'b1;
	 default:tq_raddr_o[1] =  1'b0; 
    endcase	 
end

always @* begin
	case(cnt_i[1])
		1'b0:tq_raddr_o[2] =  1'b0;  
		1'b1:tq_raddr_o[2] =  1'b1;
	 default:tq_raddr_o[2] =  1'b0; 
	endcase
end

always @* begin
	case(cnt_i[5])
		1'b0:tq_raddr_o[3] =  1'b0;  
		1'b1:tq_raddr_o[3] =  1'b1;
	 default:tq_raddr_o[3] =  1'b0; 
	endcase
end

always @* begin
	case(cnt_i[2])
		1'b0:tq_raddr_o[4] =  1'b0;  
		1'b1:tq_raddr_o[4] =  1'b1;
	 default:tq_raddr_o[4] =  1'b0;  
	endcase
end

always @* begin
	case(cnt_i[6])
		1'b0:tq_raddr_o[5] =  1'b0;  
		1'b1:tq_raddr_o[5] =  1'b1;
	 default:tq_raddr_o[5] =  1'b0; 
	endcase
end

always @* begin
	case(cnt_i[3])
		1'b0:tq_raddr_o[6] =  1'b0;  
		1'b1:tq_raddr_o[6] =  1'b1;
	 default:tq_raddr_o[6] =  1'b0; 
	endcase
end

always @* begin
	case(cnt_i[7])
		1'b0:tq_raddr_o[7] =  1'b0;  
		1'b1:tq_raddr_o[7] =  1'b1;
	 default:tq_raddr_o[7] =  1'b0;  
	endcase 
end

always @* begin
	case(cnt_i[8])
		1'b0:tq_raddr_o[8] =  1'b0;  
		1'b1:tq_raddr_o[8] =  1'b1;
	 default:tq_raddr_o[8] =  1'b0; 
	endcase
end

*/


wire    [7:0]  tq_raddr_y_w        ;
wire    [8:0]  tq_raddr_u_w        ;

assign  {tq_raddr_y_w[7],tq_raddr_y_w[5],tq_raddr_y_w[3],tq_raddr_y_w[1]} = cnt_i[7:4]  ;
assign  {tq_raddr_y_w[6],tq_raddr_y_w[4],tq_raddr_y_w[2],tq_raddr_y_w[0]} = cnt_i[3:0]  ;

assign  {tq_raddr_u_w[5],tq_raddr_u_w[3],tq_raddr_u_w[1]} = cnt_i[5:3]  ;
assign  {tq_raddr_u_w[4],tq_raddr_u_w[2],tq_raddr_u_w[0]} = cnt_i[2:0]  ;

assign  tq_raddr_u_w[8:6] = cnt_i[8:6]                                  ;

always @* begin 
    if(cnt_i[8])   // uv
        tq_raddr_o  =  tq_raddr_u_w  ;
	else 
        tq_raddr_o  =  {1'b0,tq_raddr_y_w}  ;
end 

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		tq_raddr_r  <=   9'd0		;
	else 
	    tq_raddr_r  <=   tq_raddr_o	;
end		

//***********************************************************************************************************************************************
//                                             
//    	load controller :  bus to ram          
//                                             
//***********************************************************************************************************************************************
//0-383: ask data
//1-384: data in 

wire        rom0_load_en_w		;
wire        rom1_load_en_w		;


wire [7:0]  rom0_load_addr_w	;
wire [7:0]  rom1_load_addr_w	;


//0..255  :every 16 cycles 
//256..383:every  8 cycles 
assign rom0_load_en_w     = cnt_i[8] ? (cnt_i[3]?!cnt_i[0]: cnt_i[0]):(cnt_i[4]?!cnt_i[0]: cnt_i[0]);
assign rom1_load_en_w     = cnt_i[8] ? (cnt_i[3]? cnt_i[0]:!cnt_i[0]):(cnt_i[4]? cnt_i[0]:!cnt_i[0]);  

assign rom0_load_addr_w   = cnt_i[8:1] ;
assign rom1_load_addr_w   = cnt_i[8:1] ;

//***********************************************************************************************************************************************
//                                             
//    							ram0/1 Controller signals              
//                                             
//***********************************************************************************************************************************************
//read from  ram0/1   YVER    YHOR    CVER   CHOR     OUT
//cycles      		 0-127    0-127   0-63   0-63    0-383
wire       ram0_out_ren_w    			;// YVER p read enable
wire       ram1_out_ren_w    			;// YVER q read enable
wire [7:0] ram0_out_raddr_w	 			;// YVER p read address
wire [7:0] ram1_out_raddr_w	 			;// YVER q read address

wire       ram0_yver_ren_w    			;// YVER p read enable
wire       ram1_yver_ren_w    			;// YVER q read enable
wire [7:0] ram0_yver_raddr_w	 		;// YVER p read address
wire [7:0] ram1_yver_raddr_w	 		;// YVER q read address

wire       ram0_yhor_ren_w    			;// YHOR p read enable
wire       ram1_yhor_ren_w    			;// YHOR q read enable
reg  [7:0] ram0_yhor_raddr_r	 		;// YHOR p read address
reg  [7:0] ram1_yhor_raddr_r	 		;// YHOR q read address

wire       ram0_cver_ren_w	 			;// CHOR p read enable
wire       ram1_cver_ren_w	 			;// CHOR q read enable
wire [6:0] ram0_cver_raddr_w	   	 	;// CHOR p read address
wire [6:0] ram1_cver_raddr_w	   	 	;// CHOR q read address
  
wire 	   ram0_chor_ren_w	 			;// CHOR p read enable
wire 	   ram1_chor_ren_w	 			;// CHOR q read enable
reg  [7:0] ram0_chor_raddr_r	   	 	;// CHOR p read address
reg  [7:0] ram1_chor_raddr_r	   		;// CHOR q read address
//read for output:0-383 cycles 
assign     ram0_out_ren_w    =  cnt_i[8] ? (cnt_i[3]?!cnt_i[0]:  cnt_i[0]):(cnt_i[4]?!cnt_i[0]: cnt_i[0]);
assign     ram1_out_ren_w    =  cnt_i[8] ? (cnt_i[3]? cnt_i[0]:! cnt_i[0]):(cnt_i[4]? cnt_i[0]:!cnt_i[0]);

assign     ram0_out_raddr_w	=  cnt_i[8:1]		;
assign     ram1_out_raddr_w	=  cnt_i[8:1]		;
//read for yver:0-127 cycles 
//mb_x_i==0
//ram_y0/1 not for 0 8 16 24 32 40 48 56 64 72 80 88 96 104 112 120 
//mb_x_i != 0
//ram_y0   not for 8 24 40 56 72 88 104 120 
//ram_y1   not for 0 16 32 48 64 80 96  112  
assign 	   ram0_yver_ren_w   =  cnt_i[7] || (cnt_i[3:0]==4'b1000 &&mb_x_i)||!(cnt_i[2:0]||mb_x_i);
assign 	   ram1_yver_ren_w   =  cnt_i[7] || (cnt_i[3:0]==4'b0000 &&mb_x_i)||!(cnt_i[2:0]||mb_x_i);

assign     ram0_yver_raddr_w =  cnt_i[3] ? cnt_i[7:0]-1 : cnt_i[7:0]   ;
assign     ram1_yver_raddr_w =  cnt_i[3] ? cnt_i[7:0]   : cnt_i[7:0] -1;
//read for yhor:0-127 cycles 
//mb_y_i == 0
//ram_y0 not for 0 1 ... 14 15  ---> modified for SAO
//mb_y_i != 0
//ram_y0 not for 1 3 5 7 9 11 13 15
//ram_y1 not for 0 2 4 6 8 10 12 14
assign 	   ram0_yhor_ren_w   =   cnt_i[7]||(!cnt_i[6:4]&& cnt_i[0]);//&&mb_y_i)||(!cnt_i[6:4]&&!mb_y_i);
assign 	   ram1_yhor_ren_w   =   cnt_i[7]||(!cnt_i[6:4]&&!cnt_i[0]);//&&mb_y_i)||(!cnt_i[6:4]&&!mb_y_i);

always @* begin
	case (cnt_i[6:0])
		7'd0  :begin ram0_yhor_raddr_r = 'd0  ;ram1_yhor_raddr_r= 'd0  ;end 
		7'd1  :begin ram0_yhor_raddr_r = 'd0  ;ram1_yhor_raddr_r= 'd0  ;end    
		7'd2  :begin ram0_yhor_raddr_r = 'd1  ;ram1_yhor_raddr_r= 'd1  ;end    
		7'd3  :begin ram0_yhor_raddr_r = 'd1  ;ram1_yhor_raddr_r= 'd1  ;end     
		7'd4  :begin ram0_yhor_raddr_r = 'd2  ;ram1_yhor_raddr_r= 'd2  ;end    
		7'd5  :begin ram0_yhor_raddr_r = 'd2  ;ram1_yhor_raddr_r= 'd2  ;end    
		7'd6  :begin ram0_yhor_raddr_r = 'd3  ;ram1_yhor_raddr_r= 'd3  ;end    
		7'd7  :begin ram0_yhor_raddr_r = 'd3  ;ram1_yhor_raddr_r= 'd3  ;end    
		7'd8  :begin ram0_yhor_raddr_r = 'd4  ;ram1_yhor_raddr_r= 'd4  ;end    
		7'd9  :begin ram0_yhor_raddr_r = 'd4  ;ram1_yhor_raddr_r= 'd4  ;end    
		7'd10 :begin ram0_yhor_raddr_r = 'd5  ;ram1_yhor_raddr_r= 'd5  ;end     
		7'd11 :begin ram0_yhor_raddr_r = 'd5  ;ram1_yhor_raddr_r= 'd5  ;end     
		7'd12 :begin ram0_yhor_raddr_r = 'd6  ;ram1_yhor_raddr_r= 'd6  ;end     
		7'd13 :begin ram0_yhor_raddr_r = 'd6  ;ram1_yhor_raddr_r= 'd6  ;end     
		7'd14 :begin ram0_yhor_raddr_r = 'd7  ;ram1_yhor_raddr_r= 'd7  ;end     
		7'd15 :begin ram0_yhor_raddr_r = 'd7  ;ram1_yhor_raddr_r= 'd7  ;end     
		7'd16 :begin ram0_yhor_raddr_r = 'd16 ;ram1_yhor_raddr_r= 'd8  ;end     
		7'd17 :begin ram0_yhor_raddr_r = 'd8  ;ram1_yhor_raddr_r= 'd16 ;end     
		7'd18 :begin ram0_yhor_raddr_r = 'd17 ;ram1_yhor_raddr_r= 'd9  ;end    
		7'd19 :begin ram0_yhor_raddr_r = 'd9  ;ram1_yhor_raddr_r= 'd17 ;end     
		7'd20 :begin ram0_yhor_raddr_r = 'd18 ;ram1_yhor_raddr_r= 'd10 ;end     
		7'd21 :begin ram0_yhor_raddr_r = 'd10 ;ram1_yhor_raddr_r= 'd18 ;end     
		7'd22 :begin ram0_yhor_raddr_r = 'd19 ;ram1_yhor_raddr_r= 'd11 ;end     
		7'd23 :begin ram0_yhor_raddr_r = 'd11 ;ram1_yhor_raddr_r= 'd19 ;end     
		7'd24 :begin ram0_yhor_raddr_r = 'd20 ;ram1_yhor_raddr_r= 'd12 ;end     
		7'd25 :begin ram0_yhor_raddr_r = 'd12 ;ram1_yhor_raddr_r= 'd20 ;end     
		7'd26 :begin ram0_yhor_raddr_r = 'd21 ;ram1_yhor_raddr_r= 'd13 ;end     
		7'd27 :begin ram0_yhor_raddr_r = 'd13 ;ram1_yhor_raddr_r= 'd21 ;end    
		7'd28 :begin ram0_yhor_raddr_r = 'd22 ;ram1_yhor_raddr_r= 'd14 ;end     
		7'd29 :begin ram0_yhor_raddr_r = 'd14 ;ram1_yhor_raddr_r= 'd22 ;end     
		7'd30 :begin ram0_yhor_raddr_r = 'd23 ;ram1_yhor_raddr_r= 'd15 ;end     
		7'd31 :begin ram0_yhor_raddr_r = 'd15 ;ram1_yhor_raddr_r= 'd23 ;end     
		7'd32 :begin ram0_yhor_raddr_r = 'd32 ;ram1_yhor_raddr_r= 'd24 ;end     
		7'd33 :begin ram0_yhor_raddr_r = 'd24 ;ram1_yhor_raddr_r= 'd32 ;end     
		7'd34 :begin ram0_yhor_raddr_r = 'd33 ;ram1_yhor_raddr_r= 'd25 ;end     
		7'd35 :begin ram0_yhor_raddr_r = 'd25 ;ram1_yhor_raddr_r= 'd33 ;end     
		7'd36 :begin ram0_yhor_raddr_r = 'd34 ;ram1_yhor_raddr_r= 'd26 ;end    
		7'd37 :begin ram0_yhor_raddr_r = 'd26 ;ram1_yhor_raddr_r= 'd34 ;end     
		7'd38 :begin ram0_yhor_raddr_r = 'd35 ;ram1_yhor_raddr_r= 'd27 ;end     
		7'd39 :begin ram0_yhor_raddr_r = 'd27 ;ram1_yhor_raddr_r= 'd35 ;end     
		7'd40 :begin ram0_yhor_raddr_r = 'd36 ;ram1_yhor_raddr_r= 'd28 ;end     
		7'd41 :begin ram0_yhor_raddr_r = 'd28 ;ram1_yhor_raddr_r= 'd36 ;end     
		7'd42 :begin ram0_yhor_raddr_r = 'd37 ;ram1_yhor_raddr_r= 'd29 ;end     
		7'd43 :begin ram0_yhor_raddr_r = 'd29 ;ram1_yhor_raddr_r= 'd37 ;end     
		7'd44 :begin ram0_yhor_raddr_r = 'd38 ;ram1_yhor_raddr_r= 'd30 ;end     
		7'd45 :begin ram0_yhor_raddr_r = 'd30 ;ram1_yhor_raddr_r= 'd38 ;end    
		7'd46 :begin ram0_yhor_raddr_r = 'd39 ;ram1_yhor_raddr_r= 'd31 ;end     
		7'd47 :begin ram0_yhor_raddr_r = 'd31 ;ram1_yhor_raddr_r= 'd39 ;end     
		7'd48 :begin ram0_yhor_raddr_r = 'd48 ;ram1_yhor_raddr_r= 'd40 ;end     
		7'd49 :begin ram0_yhor_raddr_r = 'd40 ;ram1_yhor_raddr_r= 'd48 ;end     
		7'd50 :begin ram0_yhor_raddr_r = 'd49 ;ram1_yhor_raddr_r= 'd41 ;end     
		7'd51 :begin ram0_yhor_raddr_r = 'd41 ;ram1_yhor_raddr_r= 'd49 ;end     
		7'd52 :begin ram0_yhor_raddr_r = 'd50 ;ram1_yhor_raddr_r= 'd42 ;end     
		7'd53 :begin ram0_yhor_raddr_r = 'd42 ;ram1_yhor_raddr_r= 'd50 ;end     
		7'd54 :begin ram0_yhor_raddr_r = 'd51 ;ram1_yhor_raddr_r= 'd43 ;end    
		7'd55 :begin ram0_yhor_raddr_r = 'd43 ;ram1_yhor_raddr_r= 'd51 ;end     
		7'd56 :begin ram0_yhor_raddr_r = 'd52 ;ram1_yhor_raddr_r= 'd44 ;end     
		7'd57 :begin ram0_yhor_raddr_r = 'd44 ;ram1_yhor_raddr_r= 'd52 ;end     
		7'd58 :begin ram0_yhor_raddr_r = 'd53 ;ram1_yhor_raddr_r= 'd45 ;end     
		7'd59 :begin ram0_yhor_raddr_r = 'd45 ;ram1_yhor_raddr_r= 'd53 ;end     
		7'd60 :begin ram0_yhor_raddr_r = 'd54 ;ram1_yhor_raddr_r= 'd46 ;end     
		7'd61 :begin ram0_yhor_raddr_r = 'd46 ;ram1_yhor_raddr_r= 'd54 ;end     
		7'd62 :begin ram0_yhor_raddr_r = 'd55 ;ram1_yhor_raddr_r= 'd47 ;end     
		7'd63 :begin ram0_yhor_raddr_r = 'd47 ;ram1_yhor_raddr_r= 'd55 ;end    
        7'd64 :begin ram0_yhor_raddr_r = 'd64 ;ram1_yhor_raddr_r= 'd56 ;end    
		7'd65 :begin ram0_yhor_raddr_r = 'd56 ;ram1_yhor_raddr_r= 'd64 ;end    
		7'd66 :begin ram0_yhor_raddr_r = 'd65 ;ram1_yhor_raddr_r= 'd57 ;end    
		7'd67 :begin ram0_yhor_raddr_r = 'd57 ;ram1_yhor_raddr_r= 'd65 ;end    
		7'd68 :begin ram0_yhor_raddr_r = 'd66 ;ram1_yhor_raddr_r= 'd58 ;end    
		7'd69 :begin ram0_yhor_raddr_r = 'd58 ;ram1_yhor_raddr_r= 'd66 ;end    
		7'd70 :begin ram0_yhor_raddr_r = 'd67 ;ram1_yhor_raddr_r= 'd59 ;end     
		7'd71 :begin ram0_yhor_raddr_r = 'd59 ;ram1_yhor_raddr_r= 'd67 ;end     
		7'd72 :begin ram0_yhor_raddr_r = 'd68 ;ram1_yhor_raddr_r= 'd60 ;end     
		7'd73 :begin ram0_yhor_raddr_r = 'd60 ;ram1_yhor_raddr_r= 'd68 ;end     
		7'd74 :begin ram0_yhor_raddr_r = 'd69 ;ram1_yhor_raddr_r= 'd61 ;end     
		7'd75 :begin ram0_yhor_raddr_r = 'd61 ;ram1_yhor_raddr_r= 'd69 ;end     
		7'd76 :begin ram0_yhor_raddr_r = 'd70 ;ram1_yhor_raddr_r= 'd62 ;end     
		7'd77 :begin ram0_yhor_raddr_r = 'd62 ;ram1_yhor_raddr_r= 'd70 ;end     
		7'd78 :begin ram0_yhor_raddr_r = 'd71 ;ram1_yhor_raddr_r= 'd63 ;end    
		7'd79 :begin ram0_yhor_raddr_r = 'd63 ;ram1_yhor_raddr_r= 'd71 ;end     
		7'd80 :begin ram0_yhor_raddr_r = 'd80 ;ram1_yhor_raddr_r= 'd72 ;end     
		7'd81 :begin ram0_yhor_raddr_r = 'd72 ;ram1_yhor_raddr_r= 'd80 ;end     
		7'd82 :begin ram0_yhor_raddr_r = 'd81 ;ram1_yhor_raddr_r= 'd73 ;end     
		7'd83 :begin ram0_yhor_raddr_r = 'd73 ;ram1_yhor_raddr_r= 'd81 ;end     
		7'd84 :begin ram0_yhor_raddr_r = 'd82 ;ram1_yhor_raddr_r= 'd74 ;end     
		7'd85 :begin ram0_yhor_raddr_r = 'd74 ;ram1_yhor_raddr_r= 'd82 ;end     
		7'd86 :begin ram0_yhor_raddr_r = 'd83 ;ram1_yhor_raddr_r= 'd75 ;end     
		7'd87 :begin ram0_yhor_raddr_r = 'd75 ;ram1_yhor_raddr_r= 'd83 ;end    
		7'd88 :begin ram0_yhor_raddr_r = 'd84 ;ram1_yhor_raddr_r= 'd76 ;end     
		7'd89 :begin ram0_yhor_raddr_r = 'd76 ;ram1_yhor_raddr_r= 'd84 ;end     
		7'd90 :begin ram0_yhor_raddr_r = 'd85 ;ram1_yhor_raddr_r= 'd77 ;end     
		7'd91 :begin ram0_yhor_raddr_r = 'd77 ;ram1_yhor_raddr_r= 'd85 ;end     
		7'd92 :begin ram0_yhor_raddr_r = 'd86 ;ram1_yhor_raddr_r= 'd78 ;end     
		7'd93 :begin ram0_yhor_raddr_r = 'd78 ;ram1_yhor_raddr_r= 'd86 ;end     
		7'd94 :begin ram0_yhor_raddr_r = 'd87 ;ram1_yhor_raddr_r= 'd79 ;end     
		7'd95 :begin ram0_yhor_raddr_r = 'd79 ;ram1_yhor_raddr_r= 'd87 ;end     
		7'd96 :begin ram0_yhor_raddr_r = 'd96 ;ram1_yhor_raddr_r= 'd88 ;end    
		7'd97 :begin ram0_yhor_raddr_r = 'd88 ;ram1_yhor_raddr_r= 'd96 ;end     
		7'd98 :begin ram0_yhor_raddr_r = 'd97 ;ram1_yhor_raddr_r= 'd89 ;end     
		7'd99 :begin ram0_yhor_raddr_r = 'd89 ;ram1_yhor_raddr_r= 'd97 ;end     
		7'd100:begin ram0_yhor_raddr_r = 'd98 ;ram1_yhor_raddr_r= 'd90 ;end     
		7'd101:begin ram0_yhor_raddr_r = 'd90 ;ram1_yhor_raddr_r= 'd98 ;end     
		7'd102:begin ram0_yhor_raddr_r = 'd99 ;ram1_yhor_raddr_r= 'd91 ;end     
		7'd103:begin ram0_yhor_raddr_r = 'd91 ;ram1_yhor_raddr_r= 'd99 ;end     
		7'd104:begin ram0_yhor_raddr_r = 'd100;ram1_yhor_raddr_r= 'd92 ;end     
		7'd105:begin ram0_yhor_raddr_r = 'd92 ;ram1_yhor_raddr_r= 'd100;end    
		7'd106:begin ram0_yhor_raddr_r = 'd101;ram1_yhor_raddr_r= 'd93 ;end     
		7'd107:begin ram0_yhor_raddr_r = 'd93 ;ram1_yhor_raddr_r= 'd101;end     
		7'd108:begin ram0_yhor_raddr_r = 'd102;ram1_yhor_raddr_r= 'd94 ;end     
		7'd109:begin ram0_yhor_raddr_r = 'd94 ;ram1_yhor_raddr_r= 'd102;end     
		7'd110:begin ram0_yhor_raddr_r = 'd103;ram1_yhor_raddr_r= 'd95 ;end     
		7'd111:begin ram0_yhor_raddr_r = 'd95 ;ram1_yhor_raddr_r= 'd103;end     
		7'd112:begin ram0_yhor_raddr_r = 'd112;ram1_yhor_raddr_r= 'd104;end     
		7'd113:begin ram0_yhor_raddr_r = 'd104;ram1_yhor_raddr_r= 'd112;end     
		7'd114:begin ram0_yhor_raddr_r = 'd113;ram1_yhor_raddr_r= 'd105;end    
		7'd115:begin ram0_yhor_raddr_r = 'd105;ram1_yhor_raddr_r= 'd113;end     
		7'd116:begin ram0_yhor_raddr_r = 'd114;ram1_yhor_raddr_r= 'd106;end     
		7'd117:begin ram0_yhor_raddr_r = 'd106;ram1_yhor_raddr_r= 'd114;end     
		7'd118:begin ram0_yhor_raddr_r = 'd115;ram1_yhor_raddr_r= 'd107;end     
		7'd119:begin ram0_yhor_raddr_r = 'd107;ram1_yhor_raddr_r= 'd115;end     
		7'd120:begin ram0_yhor_raddr_r = 'd116;ram1_yhor_raddr_r= 'd108;end     
		7'd121:begin ram0_yhor_raddr_r = 'd108;ram1_yhor_raddr_r= 'd116;end     
		7'd122:begin ram0_yhor_raddr_r = 'd117;ram1_yhor_raddr_r= 'd109;end     
		7'd123:begin ram0_yhor_raddr_r = 'd109;ram1_yhor_raddr_r= 'd117;end     
		7'd124:begin ram0_yhor_raddr_r = 'd118;ram1_yhor_raddr_r= 'd110;end    
		7'd125:begin ram0_yhor_raddr_r = 'd110;ram1_yhor_raddr_r= 'd118;end     
		7'd126:begin ram0_yhor_raddr_r = 'd119;ram1_yhor_raddr_r= 'd111;end     
		7'd127:begin ram0_yhor_raddr_r = 'd111;ram1_yhor_raddr_r= 'd119;end     		
	   default:begin ram0_yhor_raddr_r = 'd0  ;ram1_yhor_raddr_r= 'd0  ;end     
	endcase
end
//read for cver	
//mb_x_i != 0:  
//c0 : 0--63 but not  4 12 20 28 36 44 52 60 
//c1 : 0--63 but not  0  8 16 24 32 40 48 56  
//mb_x_i == 0:  
// c0/c1:0-63 but not 0 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 

assign     ram0_cver_ren_w   = (cnt_i[7:6])||(cnt_i[2:0]==3'b100&&mb_x_i)||(cnt_i[1:0]==2'b00&&!mb_x_i);
assign     ram1_cver_ren_w   = (cnt_i[7:6])||(cnt_i[2:0]==3'b000&&mb_x_i)||(cnt_i[1:0]==2'b00&&!mb_x_i);

assign     ram0_cver_raddr_w = cnt_i[2] ? cnt_i[6:0] -1: cnt_i[6:0]	;
assign     ram1_cver_raddr_w = cnt_i[2] ? cnt_i[6:0]   : cnt_i[6:0] -1	;

//read for chor 
//mb_y_i !=0 
//c0	:  0--63 but not 1 3 5 7  33 35 37 39
//c1    :  0--63 but not 0 2 4 6  32 34 36 38
//mb_y_i ==0
//c0	:  0--63 but not 0 1 ... 6 7  32 33 ... 38 39
//c1	:  0--63 but not 0 1 ... 6 7  32 33 ... 38 39
assign     ram0_chor_ren_w	 = (cnt_i[7:6])||((!cnt_i[4:3])&& cnt_i[0]&&mb_y_i)||((!cnt_i[4:3])&&!mb_y_i);	
assign     ram1_chor_ren_w	 = (cnt_i[7:6])||((!cnt_i[4:3])&&!cnt_i[0]&&mb_y_i)||((!cnt_i[4:3])&&!mb_y_i);						   

always @* begin
	case (cnt_i[5:0])
		6'd0  :begin ram0_chor_raddr_r = {1'd1,7'd0 };ram1_chor_raddr_r={1'd1,7'd0 };end 
		6'd1  :begin ram0_chor_raddr_r = {1'd1,7'd0 };ram1_chor_raddr_r={1'd1,7'd0 };end    
		6'd2  :begin ram0_chor_raddr_r = {1'd1,7'd1 };ram1_chor_raddr_r={1'd1,7'd1 };end    
		6'd3  :begin ram0_chor_raddr_r = {1'd1,7'd1 };ram1_chor_raddr_r={1'd1,7'd1 };end     
		6'd4  :begin ram0_chor_raddr_r = {1'd1,7'd2 };ram1_chor_raddr_r={1'd1,7'd2 };end    
		6'd5  :begin ram0_chor_raddr_r = {1'd1,7'd2 };ram1_chor_raddr_r={1'd1,7'd2 };end    
		6'd6  :begin ram0_chor_raddr_r = {1'd1,7'd3 };ram1_chor_raddr_r={1'd1,7'd3 };end    
		6'd7  :begin ram0_chor_raddr_r = {1'd1,7'd3 };ram1_chor_raddr_r={1'd1,7'd3 };end    
		6'd8  :begin ram0_chor_raddr_r = {1'd1,7'd8 };ram1_chor_raddr_r={1'd1,7'd4 };end    
		6'd9  :begin ram0_chor_raddr_r = {1'd1,7'd4 };ram1_chor_raddr_r={1'd1,7'd8 };end    
		6'd10 :begin ram0_chor_raddr_r = {1'd1,7'd9 };ram1_chor_raddr_r={1'd1,7'd5 };end     
		6'd11 :begin ram0_chor_raddr_r = {1'd1,7'd5 };ram1_chor_raddr_r={1'd1,7'd9 };end     
		6'd12 :begin ram0_chor_raddr_r = {1'd1,7'd10};ram1_chor_raddr_r={1'd1,7'd6 };end     
		6'd13 :begin ram0_chor_raddr_r = {1'd1,7'd6 };ram1_chor_raddr_r={1'd1,7'd10};end     
		6'd14 :begin ram0_chor_raddr_r = {1'd1,7'd11};ram1_chor_raddr_r={1'd1,7'd7 };end     
		6'd15 :begin ram0_chor_raddr_r = {1'd1,7'd7 };ram1_chor_raddr_r={1'd1,7'd11};end     
		6'd16 :begin ram0_chor_raddr_r = {1'd1,7'd16};ram1_chor_raddr_r={1'd1,7'd12};end     
		6'd17 :begin ram0_chor_raddr_r = {1'd1,7'd12};ram1_chor_raddr_r={1'd1,7'd16};end     
		6'd18 :begin ram0_chor_raddr_r = {1'd1,7'd17};ram1_chor_raddr_r={1'd1,7'd13};end    
		6'd19 :begin ram0_chor_raddr_r = {1'd1,7'd13};ram1_chor_raddr_r={1'd1,7'd17};end     
		6'd20 :begin ram0_chor_raddr_r = {1'd1,7'd18};ram1_chor_raddr_r={1'd1,7'd14};end     
		6'd21 :begin ram0_chor_raddr_r = {1'd1,7'd14};ram1_chor_raddr_r={1'd1,7'd18};end     
		6'd22 :begin ram0_chor_raddr_r = {1'd1,7'd19};ram1_chor_raddr_r={1'd1,7'd15};end     
		6'd23 :begin ram0_chor_raddr_r = {1'd1,7'd15};ram1_chor_raddr_r={1'd1,7'd19};end     
		6'd24 :begin ram0_chor_raddr_r = {1'd1,7'd24};ram1_chor_raddr_r={1'd1,7'd20};end     
		6'd25 :begin ram0_chor_raddr_r = {1'd1,7'd20};ram1_chor_raddr_r={1'd1,7'd24};end     
		6'd26 :begin ram0_chor_raddr_r = {1'd1,7'd25};ram1_chor_raddr_r={1'd1,7'd21};end     
		6'd27 :begin ram0_chor_raddr_r = {1'd1,7'd21};ram1_chor_raddr_r={1'd1,7'd25};end    
		6'd28 :begin ram0_chor_raddr_r = {1'd1,7'd26};ram1_chor_raddr_r={1'd1,7'd22};end     
		6'd29 :begin ram0_chor_raddr_r = {1'd1,7'd22};ram1_chor_raddr_r={1'd1,7'd26};end     
		6'd30 :begin ram0_chor_raddr_r = {1'd1,7'd27};ram1_chor_raddr_r={1'd1,7'd23};end     
		6'd31 :begin ram0_chor_raddr_r = {1'd1,7'd23};ram1_chor_raddr_r={1'd1,7'd27};end     
		6'd32 :begin ram0_chor_raddr_r = {1'd1,7'd32};ram1_chor_raddr_r={1'd1,7'd32};end     
		6'd33 :begin ram0_chor_raddr_r = {1'd1,7'd32};ram1_chor_raddr_r={1'd1,7'd32};end     
		6'd34 :begin ram0_chor_raddr_r = {1'd1,7'd33};ram1_chor_raddr_r={1'd1,7'd33};end     
		6'd35 :begin ram0_chor_raddr_r = {1'd1,7'd33};ram1_chor_raddr_r={1'd1,7'd33};end     
		6'd36 :begin ram0_chor_raddr_r = {1'd1,7'd34};ram1_chor_raddr_r={1'd1,7'd34};end    
		6'd37 :begin ram0_chor_raddr_r = {1'd1,7'd34};ram1_chor_raddr_r={1'd1,7'd34};end     
		6'd38 :begin ram0_chor_raddr_r = {1'd1,7'd35};ram1_chor_raddr_r={1'd1,7'd35};end     
		6'd39 :begin ram0_chor_raddr_r = {1'd1,7'd35};ram1_chor_raddr_r={1'd1,7'd35};end     
		6'd40 :begin ram0_chor_raddr_r = {1'd1,7'd40};ram1_chor_raddr_r={1'd1,7'd36};end     
		6'd41 :begin ram0_chor_raddr_r = {1'd1,7'd36};ram1_chor_raddr_r={1'd1,7'd40};end     
		6'd42 :begin ram0_chor_raddr_r = {1'd1,7'd41};ram1_chor_raddr_r={1'd1,7'd37};end     
		6'd43 :begin ram0_chor_raddr_r = {1'd1,7'd37};ram1_chor_raddr_r={1'd1,7'd41};end     
		6'd44 :begin ram0_chor_raddr_r = {1'd1,7'd42};ram1_chor_raddr_r={1'd1,7'd38};end     
		6'd45 :begin ram0_chor_raddr_r = {1'd1,7'd38};ram1_chor_raddr_r={1'd1,7'd42};end    
		6'd46 :begin ram0_chor_raddr_r = {1'd1,7'd43};ram1_chor_raddr_r={1'd1,7'd39};end     
		6'd47 :begin ram0_chor_raddr_r = {1'd1,7'd39};ram1_chor_raddr_r={1'd1,7'd43};end     
		6'd48 :begin ram0_chor_raddr_r = {1'd1,7'd48};ram1_chor_raddr_r={1'd1,7'd44};end     
		6'd49 :begin ram0_chor_raddr_r = {1'd1,7'd44};ram1_chor_raddr_r={1'd1,7'd48};end     
		6'd50 :begin ram0_chor_raddr_r = {1'd1,7'd49};ram1_chor_raddr_r={1'd1,7'd45};end     
		6'd51 :begin ram0_chor_raddr_r = {1'd1,7'd45};ram1_chor_raddr_r={1'd1,7'd49};end     
		6'd52 :begin ram0_chor_raddr_r = {1'd1,7'd50};ram1_chor_raddr_r={1'd1,7'd46};end     
		6'd53 :begin ram0_chor_raddr_r = {1'd1,7'd46};ram1_chor_raddr_r={1'd1,7'd50};end     
		6'd54 :begin ram0_chor_raddr_r = {1'd1,7'd51};ram1_chor_raddr_r={1'd1,7'd47};end    
		6'd55 :begin ram0_chor_raddr_r = {1'd1,7'd47};ram1_chor_raddr_r={1'd1,7'd51};end     
		6'd56 :begin ram0_chor_raddr_r = {1'd1,7'd56};ram1_chor_raddr_r={1'd1,7'd52};end     
		6'd57 :begin ram0_chor_raddr_r = {1'd1,7'd52};ram1_chor_raddr_r={1'd1,7'd56};end     
		6'd58 :begin ram0_chor_raddr_r = {1'd1,7'd57};ram1_chor_raddr_r={1'd1,7'd53};end     
		6'd59 :begin ram0_chor_raddr_r = {1'd1,7'd53};ram1_chor_raddr_r={1'd1,7'd57};end     
		6'd60 :begin ram0_chor_raddr_r = {1'd1,7'd58};ram1_chor_raddr_r={1'd1,7'd54};end     
		6'd61 :begin ram0_chor_raddr_r = {1'd1,7'd54};ram1_chor_raddr_r={1'd1,7'd58};end     
		6'd62 :begin ram0_chor_raddr_r = {1'd1,7'd59};ram1_chor_raddr_r={1'd1,7'd55};end     
		6'd63 :begin ram0_chor_raddr_r = {1'd1,7'd55};ram1_chor_raddr_r={1'd1,7'd59};end     
	   default:begin ram0_chor_raddr_r = {1'd1,7'd0 };ram1_chor_raddr_r={1'd1,7'd0 };end     
	endcase
end


//***********************************************************************************************************************************************
//                                             
//    							ram_left controller signals              
//                                             
//***********************************************************************************************************************************************
//read from ram_left    YVER     YHOR    CVER   CHOR     OUTLT		
//cycles   			   0:8:127 128-135  0:4:63  64-71    0-31   						   
wire   	             ram_l0_out_ren_w	    ;
wire   	             ram_l1_out_ren_w	    ;
wire    [3:0]        ram_l0_out_raddr_w	    ;
wire    [3:0]        ram_l1_out_raddr_w	    ;

wire    	         ram_l0_cver_ren_w	    ;
wire    	         ram_l1_cver_ren_w	    ;
reg    [3:0]         ram_l0_cver_raddr_r	;
reg    [3:0]         ram_l1_cver_raddr_r	;

reg    	         	 ram_l0_chor_ren_r	    ;
reg    	         	 ram_l1_chor_ren_r	    ;
reg     [3:0]        ram_l0_chor_raddr_r	;
reg     [3:0]        ram_l1_chor_raddr_r	;

wire    	         ram_l0_yver_ren_w	    ;
wire    	         ram_l1_yver_ren_w	    ;
wire    [3:0]        ram_l0_yver_raddr_w	;
wire    [3:0]        ram_l1_yver_raddr_w	;

reg	    	         ram_l0_yhor_ren_r	    ;
reg	    	         ram_l1_yhor_ren_r	    ;
reg     [3:0]        ram_l0_yhor_raddr_r	;
reg     [3:0]        ram_l1_yhor_raddr_r	;

wire    	         ram_l0_load_ren_w	    ;
wire    	         ram_l1_load_ren_w	    ;
reg     [3:0]        ram_l0_load_raddr_r	;
reg     [3:0]        ram_l1_load_raddr_r	;

//read for output 0-31
assign ram_l0_out_ren_w   = cnt_i[5]|| cnt_i[0];
assign ram_l1_out_ren_w   = cnt_i[5]||!cnt_i[0];

assign ram_l0_out_raddr_w =  cnt_i[4:1] ; 
assign ram_l1_out_raddr_w =  cnt_i[4:1] ; 
//read for cver   0:4:63  
//mb_x_i != 0  
//rom_l0 :0  8  16  24  32  40  48  56  cnt_i[2:0] =000
//rom_l1 :4 12  20  28  36  44  52  60  cnt_i[2:0] =100
//mb_x_i == 0
//rom_l0 :0  4  8 ... 52 56 60  cnt_i[1:0] =00
//rom_l1 :0  4  8 ... 52 56 60  cnt_i[1:0] =00
assign ram_l0_cver_ren_w  =  cnt_i[6]|| (cnt_i[2:0]           &&mb_x_i)||(cnt_i[1:0]&&!mb_x_i);
assign ram_l1_cver_ren_w  =  cnt_i[6]|| (cnt_i[1:0]||!cnt_i[2]&&mb_x_i)||(cnt_i[1:0]&&!mb_x_i);

always @*  begin
    case(cnt_i[5:0])//0--63 cycles
		6'd0 :ram_l0_cver_raddr_r =  4'd8 ;
		6'd8 :ram_l0_cver_raddr_r =  4'd9 ;
		6'd16:ram_l0_cver_raddr_r =  4'd10;
		6'd24:ram_l0_cver_raddr_r =  4'd11;
		6'd32:ram_l0_cver_raddr_r =  4'd12;
		6'd40:ram_l0_cver_raddr_r =  4'd13;
		6'd48:ram_l0_cver_raddr_r =  4'd14;
		6'd56:ram_l0_cver_raddr_r =  4'd15;
	  default:ram_l0_cver_raddr_r =  4'd0 ;
    endcase
end

always @*  begin
    case(cnt_i[5:0])//0--63 cycles
		6'd4 :ram_l1_cver_raddr_r =  4'd8 ;
		6'd12:ram_l1_cver_raddr_r =  4'd9 ;
		6'd20:ram_l1_cver_raddr_r =  4'd10;
		6'd28:ram_l1_cver_raddr_r =  4'd11;
		6'd36:ram_l1_cver_raddr_r =  4'd12;
		6'd44:ram_l1_cver_raddr_r =  4'd13;
		6'd52:ram_l1_cver_raddr_r =  4'd14;
		6'd60:ram_l1_cver_raddr_r =  4'd15;
	  default:ram_l1_cver_raddr_r =  4'd0 ;
    endcase
end

//read for cb&cr hor:64-71 cycles
always @*  begin
    case(cnt_i[6:0])//0--63 cycles
		7'd64:begin ram_l0_chor_ren_r = !mb_x_i;ram_l0_chor_raddr_r = 4'd8 ;end
		7'd65:begin ram_l0_chor_ren_r = !mb_x_i;ram_l0_chor_raddr_r = 4'd9 ;end
		7'd66:begin ram_l0_chor_ren_r = !mb_x_i;ram_l0_chor_raddr_r = 4'd10;end
		7'd67:begin ram_l0_chor_ren_r = !mb_x_i;ram_l0_chor_raddr_r = 4'd11;end
		7'd68:begin ram_l0_chor_ren_r = !mb_x_i;ram_l0_chor_raddr_r = 4'd12;end
		7'd69:begin ram_l0_chor_ren_r = !mb_x_i;ram_l0_chor_raddr_r = 4'd13;end
		7'd70:begin ram_l0_chor_ren_r = !mb_x_i;ram_l0_chor_raddr_r = 4'd14;end
		7'd71:begin ram_l0_chor_ren_r = !mb_x_i;ram_l0_chor_raddr_r = 4'd15;end
	  default:begin ram_l0_chor_ren_r = 1'b1   ;ram_l0_chor_raddr_r = 4'd0 ;end
    endcase
end

always @*  begin
    case(cnt_i[6:0])//0--63 cycles
		7'd65:begin ram_l1_chor_ren_r = !mb_x_i;ram_l1_chor_raddr_r = 4'd8 ;end
		7'd66:begin ram_l1_chor_ren_r = !mb_x_i;ram_l1_chor_raddr_r = 4'd9 ;end
		7'd67:begin ram_l1_chor_ren_r = !mb_x_i;ram_l1_chor_raddr_r = 4'd10;end
		7'd69:begin ram_l1_chor_ren_r = !mb_x_i;ram_l1_chor_raddr_r = 4'd12;end
		7'd70:begin ram_l1_chor_ren_r = !mb_x_i;ram_l1_chor_raddr_r = 4'd13;end
		7'd71:begin ram_l1_chor_ren_r = !mb_x_i;ram_l1_chor_raddr_r = 4'd14;end
	  default:begin ram_l1_chor_ren_r = 1'b1   ;ram_l1_chor_raddr_r = 4'd0 ;end
    endcase
end
//read for y ver:0:8:127
//mb_x_i !=0 
//rom_l0 :0 16 32 48 64 80  96 112
//rom_l1 :8 24 40 56 72 88 104 120
//mb_x_i == 0
//rom_l0 :

assign ram_l0_yver_ren_w  = (cnt_i[7]||cnt_i[3:0]!=4'b0000)||!mb_x_i;//||(cnt_i[2:0]!=3'b000&&mb_x_i);
assign ram_l1_yver_ren_w  = (cnt_i[7]||cnt_i[3:0]!=4'b1000)||!mb_x_i;//||(cnt_i[2:0]!=3'b000&&mb_x_i);

assign ram_l0_yver_raddr_w={1'b0,cnt_i[6:4]};
assign ram_l1_yver_raddr_w={1'b0,cnt_i[6:4]};
//read for y hor:128-135
always @*  begin
    case(cnt_i[7:0])//0--63 cycles
		8'd128:begin ram_l0_yhor_ren_r = !mb_x_i;ram_l0_yhor_raddr_r = 4'd0;end
		8'd129:begin ram_l0_yhor_ren_r = !mb_x_i;ram_l0_yhor_raddr_r = 4'd1;end
		8'd130:begin ram_l0_yhor_ren_r = !mb_x_i;ram_l0_yhor_raddr_r = 4'd2;end
		8'd131:begin ram_l0_yhor_ren_r = !mb_x_i;ram_l0_yhor_raddr_r = 4'd3;end
		8'd132:begin ram_l0_yhor_ren_r = !mb_x_i;ram_l0_yhor_raddr_r = 4'd4;end
		8'd133:begin ram_l0_yhor_ren_r = !mb_x_i;ram_l0_yhor_raddr_r = 4'd5;end
		8'd134:begin ram_l0_yhor_ren_r = !mb_x_i;ram_l0_yhor_raddr_r = 4'd6;end
		8'd135:begin ram_l0_yhor_ren_r = !mb_x_i;ram_l0_yhor_raddr_r = 4'd7;end
	   default:begin ram_l0_yhor_ren_r = 1'b1   ;ram_l0_yhor_raddr_r = 4'd0;end
    endcase
end

always @*  begin
    case(cnt_i[7:0])//0--63 cycles
		8'd129:begin ram_l1_yhor_ren_r = !mb_x_i;ram_l1_yhor_raddr_r = 4'd0;end
		8'd130:begin ram_l1_yhor_ren_r = !mb_x_i;ram_l1_yhor_raddr_r = 4'd1;end
		8'd131:begin ram_l1_yhor_ren_r = !mb_x_i;ram_l1_yhor_raddr_r = 4'd2;end
		8'd132:begin ram_l1_yhor_ren_r = !mb_x_i;ram_l1_yhor_raddr_r = 4'd3;end
		8'd133:begin ram_l1_yhor_ren_r = !mb_x_i;ram_l1_yhor_raddr_r = 4'd4;end
		8'd134:begin ram_l1_yhor_ren_r = !mb_x_i;ram_l1_yhor_raddr_r = 4'd5;end
		8'd135:begin ram_l1_yhor_ren_r = !mb_x_i;ram_l1_yhor_raddr_r = 4'd6;end	 
	   default:begin ram_l1_yhor_ren_r = 1'b1   ;ram_l1_yhor_raddr_r = 4'd0;end
    endcase
end

//update left rom0/1
//rom0 16 48 80 112 144 176 208 240 | 264 280 296 312 328 344 360 376
//rom1 32 64 96 128 160 192 224 256 | 272 288 304 320 336 352 368 384
assign ram_l0_load_ren_w  =(!(cnt_i[8]|| cnt_i[4:0]==5'b10000))||(cnt_i[8]&&cnt_i[3:0]!=4'b1000);
assign ram_l1_load_ren_w  =(!(cnt_i[8]|| cnt_i[4:0]==5'b00000))||(cnt_i[8]&&cnt_i[3:0]!=4'b0000);

always @ *begin
    case(cnt_i[8])
		1'b0: ram_l0_load_raddr_r= {1'b0,cnt_i[7:5]}; //  0-255/32
		1'b1: ram_l0_load_raddr_r= {1'b1,cnt_i[6:4]}; //  8+(0-127/16)
	endcase
end

always @ *begin
    case(cnt_i[8])
		1'b0: ram_l1_load_raddr_r= {1'b0,cnt_i[7:5]}; //  0-255/16
		1'b1: ram_l1_load_raddr_r= {1'b1,cnt_i[6:4]}; //  8+(0-127/32)
	endcase
end


//***********************************************************************************************************************************************
//                                             
//    							ram_top controller signals              
//                                             
//***********************************************************************************************************************************************
//read from ram_l    YHOR      CHOR       OUTLT		
//cycles   			    0-15   0-7&32-39     32-63
wire   	             ram_top_out_ren_w	   			;
wire    [4:0]        ram_top_out_raddr_w	    	;
  
wire    	         ram_top_yhor_ren_w				;
wire    [4:0]        ram_top_yhor_raddr_w			;
  
wire    	         ram_top_chor_ren_w	    		;
wire    [4:0]        ram_top_chor_raddr_w	    	;
  
//read for output 32-63
assign ram_top_out_ren_w   = cnt_i[7:6]||!cnt_i[7:5]  ;
assign ram_top_out_raddr_w = cnt_i[4:0]				  ;
//read for YHOR 0-15
assign ram_top_yhor_ren_w  = (!mb_y_i)||cnt_i[7:4]    ;
assign ram_top_yhor_raddr_w= cnt_i[4:0]				  ;

//read for CHOR 0-7&32-39
assign ram_top_chor_ren_w  = mb_y_i&&cnt_i[6]||cnt_i[4:3];
assign ram_top_chor_raddr_w={1'b1,cnt_i[5],cnt_i[2:0]}   ;


//***********************************************************************************************************************************************
//                                             
//    		enable signals and controller signals delay             
//                                             
//***********************************************************************************************************************************************
//delay 1 cycles 
reg  				rom0_renb_r_d1      		;
reg  				rom1_renb_r_d1      		;

reg  [7:0] 		  	rom0_addrb_r_d1     		;
reg  [7:0] 		  	rom1_addrb_r_d1     		;

reg  				rom_l0_renb_r_d1    		;
reg 				rom_l1_renb_r_d1    		;
reg  [3:0] 		  	rom_l0_addrb_r_d1			; 
reg  [3:0] 		  	rom_l1_addrb_r_d1			; 

reg  				rom_top_renb_r_d1   		;
reg  [4:0] 		  	rom_top_addrb_r_d1  		;
//delay 2 cycles		
reg  				rom0_renb_r_d2      		;
reg  				rom1_renb_r_d2      		;

reg  [7:0] 		  	rom0_addrb_r_d2     		;
reg  [7:0] 		  	rom1_addrb_r_d2     		;

reg  				rom_l0_renb_r_d2    		;
reg 				rom_l1_renb_r_d2    		;
reg  [3:0] 		  	rom_l0_addrb_r_d2			; 
reg  [3:0] 		  	rom_l1_addrb_r_d2			; 

reg  				rom_top_renb_r_d2   		;
reg  [4:0] 		  	rom_top_addrb_r_d2  		;
//delay 3 cycles
// enable  :3 cycles
// address :3 cycles
 
reg  [7:0] 		  	rom0_addrb_r_d3     		;
reg  [7:0] 		  	rom1_addrb_r_d3     		;

reg                 rom_l0_renb_r_d3			;
reg                 rom_l1_renb_r_d3			;
reg  [3:0] 		  	rom_l0_addrb_r_d3			; 
reg  [3:0] 		  	rom_l1_addrb_r_d3			; 

reg  [4:0] 		  	rom_top_addrb_r_d3  		;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
	    rom0_renb_r_d1     <=  1'b1   			;
        rom1_renb_r_d1     <=  1'b1   			;
        rom0_addrb_r_d1    <=  8'b0	  			;
        rom1_addrb_r_d1    <=  8'b0	  			;
        rom_l0_renb_r_d1   <=  1'b1				;
        rom_l1_renb_r_d1   <=  1'b1				;
        rom_l0_addrb_r_d1  <=  4'b0				;
        rom_l1_addrb_r_d1  <=  4'b0				;
        rom_top_renb_r_d1  <=  1'b1				;
        rom_top_addrb_r_d1 <=  5'b0				;
    end
	else  begin
		rom0_renb_r_d1     <=  rom0_renb_r      ;
        rom1_renb_r_d1     <=  rom1_renb_r      ;
	    rom0_addrb_r_d1    <=  rom0_addrb_r     ;
	    rom1_addrb_r_d1    <=  rom1_addrb_r     ;
	    rom_l0_renb_r_d1   <=  rom_l0_renb_r    ;
	    rom_l1_renb_r_d1   <=  rom_l1_renb_r    ;
	    rom_l0_addrb_r_d1  <=  rom_l0_addrb_r   ;
	    rom_l1_addrb_r_d1  <=  rom_l1_addrb_r   ;
	    rom_top_renb_r_d1  <=  rom_top_renb_r   ;
	    rom_top_addrb_r_d1 <=  rom_top_addrb_r  ;
    end
end


always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
	    rom0_renb_r_d2     <=  1'b1   			;
        rom1_renb_r_d2     <=  1'b1   			;
        rom0_addrb_r_d2    <=  8'b0	  			;
        rom1_addrb_r_d2    <=  8'b0	  			;
        rom_l0_renb_r_d2   <=  1'b1				;
        rom_l1_renb_r_d2   <=  1'b1				;
        rom_l0_addrb_r_d2  <=  4'b0				;
        rom_l1_addrb_r_d2  <=  4'b0				;
        rom_top_renb_r_d2  <=  1'b1				;
        rom_top_addrb_r_d2 <=  5'b0				;
    end
	else  begin
		rom0_renb_r_d2     <=  rom0_renb_r_d1    ;
        rom1_renb_r_d2     <=  rom1_renb_r_d1    ;
	    rom0_addrb_r_d2    <=  rom0_addrb_r_d1   ;
	    rom1_addrb_r_d2    <=  rom1_addrb_r_d1   ;
	    rom_l0_renb_r_d2   <=  rom_l0_renb_r_d1  ;
	    rom_l1_renb_r_d2   <=  rom_l1_renb_r_d1  ;
	    rom_l0_addrb_r_d2  <=  rom_l0_addrb_r_d1 ;
	    rom_l1_addrb_r_d2  <=  rom_l1_addrb_r_d1 ;
	    rom_top_renb_r_d2  <=  rom_top_renb_r_d1 ;
	    rom_top_addrb_r_d2 <=  rom_top_addrb_r_d1;
    end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		rom0_addrb_r_d3     <=8'd0		;
	    rom1_addrb_r_d3     <=8'd0		;
		rom_l0_renb_r_d3	<=1'b1		;
		rom_l1_renb_r_d3	<=1'b1		;
	    rom_l0_addrb_r_d3	<=4'd0		; 
	    rom_l1_addrb_r_d3	<=4'd0		;   
	    rom_top_addrb_r_d3  <=5'd0		;
    end
	else begin
	rom0_addrb_r_d3     <=  rom0_addrb_r_d2    ;
	rom1_addrb_r_d3     <=  rom1_addrb_r_d2    ;
	rom_l0_renb_r_d3	<=  rom_l0_renb_r_d2   ;
	rom_l1_renb_r_d3	<=  rom_l1_renb_r_d2   ;
	rom_l0_addrb_r_d3	<=  rom_l0_addrb_r_d2  ; 
	rom_l1_addrb_r_d3	<=  rom_l1_addrb_r_d2  ; 
	rom_top_addrb_r_d3  <=  rom_top_addrb_r_d2 ;
	end
end

//***********************************************************************************************************************************************
//                                             
//    						read data from ram to db_pipeline             
//                                             
//***********************************************************************************************************************************************
wire   [DATA_WIDTH-1:0]  ver_pi_w	,ver_qi_w	;
reg    [DATA_WIDTH-1:0]  hor_pi_r				;
wire   [DATA_WIDTH-1:0]  hor_qi_w				;

assign	ver_pi_w =  rom0_renb_r ? rom_l1_datab_o_w : rom0_datab_o_w  ;
assign	ver_qi_w =  rom1_renb_r ? rom_l0_datab_o_w : rom1_datab_o_w  ;

always @* begin
	if(cnt_i[7]&&cnt_i[2:0]==3'b001&&state_i==YHOR)//129 
		hor_pi_r =  y_tl ;
	else if(cnt_i[6]&&cnt_i[2:0]==3'b001&&state_i==CHOR)//65 
		hor_pi_r = u_tl ;
	else if(cnt_i[6]&&cnt_i[2:0]==3'b101&&state_i==CHOR)//69
		hor_pi_r = v_tl ;
	else if(!rom0_renb_r)
		hor_pi_r = rom0_datab_o_w   ;
    else if(!rom_l1_renb_r)		
        hor_pi_r = rom_l1_datab_o_w ;
    else
		hor_pi_r = rom_top_datab_o_w ;
end

assign  hor_qi_w =  rom1_renb_r ? (rom_l0_renb_r?rom_top_datab_o_w:rom_l0_datab_o_w):rom1_datab_o_w;

always @* begin
    case(state_i)
	    CVER,
		YVER:begin p_o = ver_pi_w ;q_o = ver_qi_w ;end
		YHOR,
		CHOR:begin p_o = hor_pi_r ;q_o = hor_qi_w ;end
     default:begin p_o = 128'b0   ;q_o = 128'b0   ;end
    endcase
end

//r\w mb_db      LOAD   OUTLT    OUT
//cycles        0-31   1-64    1-384
assign mb_db_en_o  = !(state_i==LOAD||(state_i==OUTLT||state_i==OUT));
assign mb_db_rw_o  = state_i==LOAD ? 1'b0 :1'b1;
assign mb_db_addr_o= state_i==OUTLT? cnt_r:(state_i==LOAD ? cnt_i:tq_raddr_r) ;

reg [DATA_WIDTH-1:0] y_tl_temp;
reg [DATA_WIDTH-1:0] u_tl_temp;
reg [DATA_WIDTH-1:0] v_tl_temp;

always @(posedge clk or negedge rst_n)begin 
    if(!rst_n) begin 
        y_tl_temp  <= 'd0;
        u_tl_temp  <= 'd0;
        v_tl_temp  <= 'd0;
    end 
    else if(state_i==OUTLT&&!cnt_i)begin
        y_tl_temp  <= y_tl;
        u_tl_temp  <= u_tl;
        v_tl_temp  <= v_tl;
    end 
end 

always @*begin
    if(state_i == OUTLT && cnt_i[6] &&cnt_i[1:0]) begin // OUTLT 65 66 67 
        case(cnt_i[1:0])
            2'd0 : mb_db_data_o = 128'd0;
            2'd1 : mb_db_data_o = y_tl_temp;
            2'd2 : mb_db_data_o = u_tl_temp;
            2'd3 : mb_db_data_o = v_tl_temp;
		endcase
	end 
    else begin  
	    case(state_i)
		      OUT:mb_db_data_o = rom0_renb_r   ? rom1_datab_o_w : rom0_datab_o_w ;
            OUTLT:mb_db_data_o = rom_l0_renb_r ? (rom_l1_renb_r ? rom_top_datab_o_w:rom_l1_datab_o_w):rom_l0_datab_o_w;
          default:mb_db_data_o =128'b0;
        endcase
	end 
end

//***********************************************************************************************************************************************
//                                             
//    read data from db_pipeline to ram            
//                                             
//***********************************************************************************************************************************************
//rom 0/1
// reable and address need delay 
always @(posedge clk or negedge rst_n)begin
    if(!rst_n) begin			
				rom0_wena_r   <=   1'b1				;	
				rom0_addra_r  <=   8'b0				;
				rom1_wena_r   <=   1'b1				;	
				rom1_addra_r  <=   8'b0				; 	
	end
    else begin
		case(state_i)
			CVER,
			CHOR,
			YHOR,
			YVER :begin 
				rom0_wena_r   <=  rom0_renb_r_d2   	;
				rom0_addra_r  <=  rom0_addrb_r_d3	;
				rom1_wena_r   <=  rom1_renb_r_d2	;			 
				rom1_addra_r  <=  rom1_addrb_r_d3	;	
			end               
			LOAD:begin     
				rom0_wena_r   <=  rom0_load_en_w 	;		
				rom0_addra_r  <=  rom0_load_addr_w	;	 	
				rom1_wena_r   <=  rom1_load_en_w	;			
				rom1_addra_r  <=  rom1_load_addr_w	;
			end                
		default:begin        
				rom0_wena_r   <=   1'b1				;		
				rom0_addra_r  <=   8'b0				;	 
				rom1_wena_r   <=   1'b1				;		
				rom1_addra_r  <=   8'b0				; 
		end                  
		endcase
	end
end

//cen and data input do not need delay 
always @* begin
	case(state_i)
		CVER,
		CHOR,
		YHOR,
		YVER : begin
			rom0_cena_r    =  1'b0				;
			rom1_cena_r    =  1'b0				;
			rom0_dataa_i_r =  f_p_i				;	
			rom1_dataa_i_r =  f_q_i				;
		end                
		LOAD:begin         
			rom0_cena_r    =  1'b0				;
			rom1_cena_r    =  1'b0				;
			rom0_dataa_i_r =  tq_rdata_i		;	
		    rom1_dataa_i_r =  tq_rdata_i		;	
		end                
		default:begin      
			rom0_cena_r    =   1'b1				;
			rom1_cena_r    =   1'b1				;	
			rom0_dataa_i_r =   128'b0			;	
			rom1_dataa_i_r =   128'b0			;	
		end
	endcase	
end

always @* begin
	case(state_i)
		YVER :begin 
			 rom0_cenb_r  =  1'b0				;
			 rom0_addrb_r =  ram0_yver_raddr_w	;
			 rom1_cenb_r  =  1'b0				;			 
			 rom1_addrb_r =  ram1_yver_raddr_w	;			 			 
		end
		YHOR :begin  
			 rom0_cenb_r  =  1'b0				;	
			 rom0_addrb_r =  ram0_yhor_raddr_r	;		
			 rom1_cenb_r  =  1'b0				;            		
			 rom1_addrb_r =  ram1_yhor_raddr_r	;	
		end
		CVER :begin  
			 rom0_cenb_r  =  1'b0						;           		
			 rom0_addrb_r =  {1'b1,ram0_cver_raddr_w}	;		
			 rom1_cenb_r  =  1'b0						;		            		
			 rom1_addrb_r =  {1'b1,ram1_cver_raddr_w}	;
		end
		CHOR :begin  
			 rom0_cenb_r  =  1'b0				;           	
			 rom0_addrb_r =  ram0_chor_raddr_r	;		
			 rom1_cenb_r  =  1'b0				;		            			
			 rom1_addrb_r =  ram1_chor_raddr_r	;	
		end
		OUT  :begin  
			 rom0_cenb_r  =  1'b0				;          	
			 rom0_addrb_r =  ram0_out_raddr_w	;		
			 rom1_cenb_r  =  1'b0				;		            			
			 rom1_addrb_r =  ram1_out_raddr_w	;
		end
      default:begin   
			 rom0_cenb_r  =  1'b1				;	
			 rom0_addrb_r =  8'b0				;		
			 rom1_cenb_r  =  1'b1				;		
			 rom1_addrb_r =  8'b0				; 
	  end
	endcase
end


always @(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
             rom0_renb_r  <=  1'b1;rom1_renb_r <= 1'b1;	
	end			 
	else begin
		case(state_i)
			YVER:begin rom0_renb_r  <= ram0_yver_ren_w;rom1_renb_r <= ram1_yver_ren_w	;end
			YHOR:begin rom0_renb_r  <= ram0_yhor_ren_w;rom1_renb_r <= ram1_yhor_ren_w	;end
			CVER:begin rom0_renb_r  <= ram0_cver_ren_w;rom1_renb_r <= ram1_cver_ren_w	;end
            CHOR:begin rom0_renb_r  <= ram0_chor_ren_w;rom1_renb_r <= ram1_chor_ren_w	;end
			OUT :begin rom0_renb_r  <= ram0_out_ren_w ;rom1_renb_r <= ram1_out_ren_w    ;end
		 default:begin rom0_renb_r  <= 1'b1           ;rom1_renb_r <= 1'b1              ;end
		endcase
	end	
end

assign 		rom0_wenb_w   =  1'b1  				;
assign 		rom1_wenb_w   =  1'b1  				;

assign		rom0_rena_w   =  1'b1				;
assign		rom1_rena_w   =  1'b1				;

//***********************************************************************************************************************************************
//rom_l0/l1
//enable and address need delay
always @(posedge clk or negedge rst_n)begin
    if(!rst_n) begin
			rom_l0_addra_r   <=  4'b0			 ;
			rom_l1_addra_r   <=  4'b0			 ;	
	end
	else begin
	    case(state_i)
	    	CVER,
	    	CHOR,
	    	YHOR,
	    	YVER :begin   
	    		rom_l0_addra_r  <= rom_l0_addrb_r_d3  ;
	    		rom_l1_addra_r  <= rom_l1_addrb_r_d3  ;
	    	end               
	    	OUT:begin //update : rom 0/1 ----> rom_l0/1  
	    		rom_l0_addra_r  <= ram_l0_load_raddr_r;
	    		rom_l1_addra_r  <= ram_l1_load_raddr_r;
	    	end                 
          default:begin         
	    		rom_l0_addra_r  <=  4'b0			  ;
	    		rom_l1_addra_r  <=  4'b0			  ;	    	
	      end
	    endcase
	end
end

always @(*)		begin
	case(state_i)
	    	CVER,
	    	CHOR,
	    	YHOR,
	    	YVER :begin   
	    	    rom_l0_wena_r   = rom_l0_renb_r_d3    ;
	    	    rom_l1_wena_r   = rom_l1_renb_r_d3    ;
	    	end               
	    	OUT:begin //update : rom 0/1 ----> rom_l0/1  
	    	    rom_l0_wena_r   = ram_l0_load_ren_w   ;
	    	    rom_l1_wena_r   = ram_l1_load_ren_w   ;
	    	end                 
          default:begin         
	    	    rom_l0_wena_r   =  1'b1  			   ;
	    	    rom_l1_wena_r   =  1'b1  			   ;  	
	      end
	endcase
end

//cen and data input do not need delay 
always @* begin
	    case(state_i)
	    	CVER,
	    	CHOR,
	    	YHOR,
	    	YVER :begin  
				rom_l0_cena_r   = 1'b0				   ;
				rom_l1_cena_r   = 1'b0				   ;
				rom_l0_dataa_i_r= f_q_i			       ;      
				rom_l1_dataa_i_r= f_p_i			       ; 
			
			end
			OUT:begin
				rom_l0_cena_r   = 1'b0				   ;
				rom_l1_cena_r   = 1'b0				   ;
				rom_l0_dataa_i_r= rom1_datab_o_w	   ; 
				rom_l1_dataa_i_r= rom0_datab_o_w	   ; 
			end
		 default:begin
				rom_l0_cena_r    =  1'b1			   ;
				rom_l1_cena_r    =  1'b1			   ;
				rom_l0_dataa_i_r =  128'b0			   ; 
				rom_l1_dataa_i_r =  128'b0			   ; 
            end
		endcase
end



assign		 rom_l0_rena_w =  1'b1				  ;
assign		 rom_l1_rena_w =  1'b1				  ;

always @* begin
	case(state_i)
		YVER :begin   
			rom_l0_cenb_r  = 1'b0				  ;		   
			rom_l0_addrb_r = ram_l0_yver_raddr_w  ;
			rom_l1_cenb_r  = 1'b0				  ;
			rom_l1_addrb_r = ram_l1_yver_raddr_w  ;
			end
		YHOR :begin  
			rom_l0_cenb_r  = 1'b0				  ;
			rom_l0_addrb_r = ram_l0_yhor_raddr_r  ;
			rom_l1_cenb_r  = 1'b0				  ;
			rom_l1_addrb_r = ram_l1_yhor_raddr_r  ;
		end
		CVER :begin  
			rom_l0_cenb_r  = 1'b0				  ;
			rom_l0_addrb_r = ram_l0_cver_raddr_r  ;
			rom_l1_cenb_r  = 1'b0				  ;
			rom_l1_addrb_r = ram_l1_cver_raddr_r  ;
		end
		CHOR :begin   
			rom_l0_cenb_r  = 1'b0				  ;
			rom_l0_addrb_r = ram_l0_chor_raddr_r  ;
			rom_l1_cenb_r  = 1'b0		 		  ;
			rom_l1_addrb_r = ram_l1_chor_raddr_r  ;
		end
		OUTLT:begin   
			rom_l0_cenb_r  = 1'b0				  ;
			rom_l0_addrb_r = ram_l0_out_raddr_w   ;
			rom_l1_cenb_r  = 1'b0				  ;
			rom_l1_addrb_r = ram_l1_out_raddr_w   ;
		end
      default:begin   
	  		rom_l0_cenb_r  = 1'b1				  ;
			rom_l0_addrb_r = 4'b0				  ;
			rom_l1_cenb_r  = 1'b1				  ;
			rom_l1_addrb_r = 4'b0				  ;	
	  end
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		 rom_l0_renb_r  <= 1'b1; rom_l1_renb_r <= 1'b1;
	end
	else begin
		case(state_i)
			YVER:begin rom_l0_renb_r <= ram_l0_yver_ren_w ; rom_l1_renb_r <= ram_l1_yver_ren_w ;end
	        YHOR:begin rom_l0_renb_r <= ram_l0_yhor_ren_r ; rom_l1_renb_r <= ram_l1_yhor_ren_r ;end
			CVER:begin rom_l0_renb_r <= ram_l0_cver_ren_w ; rom_l1_renb_r <= ram_l1_cver_ren_w ;end
			CHOR:begin rom_l0_renb_r <= ram_l0_chor_ren_r ; rom_l1_renb_r <= ram_l1_chor_ren_r ;end
		   OUTLT:begin rom_l0_renb_r <= ram_l0_out_ren_w  ; rom_l1_renb_r <= ram_l1_out_ren_w  ;end
	     default:begin rom_l0_renb_r <= 1'b1              ; rom_l1_renb_r <= 1'b1              ;end
        endcase		 
	end
end

assign		 rom_l0_wenb_w =  1'b1				  ;
assign		 rom_l1_wenb_w =  1'b1				  ;

//***********************************************************************************************************************************************
wire  [DATA_WIDTH-1:0]  rom_top_dataa_m_w			;// data 

assign rom_top_dataa_m_w    =cnt_i[0]?f_p_i:f_q_i	;
//enable end addr need delay 
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		rom_top_wena_r   <=   1'b1				    ;
		rom_top_addra_r  <=   5'b0				    ;
    end
	else begin
		case(state_i)
			CHOR,
			YHOR:begin   
				rom_top_wena_r   <=   rom_top_renb_r_d2	;
				rom_top_addra_r  <=   rom_top_addrb_r_d3;
			end                                   
			LOAD:begin           
				rom_top_wena_r   <=   rom_top_load_en_w	 ;
				rom_top_addra_r  <=   rom_top_load_addr_w;
			end                  
		default:begin          
				rom_top_wena_r   <=   1'b1				 ;
				rom_top_addra_r  <=   5'b0				 ;
		end
		endcase
	end
end
//cen and data input do not need delay 
always @* begin
	case(state_i)
	    CHOR,
		YHOR:begin  
			rom_top_cena_r   =   1'b0				;
			rom_top_dataa_i_r=   rom_top_dataa_m_w  ;
		end
		LOAD:begin 
			rom_top_cena_r   =   1'b0				;
			rom_top_dataa_i_r=   db_rdata_r         ;
		end
		default:begin  
			rom_top_cena_r   =   1'b1				;
			rom_top_dataa_i_r=   128'b0		        ;  
		end
	endcase
end

assign   rom_top_rena_w  =  	1'b1				;	 


always @* begin
	case(state_i)
		YHOR :begin   
			rom_top_cenb_r  =   1'b0				;			
		    rom_top_addrb_r =   ram_top_yhor_raddr_w;
		end
		CHOR :begin  
			rom_top_cenb_r  =   1'b0				;		
		    rom_top_addrb_r =   ram_top_chor_raddr_w;
		end
		OUTLT:begin 
			rom_top_cenb_r  =   1'b0				;			
		    rom_top_addrb_r =   ram_top_out_raddr_w ;
		end
      default:begin  
			rom_top_cenb_r  =   1'b1				;
		    rom_top_addrb_r =   5'b0				;
	  end
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) 
		rom_top_renb_r  <=   1'b1 ;
    else begin
		case(state_i) 
			YHOR:rom_top_renb_r  <=  ram_top_yhor_ren_w	;
		    CHOR:rom_top_renb_r  <=  ram_top_chor_ren_w	;
		   OUTLT:rom_top_renb_r  <=  ram_top_out_ren_w	;
		 default:rom_top_renb_r  <=  1'b1 				;
		endcase
	end
end

assign   rom_top_wenb_w  =  	1'b1					;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		y_tl	<=128'b0			 ;
    else if(state_i==OUTLT&&cnt_i==8'd48)//cycles 32 
		y_tl    <= rom_top_datab_o_w ;
    else if(state_i==YHOR&&cnt_i==8'd132)
        y_tl    <= f_p_i             ;
    else
		y_tl    <= y_tl				 ;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		u_tl	<=128'b0			 ;
    else if(state_i==OUTLT&&cnt_i==8'd56)//cycles 48 
		u_tl    <= rom_top_datab_o_w ;
    else if(state_i==CHOR&&cnt_i==8'd68)//cycles 48 
		u_tl    <= f_p_i             ;
    else
		u_tl    <= u_tl				 ;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		v_tl	<=128'b0			 ;
    else if(state_i==OUTLT&&cnt_i==8'd64)//cycles 56 
		v_tl    <= rom_top_datab_o_w ;
    else if(state_i==CHOR&&cnt_i==8'd72)//cycles 56 
		v_tl    <= f_p_i             ;
    else
		v_tl    <= v_tl				 ;
end
//***********************************************************************************************************************************************
//                                             
//    original pixels manage      
//                                             
//***********************************************************************************************************************************************

reg  		          ram_origin_0_cen_r ; // chip enable, low active
reg  		          ram_origin_0_oen_r ; // data output enable, low active
reg  		          ram_origin_0_wen_r ; // write enable, low active
reg [8-1:0]           ram_origin_0_addr_r; // address input
reg	[DATA_WIDTH-1:0]  ram_origin_0_data_r; // data input
wire[DATA_WIDTH-1:0]  ram_origin_0_data_w; // data output 

reg  		          ram_origin_1_cen_r ; // chip enable, low active
reg  		          ram_origin_1_oen_r ; // data output enable, low active
reg  		          ram_origin_1_wen_r ; // write enable, low active
reg [8-1:0]           ram_origin_1_addr_r; // address input
reg	[DATA_WIDTH-1:0]  ram_origin_1_data_r; // data input
wire[DATA_WIDTH-1:0]  ram_origin_1_data_w; // data output 
// write data : write enable and address need delay 
//              write data and cen do not need delay 
// read data  :
// 

always @* begin 
    case(state_i)
        LOAD:begin 
            ram_origin_0_cen_r  =   1'b0         ;
			ram_origin_0_data_r =   tq_ori_data_i;
			
			ram_origin_1_cen_r  =   1'b0         ;		
			ram_origin_1_data_r =   tq_ori_data_i;
	end 
		YHOR: begin 
            ram_origin_0_cen_r  =   1'b0          ;
			ram_origin_0_data_r =   128'd0        ;
			
			ram_origin_1_cen_r  =   1'b0          ;
			ram_origin_1_data_r =   128'd0        ;			
        end 
		default:begin 
		    ram_origin_0_cen_r  =   1'b1          ;	
			ram_origin_0_data_r =   128'd0        ;
			
			ram_origin_1_cen_r  =   1'b1          ;		
			ram_origin_1_data_r =   128'd0        ;	
		end 
    endcase
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        ram_origin_0_wen_r <=  1'b1     ;
		ram_origin_0_oen_r <=  1'b1     ;	
		ram_origin_0_addr_r<=  8'd0     ;
		
		ram_origin_1_wen_r <=  1'b1     ;
		ram_origin_1_oen_r <=  1'b1     ;			
		ram_origin_1_addr_r<=  8'd0     ;
	end 
    else if(state_i==LOAD) begin 
        ram_origin_0_wen_r <=  rom0_load_en_w     ;
		ram_origin_0_oen_r <=  1'b1               ;			
		ram_origin_0_addr_r<=  rom0_load_addr_w   ;
		
		ram_origin_1_wen_r <=  rom1_load_en_w     ;
		ram_origin_1_oen_r <=  1'b1               ;			
		ram_origin_1_addr_r<=  rom1_load_addr_w   ;
    end 
	else if(state_i==YHOR) begin 
        ram_origin_0_wen_r <=  1'b1               ;
		ram_origin_0_oen_r <=  rom0_renb_r_d2     ;
		ram_origin_0_addr_r<=  rom0_addrb_r_d2    ;
		
		ram_origin_1_wen_r <=  1'b1               ;
		ram_origin_1_oen_r <=  rom1_renb_r_d2     ;	
		ram_origin_1_addr_r<=  rom1_addrb_r_d2    ;
	end 	
	else begin 
        ram_origin_0_wen_r <=  1'b1               ;
		ram_origin_0_oen_r <=  1'b1               ;			
		ram_origin_0_addr_r<=  8'd0               ;

		ram_origin_1_wen_r <=  1'b1               ;
		ram_origin_1_oen_r <=  1'b1               ;			
		ram_origin_1_addr_r<=  8'd0               ;	
	end 
end 

//***********************************************************************************************************************************************
//                                             
//    ram_instance         
//                                             
//***********************************************************************************************************************************************
db_lcu_ram  ram0(
		            .clka    (clk               ),
		            .cena_i  (rom0_cena_r 	    ),
                    .rena_i  (rom0_rena_w 	    ),
                    .wena_i  (rom0_wena_r 	    ),
                    .addra_i (rom0_addra_r	    ),
                    .dataa_o (rom0_dataa_o_w    ),
                    .dataa_i (rom0_dataa_i_r    ),
		            .clkb    (clk               ), 
		            .cenb_i  (rom0_cenb_r 	    ),   
		            .renb_i  (rom0_renb_r 	    ),   
		            .wenb_i  (rom0_wenb_w 	    ),   
		            .addrb_i (rom0_addrb_r	    ),   
		            .datab_o (rom0_datab_o_w    ),   
		            .datab_i (rom0_datab_i_w    )
				);                              

db_lcu_ram  ram1(                               
		            .clka    (clk               ),
		            .cena_i  (rom1_cena_r 	    ),
                    .rena_i  (rom1_rena_w 	    ),
                    .wena_i  (rom1_wena_r 	    ),
                    .addra_i (rom1_addra_r	    ),
                    .dataa_o (rom1_dataa_o_w    ),
                    .dataa_i (rom1_dataa_i_r    ),
		            .clkb    (clk               ), 
		            .cenb_i  (rom1_cenb_r 	    ),   
		            .renb_i  (rom1_renb_r 	    ),   
		            .wenb_i  (rom1_wenb_w 	    ),   
		            .addrb_i (rom1_addrb_r	    ),   
		            .datab_o (rom1_datab_o_w    ),   
		            .datab_i (rom1_datab_i_w    )
				);

db_top_ram  topram(
		            .clka    (clk               ),
		            .cena_i  (rom_top_cena_r 	),
                    .rena_i  (rom_top_rena_w 	),
                    .wena_i  (rom_top_wena_r 	),
                    .addra_i (rom_top_addra_r	),
                    .dataa_o (rom_top_dataa_o_w ),
                    .dataa_i (rom_top_dataa_i_r ),
		            .clkb    (clk               ), 
		            .cenb_i  (rom_top_cenb_r 	),   
		            .renb_i  (rom_top_renb_r 	),   
		            .wenb_i  (rom_top_wenb_w 	),   
		            .addrb_i (rom_top_addrb_r	),   
		            .datab_o (rom_top_datab_o_w),   
		            .datab_i (rom_top_datab_i_w)
					);

db_left_ram  ram_l0(
		            .clka    (clk               ),
		            .cena_i  (rom_l0_cena_r 	),
                    .rena_i  (rom_l0_rena_w 	),
                    .wena_i  (rom_l0_wena_r 	),
                    .addra_i (rom_l0_addra_r	),
                    .dataa_o (rom_l0_dataa_o_w  ),
                    .dataa_i (rom_l0_dataa_i_r  ),
		            .clkb    (clk               ), 
		            .cenb_i  (rom_l0_cenb_r 	),   
		            .renb_i  (rom_l0_renb_r 	),   
		            .wenb_i  (rom_l0_wenb_w 	),   
		            .addrb_i (rom_l0_addrb_r	),   
		            .datab_o (rom_l0_datab_o_w  ),   
		            .datab_i (rom_l0_datab_i_w  )
					);

db_left_ram  ram_l1(
		            .clka    (clk               ),
		            .cena_i  (rom_l1_cena_r 	),
                    .rena_i  (rom_l1_rena_w 	),
                    .wena_i  (rom_l1_wena_r 	),
                    .addra_i (rom_l1_addra_r	),
                    .dataa_o (rom_l1_dataa_o_w  ),
                    .dataa_i (rom_l1_dataa_i_r  ),
		            .clkb    (clk               ), 
		            .cenb_i  (rom_l1_cenb_r 	),   
		            .renb_i  (rom_l1_renb_r 	),   
		            .wenb_i  (rom_l1_wenb_w 	),   
		            .addrb_i (rom_l1_addrb_r	),   
		            .datab_o (rom_l1_datab_o_w  ),   
		            .datab_i (rom_l1_datab_i_w  )
				);							
	
db_ram_1p ram_origin_0 (
                    .clk     (clk                ), 
                    .cen_i   (ram_origin_0_cen_r ), 
                    .oen_i   (ram_origin_0_oen_r ), 
                    .wen_i   (ram_origin_0_wen_r ), 
                    .addr_i  (ram_origin_0_addr_r),
                    .data_i  (ram_origin_0_data_r),
                    .data_o  (ram_origin_0_data_w)
                    );	
	
db_ram_1p ram_origin_1 (
                    .clk     (clk                ), 
                    .cen_i   (ram_origin_1_cen_r ), 
                    .oen_i   (ram_origin_1_oen_r ), 
                    .wen_i   (ram_origin_1_wen_r ), 
                    .addr_i  (ram_origin_1_addr_r),
                    .data_i  (ram_origin_1_data_r),
                    .data_o  (ram_origin_1_data_w)
                    );	
					
assign      op_o   =   ram_origin_0_data_w        ;					
assign      oq_o   =   ram_origin_1_data_w        ;		
assign      op_enable_o = 	ram_origin_0_oen_r    ;		
assign      oq_enable_o = 	ram_origin_1_oen_r    ;		
					

endmodule
