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
// Filename       : db_mv.v
// Author         : Chewein
// Created        : 2014-06-29
// Description    : load/store mv and send mf to dbf
//------------------------------------------------------------------- 
`include "enc_defines.v"

module db_mv(
			   clk			 ,
               rst_n		 ,	
			   cnt_i		 ,
			   state_i		 ,			   
               mb_x_total_i  ,	
               mb_y_total_i  ,	
               mb_x_i 	     ,	
               mb_y_i 	     ,	

			   mb_mv_ren_o	 ,
			   mb_mv_raddr_o ,
               mb_mv_rdata_i ,
			   
			   mv_p_o        ,
			   mv_q_o        
);
// *************************************************************************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// *************************************************************************************************
input							clk				;//clock
input							rst_n			;//reset signal  

// CTRL IF                   
input [`PIC_X_WIDTH-1:0] 		mb_x_total_i 	;// Total LCU number-1 in X ,PIC_X_WIDTH = 8
input [`PIC_Y_WIDTH-1:0]  		mb_y_total_i 	;// Total LCU number-1 in y ,PIC_Y_WIDTH = 8
input [`PIC_X_WIDTH-1:0] 		mb_x_i 			;// Current LCU in X
input [`PIC_Y_WIDTH-1:0]  		mb_y_i 			;// Current LCU in y
input [8:0]        				cnt_i			;
input [2:0]        				state_i			;

// MV RAM IF				
output							mb_mv_ren_o		;// Inter MVD MEM IF
output [6:0]					mb_mv_raddr_o	;// CU_DEPTH  = 3,each 8x8 cu
input  [19:0]					mb_mv_rdata_i	;// FMV_WIDTH = 10

output [`FMV_WIDTH*2-1:0]  		mv_p_o       	;
output [`FMV_WIDTH*2-1:0]  		mv_q_o       	;

reg    [`FMV_WIDTH*2-1:0]     	mv_p_o          ;
reg    [`FMV_WIDTH*2-1:0]     	mv_q_o          ;

//***************************************************************************************************
//                                             
//    Parameter DECLARATION                     
//                                             
//***************************************************************************************************
parameter IDLE   = 3'b000, LOAD  = 3'b001, YVER  = 3'b011,YHOR	=3'b010;
parameter CVER   = 3'b110, CHOR  = 3'b111, OUTLT = 3'b101,OUT   =3'b100;

parameter DATA_WIDTH = 20 ;

// mv top memory buffer    
wire  		                mv_top_cen_w    ;  // chip enable, low active
wire  		                mv_top_oen_w    ;  // data output enable, low active
wire  		                mv_top_wen_w    ;  // write enable, low active
wire    [`PIC_X_WIDTH+2:0]  mv_top_addr_w   ;  // address input
wire    [`FMV_WIDTH*2-1:0]  mv_top_data_i_w ;  // data input
wire	[`FMV_WIDTH*2-1:0]  mv_top_data_o_w ;  // data output

//instance the sram and signal connection
reg    		          	    rom_mv_cena_r 				;// chip enable, low active
reg   		          	    rom_mv_rena_r 				;// read enable, low active
reg     		            rom_mv_wena_r 				;// write enable, low active
reg   [6:0] 		  	    rom_mv_addra_r				;// address input
reg   [DATA_WIDTH-1:0]      rom_mv_dataa_i_r			;// data input
wire  [DATA_WIDTH-1:0]      rom_mv_dataa_o_w			;// read
	
reg    		          	    rom_mv_cenb_r 				;// chip enable, low active
reg   		          	    rom_mv_renb_r 				;// read enable, low active
reg     		            rom_mv_wenb_r 				;// write enable, low active
reg   [6:0] 		  	    rom_mv_addrb_r				;// address input
reg   [DATA_WIDTH-1:0]      rom_mv_datab_i_r			;// data input
wire  [DATA_WIDTH-1:0]      rom_mv_datab_o_w			;// read


reg    [8:0]     cnt_r				 ;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cnt_r	<=	9'b0		 ;
	else 
		cnt_r	<=	cnt_i    	 ;
end

