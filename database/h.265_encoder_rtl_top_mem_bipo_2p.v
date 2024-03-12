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
// Filename       : mem_bipo.v
// Author         : Yibo FAN
// Created        : 2014-01-16
// Description    : Memory Buf Block Input, Parallel line Output
//					Support:     IN         OUT
//							  4x4 block   32x1 line 
//							              16x2 line 
//                			              8x4  line 
//							              4x4  line 
//							 
//------------------------------------------------------------------- 
`include "enc_defines.v"

module mem_bipo_2p   (
				clk      		,      
				rst_n        	,
				wen_i			,
				wsize_i         ,
				w4x4_x_i        ,
				w4x4_y_i        ,
				wdata_i         ,
				ren_i           ,
				rsize_i         ,
				r4x4_x_i        ,
				r4x4_y_i        ,
				ridx_i          ,
				rdata_o          
);

// ********************************************
//                                             				
//    Parameter DECLARATION                    				
//                                             				
// ********************************************
localparam 						I_4x4	= 2'b00,
           						I_8x8	= 2'b01,
           						I_16x16	= 2'b10,
           						I_32x32	= 2'b11;
           
// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// ********************************************           
input							clk			; //clock
input							rst_n		; //reset signal          
input  							wen_i  		; //    
input  [1:0]					wsize_i		; // 
input  [3:0]					w4x4_x_i	; // 
input  [3:0]					w4x4_y_i	; // 
input  [`PIXEL_WIDTH*16-1:0]	wdata_i 	; // 
input							ren_i 		; // 
input  [1:0]					rsize_i		; // 
input  [3:0]					r4x4_x_i	; // 
input  [3:0]					r4x4_y_i	; //                 	 
input [4:0]						ridx_i		; // 
output [`PIXEL_WIDTH*32-1:0]	rdata_o		; // 

// ********************************************
//                                             
//    Signals DECLARATION               
//                                             
// ********************************************
// R/W Data & Address
wire [`PIXEL_WIDTH*4-1:0] 		w_4x4_l0	,
						 		w_4x4_l1    ,
						 		w_4x4_l2    ,
						 		w_4x4_l3    ;
reg [1:0]						b0_waddr_l, b0_raddr_l, 	
								b1_waddr_l, b1_raddr_l, 
								b2_waddr_l, b2_raddr_l, 
								b3_waddr_l, b3_raddr_l;            
wire [2:0]						b0_waddr_h, 
								b1_waddr_h, 
								b2_waddr_h,  
								b3_waddr_h;  
reg [2:0]						b0_raddr_h, 								
								b1_raddr_h, 								
								b2_raddr_h, 								
								b3_raddr_h; 								
wire [4:0] 						b0_waddr, b0_raddr,           
                                b1_waddr, b1_raddr,
                                b2_waddr, b2_raddr,
                                b3_waddr, b3_raddr;
reg [`PIXEL_WIDTH*8-1:0] 		b0_wdata,		
                                b1_wdata,
                                b2_wdata,
                                b3_wdata; 
wire [`PIXEL_WIDTH*8-1:0] 		b0_rdata,                                
                                b2_rdata,                                
                                b1_rdata,                                
                                b3_rdata;                                  