//----------------------------------------------------------------------------------------
//load mv 
//state_i=LOAD
//0..63 : current 8x8 cu in zig-zag scan order 
//64..71: top     8x8 cu
reg [4:0] mb_mv_raddr_w	;

assign mb_mv_ren_o   = (state_i==LOAD) ? cnt_i[6] : 1'b1 ;
assign mb_mv_raddr_o = cnt_i[6] ? {1'b1,cnt_i[5:0]} : {1'b0,cnt_i[5],mb_mv_raddr_w};

always @* begin
	case(cnt_i[4:0])
			5'd0  :mb_mv_raddr_w[4:0] =  5'd0  ;
			5'd1  :mb_mv_raddr_w[4:0] =  5'd1  ;
			5'd2  :mb_mv_raddr_w[4:0] =  5'd4  ;
			5'd3  :mb_mv_raddr_w[4:0] =  5'd5  ;			
			5'd4  :mb_mv_raddr_w[4:0] =  5'd16 ;
			5'd5  :mb_mv_raddr_w[4:0] =  5'd17 ;
			5'd6  :mb_mv_raddr_w[4:0] =  5'd20 ;
			5'd7  :mb_mv_raddr_w[4:0] =  5'd21 ;
			5'd8  :mb_mv_raddr_w[4:0] =  5'd2  ;
			5'd9  :mb_mv_raddr_w[4:0] =  5'd3  ;			
			5'd10 :mb_mv_raddr_w[4:0] =  5'd6  ;
			5'd11 :mb_mv_raddr_w[4:0] =  5'd7  ;
			5'd12 :mb_mv_raddr_w[4:0] =  5'd18 ;
			5'd13 :mb_mv_raddr_w[4:0] =  5'd19 ;
			5'd14 :mb_mv_raddr_w[4:0] =  5'd22 ;
			5'd15 :mb_mv_raddr_w[4:0] =  5'd23 ;			
		    5'd16 :mb_mv_raddr_w[4:0] =  5'd8  ;
			5'd17 :mb_mv_raddr_w[4:0] =  5'd9  ;
			5'd18 :mb_mv_raddr_w[4:0] =  5'd12 ;
			5'd19 :mb_mv_raddr_w[4:0] =  5'd13 ;			
			5'd20 :mb_mv_raddr_w[4:0] =  5'd24 ;
			5'd21 :mb_mv_raddr_w[4:0] =  5'd25 ;
			5'd22 :mb_mv_raddr_w[4:0] =  5'd28 ;
			5'd23 :mb_mv_raddr_w[4:0] =  5'd29 ;
			5'd24 :mb_mv_raddr_w[4:0] =  5'd10 ;
			5'd25 :mb_mv_raddr_w[4:0] =  5'd11 ;			
			5'd26 :mb_mv_raddr_w[4:0] =  5'd14 ;
			5'd27 :mb_mv_raddr_w[4:0] =  5'd15 ;
			5'd28 :mb_mv_raddr_w[4:0] =  5'd26 ;
			5'd29 :mb_mv_raddr_w[4:0] =  5'd27 ;
			5'd30 :mb_mv_raddr_w[4:0] =  5'd30 ;
			5'd31 :mb_mv_raddr_w[4:0] =  5'd31 ;	
		  default :mb_mv_raddr_w[4:0] =  5'd0  ;
	endcase
end

//---------------------------------------------------------------------------------------
//state_i == LOAD
//load mv from external memory and top memory to rom
//cycles:	0..63 :current lcu store in  0...63
//cycles:	64..71:  top   lcu store in 72...79

wire 		             rom_mv_load_wena_w   ;
wire  [6:0]              rom_mv_load_addra_w  ;
wire  [`FMV_WIDTH*2-1:0] rom_mv_load_data_w   ;

assign rom_mv_load_wena_w = cnt_r[8:7]||cnt_r[6]&&cnt_r[5:3]          ;//0..71:0 , 72..:1
assign rom_mv_load_addra_w= cnt_r[6] ? {4'b1001,cnt_r[2:0]}:cnt_r[6:0];// 0..63:zigzag , 64..71:72..79
assign rom_mv_load_data_w = cnt_r[6] ? mv_top_data_o_w : mb_mv_rdata_i;

//----------------------------------------------------------------------------------------
//yver 
//read from rom for dbf
//a port :mv_p 
//b port :mv_q 

wire        rom_mv_yver_rena_w   		;
wire        rom_mv_yver_renb_w   		;
reg  [6:0]  rom_mv_yver_addra_r  		;
wire [6:0]  rom_mv_yver_addrb_w  		;

assign 		rom_mv_yver_rena_w = 1'b0 	;
assign 		rom_mv_yver_renb_w = 1'b0 	;

assign 		rom_mv_yver_addrb_w = {1'b0,cnt_i[6:4],cnt_i[2:0]};

always @*begin
	if(cnt_i[2:0])
		rom_mv_yver_addra_r <=	{1'b0,cnt_r[6:4],cnt_r[2:0]};
	else //cycles of 8 times,the left
		rom_mv_yver_addra_r <=  {4'b1000,cnt_i[6:4]}		;
end

//--------------------------------------------------------------------------------------------
//yhor
//read from rom for dbf
//a port:mv_p  
//b port:mv_q

wire        rom_mv_yhor_rena_w   ;
wire        rom_mv_yhor_renb_w   ;
reg  [6:0]  rom_mv_yhor_addra_r  ;
reg  [6:0]  rom_mv_yhor_addrb_r  ;

assign  	rom_mv_yhor_rena_w	 = cnt_i==9'd128 ? 1'b1 :1'b0;//top_left,not cosider the delay 
assign 		rom_mv_yhor_renb_w 	 = 1'b0					   ;

always @* begin
	if(cnt_i[7])		//cycles 128...
		rom_mv_yhor_addra_r  = {4'b1000,cnt_r[2:0]};
	else begin 
		case(cnt_i[6:4])
			3'd0:	rom_mv_yhor_addra_r  = {4'b1001,cnt_i[3:1]}; //cycles 0...15  :72+。。
			3'd1:	rom_mv_yhor_addra_r  = {4'b0000,cnt_i[3:1]}; //cycles 16..31  :0 +..
			3'd2:	rom_mv_yhor_addra_r  = {4'b0001,cnt_i[3:1]}; //cycles 32..47  :8 +..
			3'd3:	rom_mv_yhor_addra_r  = {4'b0010,cnt_i[3:1]}; //cycles 48..63  :16+..
			3'd4:	rom_mv_yhor_addra_r  = {4'b0011,cnt_i[3:1]}; //cycles 64..79  :24+..
			3'd5:	rom_mv_yhor_addra_r  = {4'b0100,cnt_i[3:1]}; //cycles 80..95  :32+..
			3'd6:	rom_mv_yhor_addra_r  = {4'b0101,cnt_i[3:1]}; //cycles 96..111 :40+..
			3'd7:	rom_mv_yhor_addra_r  = {4'b0110,cnt_i[3:1]}; //cycles 112..127:48+..
		endcase                                                               
	end
end

always @* begin
	if(cnt_i[7])		//cycles 128...
		rom_mv_yhor_addrb_r  = {4'b1000,cnt_i[2:0]		  };
	else
		rom_mv_yhor_addrb_r  = {1'b0,cnt_i[6:4],cnt_i[3:1]}; 
end
//--------------------------------------------------------------------------------------------
//cver
//read from rom for dbf
//a port:mv_p  
//b port:mv_q

wire        rom_mv_cver_rena_w   		;
wire        rom_mv_cver_renb_w   		;
reg  [6:0]  rom_mv_cver_addra_r  		;
wire [6:0]  rom_mv_cver_addrb_w  		;

assign      rom_mv_cver_rena_w   = 1'b0 ;
assign      rom_mv_cver_renb_w   = 1'b0 ;
  
assign      rom_mv_cver_addrb_w  = {cnt_i[4:0],1'b0};
  
always @* begin
	if(cnt_i[1:0])
		rom_mv_cver_addra_r = {cnt_i[4:0],1'b0}-1'b1;
	else			//cycles 4 times
		rom_mv_cver_addra_r	= {4'b1000,cnt_i[4:2]}  ;
end

//--------------------------------------------------------------------------------------------
//chor
//read from rom for dbf
//a port:mv_p  
//b port:mv_q
wire        rom_mv_chor_rena_w   		;
wire        rom_mv_chor_renb_w   		;
reg  [6:0]  rom_mv_chor_addra_r  		;
wire [6:0]  rom_mv_chor_addrb_r  		;

assign rom_mv_chor_rena_w  = cnt_i[8:0] == 9'd64 || cnt_i[8:0] == 9'd71 ? 1'b1 :1'b0 ;
assign rom_mv_chor_renb_w  = 1'b0   		;

assign rom_mv_chor_addrb_r = {1'b0,cnt_i[4:3],1'b0,cnt_i[2:0]};

always @* begin
	if(cnt_i[6]) begin
		case(cnt_i[1:0])
			2'd0:rom_mv_chor_addra_r = 7'd64;
			2'd1:rom_mv_chor_addra_r = 7'd65;
			2'd2:rom_mv_chor_addra_r = 7'd67;
			2'd3:rom_mv_chor_addra_r = 7'd69;
		 default:rom_mv_chor_addra_r = 7'd0 ;
		endcase 
	end
	else if(cnt_i[2:0])begin
			case(cnt_i[4:3])
				2'd1:rom_mv_chor_addra_r = {4'b0001,cnt_i[2:0]};
				2'd2:rom_mv_chor_addra_r = {4'b0011,cnt_i[2:0]};
				2'd3:rom_mv_chor_addra_r = {4'b0101,cnt_i[2:0]};
			 default:rom_mv_chor_addra_r = 7'd0				   ;
			endcase
	end	
	else 		//cycles = 0..7
		rom_mv_chor_addra_r = {4'b1001,cnt_i[2:0]};
end

//--------------------------------------------------------------------------------------------
//outlt and update the top mv
//read from rom for update the top mv 8 cycles
//a port: non  
//b port:read 7  15  23  31 39 47 55 63 
// mv top memory: (mb_x_i<<3)+(0..7)

wire        rom_mv_top_renb_w   		    ;// read enable
wire [6:0]  rom_mv_top_addrb_w  		    ;// read address

assign rom_mv_top_renb_w = !(!(cnt_r[8:3]) )      ; // 8 cycles 	
assign rom_mv_top_addrb_w= {4'b0111,cnt_i[2:0]}   ;



//--------------------------------------------------------------------------------------------
//out and update the left mv
//read from rom for update the left mv 8 cycles
//a port:write 64--71 
//b port:read 7  15  23  31 39 47 55 63 
wire        rom_mv_update_wena_w   		;//write enable
wire        rom_mv_update_renb_w   		;// read enable
wire [6:0]  rom_mv_update_addra_w  		;//write address
wire [6:0]  rom_mv_update_addrb_w  		;// read address

assign      rom_mv_update_wena_w  = cnt_r[6:3]==4'd0 ? 1'b0 : 1'b1 ;
assign      rom_mv_update_renb_w  = cnt_r[6:3]==4'd0 ? 1'b0 : 1'b1 ;

assign      rom_mv_update_addra_w = {4'b1000,cnt_r[2:0]};//64+cnt_r[2:0]
assign      rom_mv_update_addrb_w = {cnt_i[3:0],3'b111 };

//--------------------------------------------------------------------------------------------
//instance the sram and signal connection


always @* begin
	case(state_i)
		LOAD:begin		//write to a port 
			rom_mv_cena_r 		= 1'b0 					;
			rom_mv_rena_r 		= 1'b1 					;
			rom_mv_wena_r 	    = rom_mv_load_wena_w	;	
			rom_mv_addra_r	    = rom_mv_load_addra_w 	;
			rom_mv_dataa_i_r    = rom_mv_load_data_w    ;
			
			rom_mv_cenb_r 	    = 1'b1					;
			rom_mv_renb_r 	    = 1'b1					;
			rom_mv_wenb_r 	    = 1'b1  				;
			rom_mv_addrb_r	    = 7'd0					;
			rom_mv_datab_i_r    = 20'd0					;
		end                    
		YVER:begin
			rom_mv_cena_r 		= 1'b0					;
			rom_mv_rena_r 		= rom_mv_yver_rena_w    ;
		    rom_mv_wena_r 	    = 1'b1					;
		    rom_mv_addra_r	    = rom_mv_yver_addra_r   ;
		    rom_mv_dataa_i_r    = 20'b0					;
		    
		    rom_mv_cenb_r 	    = 1'b0					;
		    rom_mv_renb_r 	    = rom_mv_yver_renb_w    ;
		    rom_mv_wenb_r 	    = 1'b1					;
		    rom_mv_addrb_r	    = rom_mv_yver_addrb_w   ;
		    rom_mv_datab_i_r    = 20'b0					;
		end
		YHOR:begin
			rom_mv_cena_r 		= 1'b0					; 
		    rom_mv_rena_r 		= rom_mv_yhor_rena_w    ;
		    rom_mv_wena_r 	    = 1'b1					; 
		    rom_mv_addra_r	    = rom_mv_yhor_addra_r   ;
		    rom_mv_dataa_i_r    = 20'b0					;
	                              
		    rom_mv_cenb_r 	    = 1'b0					; 
		    rom_mv_renb_r 	    = rom_mv_yhor_renb_w    ;
		    rom_mv_wenb_r 	    = 1'b1					; 
		    rom_mv_addrb_r	    = rom_mv_yhor_addrb_r   ;
		    rom_mv_datab_i_r    = 20'b0					;
		end
		CVER:begin
			rom_mv_cena_r 		=  1'b0					;
			rom_mv_rena_r 		=  rom_mv_cver_rena_w   ;
			rom_mv_wena_r 	    =  1'b1					;
			rom_mv_addra_r	    =  rom_mv_cver_addra_r  ;
			rom_mv_dataa_i_r    =  20'b0				;
	 
			rom_mv_cenb_r 	    =  1'b0					;
			rom_mv_renb_r 	    =  rom_mv_cver_renb_w   ;
			rom_mv_wenb_r 	    =  1'b1					;
			rom_mv_addrb_r	    =  rom_mv_cver_addrb_w  ;
			rom_mv_datab_i_r    =  20'b0				;
		end
		CHOR:begin
			rom_mv_cena_r 		= 1'b0					;
			rom_mv_rena_r 		= rom_mv_chor_rena_w    ;
		    rom_mv_wena_r 	    = 1'b1					;
		    rom_mv_addra_r	    = rom_mv_chor_addra_r   ;
		    rom_mv_dataa_i_r    = 20'b0					;
	
		    rom_mv_cenb_r 	    = 1'b0					;
		    rom_mv_renb_r 	    = rom_mv_chor_renb_w    ;
		    rom_mv_wenb_r 	    = 1'b1					;
		    rom_mv_addrb_r	    = rom_mv_chor_addrb_r   ;
            rom_mv_datab_i_r    = 20'b0					;
		end
		OUTLT:begin
			rom_mv_cena_r 		= 1'b1					;
		    rom_mv_rena_r 		= 1'b1					;
		    rom_mv_wena_r 	    = 1'b1  				;
		    rom_mv_addra_r	    = 7'd0					;
		    rom_mv_dataa_i_r    = 20'd0					;
		    
		    rom_mv_cenb_r 	    = 1'b0					;
		    rom_mv_renb_r 	    = rom_mv_top_renb_w  	; 
		    rom_mv_wenb_r 	    = 1'b1					;
		    rom_mv_addrb_r	    = rom_mv_top_addrb_w    ;
		    rom_mv_datab_i_r    = 20'd0					;
		end
		OUT:begin
			rom_mv_cena_r 		= 1'b0					;
		    rom_mv_rena_r 		= 1'b1					;
		    rom_mv_wena_r 	    = rom_mv_update_wena_w	;
		    rom_mv_addra_r	    = rom_mv_update_addra_w ;
		    rom_mv_dataa_i_r    = rom_mv_datab_o_w      ;
		    
		    rom_mv_cenb_r 	    = 1'b0					;
		    rom_mv_renb_r 	    = rom_mv_update_renb_w	;
		    rom_mv_wenb_r 	    = 1'b1					;
		    rom_mv_addrb_r	    = rom_mv_update_addrb_w ;
		    rom_mv_datab_i_r    = 20'd0					;
		end
	default:begin
			rom_mv_cena_r 		= 1'b1					;
            rom_mv_rena_r 		= 1'b1					;
	        rom_mv_wena_r 	    = 1'b1  				;
	        rom_mv_addra_r	    = 7'd0					;
	        rom_mv_dataa_i_r    = 20'd0					;
	        
	        rom_mv_cenb_r 	    = 1'b1					;
	        rom_mv_renb_r 	    = 1'b1					;
	        rom_mv_wenb_r 	    = 1'b1  				;
	        rom_mv_addrb_r	    = 7'd0					;
	        rom_mv_datab_i_r    = 20'd0					;
    end
	endcase
end

db_mv_ram  umvram(
		            .clka    (clk               ),
		            .cena_i  (rom_mv_cena_r     ),
                    .rena_i  (rom_mv_rena_r     ),
                    .wena_i  (rom_mv_wena_r     ),
                    .addra_i (rom_mv_addra_r    ),
                    .dataa_i (rom_mv_dataa_i_r  ),
                    .dataa_o (rom_mv_dataa_o_w  ),
					                              
		            .clkb    (clk               ), 
		            .cenb_i  (rom_mv_cenb_r 	),   
		            .renb_i  (rom_mv_renb_r 	),   
		            .wenb_i  (rom_mv_wenb_r 	),   
		            .addrb_i (rom_mv_addrb_r	),   
		            .datab_i (rom_mv_datab_i_r  ),   
		            .datab_o (rom_mv_datab_o_w  )
				);  
				
				
// mv top memory buffer
assign  mv_top_cen_w     = !(state_i == LOAD  || state_i == OUTLT)       ;
assign  mv_top_oen_w     = !(state_i == LOAD )|| !(cnt_r[8:3]==6'b001000); // 64..71 cycles
assign  mv_top_wen_w     = !(state_i == OUTLT)|| !(!(cnt_r[8:3]))        ; // OUTLT 8 cycles 	
assign  mv_top_addr_w    = state_i == LOAD ? (mb_x_i<<3)+cnt_i[2:0] :(mb_x_i<<3)+cnt_r[2:0];	
assign  mv_top_data_i_w  = rom_mv_datab_o_w      ;	


db_ram_1p #(.Addr_Width(`PIC_X_WIDTH+3), .Word_Width(`FMV_WIDTH*2))	
u_ram_1p_64x192 (
    .clk  	    ( clk		        ), 
    .cen_i      ( mv_top_cen_w      ),
    .oen_i      ( mv_top_oen_w      ), // read   enable 
    .wen_i      ( mv_top_wen_w      ), // write  enable 
    .addr_i     ( mv_top_addr_w     ),
    .data_i     ( mv_top_data_i_w   ),
    .data_o     ( mv_top_data_o_w   )
);				

//----------------------------------------------------------------------------------------------
//send mv for dbf

reg  [20-1:0] mv_tl_r    ;//buffer
reg  [20-1:0] mv_tl 	 ;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		mv_tl_r		<=	20'd0;
    else if(cnt_i[8:0]==9'd71&&state_i==LOAD) //read from top ram 
		mv_tl_r		<=	mv_top_data_o_w;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		mv_tl		<=	20'd0;
    else if(state_i==OUT&&!cnt_i)
		mv_tl		<=	mv_tl_r;
end

always @* begin
     if(state_i==YHOR&&cnt_i[7:0]==8'd128)
		mv_p_o	=	mv_tl	;
	else if(state_i==CHOR&&(cnt_i[7:0]==8'd64||cnt_i[7:0]==8'd68))
		mv_p_o	=	mv_tl	;
	else 
		mv_p_o	=   rom_mv_dataa_o_w	;
end

always @*begin
		mv_q_o	= rom_mv_datab_o_w;
end


endmodule 