reg [`PIXEL_WIDTH*32-1:0]		b_rdata;

reg  [1:0]						rsize_r ;
reg  [3:0]						r4x4_x_r;
reg  [4:0]						ridx_r  ; 

// R/W Control
wire [1:0]						b0_wen,
								b1_wen,
								b2_wen,
								b3_wen;
wire 							b0_ren, 
								b1_ren,
								b2_ren,
								b3_ren;
                                                    
// ********************************************
//                                             
//    Logic DECLARATION                         
//                                             
// ********************************************
// --------------------------------------------
//		Memory Banks
//---------------------------------------------    
//-------------- MEM Write ----------------//
assign b0_wen = wen_i?({~w4x4_x_i[0], w4x4_x_i[0]}) : 2'b00;
assign b1_wen = wen_i?({~w4x4_x_i[0], w4x4_x_i[0]}) : 2'b00;
assign b2_wen = wen_i?({~w4x4_x_i[0], w4x4_x_i[0]}) : 2'b00;
assign b3_wen = wen_i?({~w4x4_x_i[0], w4x4_x_i[0]}) : 2'b00;

assign w_4x4_l0 = wdata_i[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*12];
assign w_4x4_l1 = wdata_i[`PIXEL_WIDTH*12-1:`PIXEL_WIDTH*8];
assign w_4x4_l2 = wdata_i[`PIXEL_WIDTH*8 -1:`PIXEL_WIDTH*4];
assign w_4x4_l3 = wdata_i[`PIXEL_WIDTH*4 -1:`PIXEL_WIDTH*0];

always@(*) begin
	case (w4x4_x_i[2:0])
		3'd0: {b0_wdata, b1_wdata, b2_wdata, b3_wdata} = {	w_4x4_l0, `PIXEL_WIDTH*4'b0, 
															w_4x4_l1, `PIXEL_WIDTH*4'b0, 
															w_4x4_l2, `PIXEL_WIDTH*4'b0, 
															w_4x4_l3, `PIXEL_WIDTH*4'b0};
		3'd1: {b0_wdata, b1_wdata, b2_wdata, b3_wdata} = {	`PIXEL_WIDTH*4'b0, w_4x4_l0, 
															`PIXEL_WIDTH*4'b0, w_4x4_l1, 
															`PIXEL_WIDTH*4'b0, w_4x4_l2, 
															`PIXEL_WIDTH*4'b0, w_4x4_l3};
		3'd2: {b0_wdata, b1_wdata, b2_wdata, b3_wdata} = {	w_4x4_l2, `PIXEL_WIDTH*4'b0, 
															w_4x4_l3, `PIXEL_WIDTH*4'b0,
															w_4x4_l0, `PIXEL_WIDTH*4'b0,
															w_4x4_l1, `PIXEL_WIDTH*4'b0};
		3'd3: {b0_wdata, b1_wdata, b2_wdata, b3_wdata} = {	`PIXEL_WIDTH*4'b0, w_4x4_l2,
															`PIXEL_WIDTH*4'b0, w_4x4_l3,
															`PIXEL_WIDTH*4'b0, w_4x4_l0,
															`PIXEL_WIDTH*4'b0, w_4x4_l1};
		3'd4: {b0_wdata, b1_wdata, b2_wdata, b3_wdata} = {	w_4x4_l3, `PIXEL_WIDTH*4'b0, 
															w_4x4_l0, `PIXEL_WIDTH*4'b0, 
															w_4x4_l1, `PIXEL_WIDTH*4'b0, 
															w_4x4_l2, `PIXEL_WIDTH*4'b0}; 
		3'd5: {b0_wdata, b1_wdata, b2_wdata, b3_wdata} = {	`PIXEL_WIDTH*4'b0, w_4x4_l3,
															`PIXEL_WIDTH*4'b0, w_4x4_l0,
															`PIXEL_WIDTH*4'b0, w_4x4_l1,
															`PIXEL_WIDTH*4'b0, w_4x4_l2};
		3'd6: {b0_wdata, b1_wdata, b2_wdata, b3_wdata} = {	w_4x4_l1, `PIXEL_WIDTH*4'b0, 
															w_4x4_l2, `PIXEL_WIDTH*4'b0, 
															w_4x4_l3, `PIXEL_WIDTH*4'b0, 
															w_4x4_l0, `PIXEL_WIDTH*4'b0}; 
		3'd7: {b0_wdata, b1_wdata, b2_wdata, b3_wdata} = {	`PIXEL_WIDTH*4'b0, w_4x4_l1,
															`PIXEL_WIDTH*4'b0, w_4x4_l2,
															`PIXEL_WIDTH*4'b0, w_4x4_l3,
															`PIXEL_WIDTH*4'b0, w_4x4_l0};
	endcase
end

always @(*) begin
	case (w4x4_x_i[2:0])
		3'd0, 3'd1: begin b0_waddr_l=2'd0; b1_waddr_l=2'd1; b2_waddr_l=2'd2; b3_waddr_l=2'd3; end
        3'd2, 3'd3: begin b0_waddr_l=2'd2; b1_waddr_l=2'd3; b2_waddr_l=2'd0; b3_waddr_l=2'd1; end
        3'd4, 3'd5: begin b0_waddr_l=2'd3; b1_waddr_l=2'd0; b2_waddr_l=2'd1; b3_waddr_l=2'd2; end
        3'd6, 3'd7: begin b0_waddr_l=2'd1; b1_waddr_l=2'd2; b2_waddr_l=2'd3; b3_waddr_l=2'd0; end
 	endcase
end

assign b0_waddr_h = w4x4_y_i[2:0];
assign b1_waddr_h = w4x4_y_i[2:0];
assign b2_waddr_h = w4x4_y_i[2:0];
assign b3_waddr_h = w4x4_y_i[2:0];

assign b0_waddr = {b0_waddr_h, b0_waddr_l};
assign b1_waddr = {b1_waddr_h, b1_waddr_l};
assign b2_waddr = {b2_waddr_h, b2_waddr_l};
assign b3_waddr = {b3_waddr_h, b3_waddr_l};

//-------------- MEM Read ----------------//
assign b0_ren = ren_i;
assign b1_ren = ren_i;                             
assign b2_ren = ren_i;                              
assign b3_ren = ren_i;                              
// address generater                             
always @(*) begin
	case (rsize_i)
		I_4x4	, 
		I_8x8	: begin	
					case (r4x4_x_i[2:1])
		          		2'd0: begin b0_raddr_l=2'd0; b1_raddr_l=2'd1; b2_raddr_l=2'd2; b3_raddr_l=2'd3; end
		          		2'd1: begin b0_raddr_l=2'd2; b1_raddr_l=2'd3; b2_raddr_l=2'd0; b3_raddr_l=2'd1; end
		          		2'd2: begin b0_raddr_l=2'd3; b1_raddr_l=2'd0; b2_raddr_l=2'd1; b3_raddr_l=2'd2; end      
		          		2'd3: begin b0_raddr_l=2'd1; b1_raddr_l=2'd2; b2_raddr_l=2'd3; b3_raddr_l=2'd0; end    
		          	endcase  
				  end
		I_16x16	: begin b0_raddr_l = {ridx_i[1], r4x4_x_i[2]};
				  		b1_raddr_l = {ridx_i[1], ~r4x4_x_i[2]};
				  		b2_raddr_l = {ridx_i[1], r4x4_x_i[2]};
				  		b3_raddr_l = {ridx_i[1], ~r4x4_x_i[2]};
				  end                
		I_32x32	: begin b0_raddr_l = ridx_i[1:0]; 
						b1_raddr_l = ridx_i[1:0]; 
						b2_raddr_l = ridx_i[1:0]; 
						b3_raddr_l = ridx_i[1:0]; 
				  end
	endcase
end

always @(*) begin
	case (rsize_i)
		I_4x4	: begin b0_raddr_h = r4x4_y_i[2:0]; 
						b1_raddr_h = r4x4_y_i[2:0]; 
						b2_raddr_h = r4x4_y_i[2:0]; 
						b3_raddr_h = r4x4_y_i[2:0]; 
					end              
		I_8x8   : begin b0_raddr_h = {r4x4_y_i[2:1], ridx_i[2]}; 
						b1_raddr_h = {r4x4_y_i[2:1], ridx_i[2]}; 
						b2_raddr_h = {r4x4_y_i[2:1], ridx_i[2]}; 
						b3_raddr_h = {r4x4_y_i[2:1], ridx_i[2]};
					end              
		I_16x16 : begin b0_raddr_h = {r4x4_y_i[2], ridx_i[3:2]}; 
						b1_raddr_h = {r4x4_y_i[2], ridx_i[3:2]}; 
						b2_raddr_h = {r4x4_y_i[2], ridx_i[3:2]}; 
						b3_raddr_h = {r4x4_y_i[2], ridx_i[3:2]};
					end              
		I_32x32 : begin b0_raddr_h = ridx_i[4:2]; 
						b1_raddr_h = ridx_i[4:2]; 
						b2_raddr_h = ridx_i[4:2]; 
						b3_raddr_h = ridx_i[4:2];
					end
	endcase
end       

assign b0_raddr	= {b0_raddr_h, b0_raddr_l};
assign b1_raddr	= {b1_raddr_h, b1_raddr_l};
assign b2_raddr	= {b2_raddr_h, b2_raddr_l};
assign b3_raddr	= {b3_raddr_h, b3_raddr_l};

// data alignment
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		rsize_r  <= 'b0; 
		r4x4_x_r <= 'b0;    
		ridx_r   <= 'b0;
	end
	else begin 
		rsize_r  <= rsize_i; 
		r4x4_x_r <= r4x4_x_i;
		ridx_r   <= ridx_i;
	end
end

always @(*) begin
	case (rsize_r)

    I_4x4  : if (r4x4_x_r[0]) begin
              case (r4x4_x_r[2:1]) 
                2'd0: b_rdata = { b0_rdata[`PIXEL_WIDTH*4-1:0] ,b0_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b1_rdata[`PIXEL_WIDTH*4-1:0] ,b1_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b2_rdata[`PIXEL_WIDTH*4-1:0] ,b2_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b3_rdata[`PIXEL_WIDTH*4-1:0] ,b3_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] };
                2'd1: b_rdata = { b2_rdata[`PIXEL_WIDTH*4-1:0] ,b2_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b3_rdata[`PIXEL_WIDTH*4-1:0] ,b3_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b0_rdata[`PIXEL_WIDTH*4-1:0] ,b0_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b1_rdata[`PIXEL_WIDTH*4-1:0] ,b1_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] };
                2'd2: b_rdata = { b1_rdata[`PIXEL_WIDTH*4-1:0] ,b1_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b2_rdata[`PIXEL_WIDTH*4-1:0] ,b2_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b3_rdata[`PIXEL_WIDTH*4-1:0] ,b3_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b0_rdata[`PIXEL_WIDTH*4-1:0] ,b0_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] };
                2'd3: b_rdata = { b3_rdata[`PIXEL_WIDTH*4-1:0] ,b3_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b0_rdata[`PIXEL_WIDTH*4-1:0] ,b0_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b1_rdata[`PIXEL_WIDTH*4-1:0] ,b1_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] ,
                                  b2_rdata[`PIXEL_WIDTH*4-1:0] ,b2_rdata[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4] };
              endcase
            end

				    else begin
		          case (r4x4_x_r[2:1])
				      	2'd0: b_rdata = {b0_rdata, b1_rdata, b2_rdata, b3_rdata};
				      	2'd1: b_rdata = {b2_rdata, b3_rdata, b0_rdata, b1_rdata};
				      	2'd2: b_rdata = {b1_rdata, b2_rdata, b3_rdata, b0_rdata};
				      	2'd3: b_rdata = {b3_rdata, b0_rdata, b1_rdata, b2_rdata};
				      endcase
				    end
		I_8x8  	: case (r4x4_x_r[2:1])
					2'd0: b_rdata = {b0_rdata, b1_rdata, b2_rdata, b3_rdata};
					2'd1: b_rdata = {b2_rdata, b3_rdata, b0_rdata, b1_rdata};
					2'd2: b_rdata = {b1_rdata, b2_rdata, b3_rdata, b0_rdata};
					2'd3: b_rdata = {b3_rdata, b0_rdata, b1_rdata, b2_rdata};   
				endcase
		I_16x16	: case ({r4x4_x_r[2], ridx_r[1]}) 
					2'd0: b_rdata = {b0_rdata, b2_rdata, b1_rdata, b3_rdata};
					2'd1: b_rdata = {b2_rdata, b0_rdata, b3_rdata, b1_rdata};
					2'd2: b_rdata = {b1_rdata, b3_rdata, b2_rdata, b0_rdata};
					2'd3: b_rdata = {b3_rdata, b1_rdata, b0_rdata, b2_rdata};
				endcase
		I_32x32	: case (ridx_r[1:0])
					2'd0: b_rdata = {b0_rdata, b2_rdata, b1_rdata, b3_rdata}; 
					2'd1: b_rdata = {b1_rdata, b3_rdata, b2_rdata, b0_rdata}; 
					2'd2: b_rdata = {b2_rdata, b0_rdata, b3_rdata, b1_rdata}; 
					2'd3: b_rdata = {b3_rdata, b1_rdata, b0_rdata, b2_rdata};  
				endcase
	endcase
end

assign rdata_o = b_rdata;

// MEM Modules
buf_ram_2p_64x32	buf_pre_0(
		.clk  		( clk		),
		.a_we       ( b0_wen	),
		.a_addr     ( b0_waddr	),
		.a_data_i   ( b0_wdata	),
		.b_re       ( b0_ren	),
		.b_addr     ( b0_raddr	),
		.b_data_o   ( b0_rdata	)
); 

buf_ram_2p_64x32	buf_pre_1(
		.clk  		( clk		),
		.a_we       ( b1_wen	), 
		.a_addr     ( b1_waddr	),   
		.a_data_i   ( b1_wdata	),   
		.b_re       ( b1_ren	),   
		.b_addr     ( b1_raddr	),   
		.b_data_o   ( b1_rdata	)   
);                  

buf_ram_2p_64x32	buf_pre_2(
		.clk  		( clk		),
		.a_we       ( b2_wen	),
		.a_addr     ( b2_waddr	),
		.a_data_i   ( b2_wdata	),
		.b_re       ( b2_ren	),
		.b_addr     ( b2_raddr	),
		.b_data_o   ( b2_rdata	)
); 

buf_ram_2p_64x32	buf_pre_3(
		.clk  		( clk		),
		.a_we       ( b3_wen	),
		.a_addr     ( b3_waddr	),
		.a_data_i   ( b3_wdata	),
		.b_re       ( b3_ren	),
		.b_addr     ( b3_raddr	),
		.b_data_o   ( b3_rdata	)
); 

endmodule