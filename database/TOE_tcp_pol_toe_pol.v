`timescale 1ns / 1ps
module tcp_poll #(
	    parameter                   INIT_FILE  = ""        ,
        parameter       	        DAT_WID    = 256       ,       	
        parameter       	        MSG_WID    = 20        ,       	
	    parameter					CBUS_AWID  = 16		   ,
	    parameter					CBUS_DWID  = 32		   ,
	    parameter					DBG_WID    = 32		                                                                    	
) (
	input   wire 					                        clk               ,               
	input   wire 					                        rst               ,               
	input   wire [1-1:0] 			                        rx_pkt_vld        ,               
	output  wire [1-1:0] 			                        rx_pkt_rdy        ,               
	input   wire [DAT_WID-1:0] 		                        rx_pkt_dat 		  ,               
	input   wire [MSG_WID-1:0]                              rx_pkt_msg 		  ,               
	output 	reg  [1-1:0] 			                        tx_pkt_vld		  ,           	
	input 	wire [1-1:0] 			                        tx_pkt_rdy		  ,           	
	output 	reg  [DAT_WID-1:0]                              tx_pkt_dat		  ,           	
	output 	reg  [MSG_WID-1:0] 		                        tx_pkt_msg		  ,            	
    input 	wire					                        cbus_req 		  ,
    input 	wire					                        cbus_rw 		  ,
    output  wire					                        cbus_ack 	      ,
    input   wire [CBUS_AWID-1:0]			                cbus_addr 		  ,
    input   wire [CBUS_DWID-1:0]			                cbus_wdata 		  ,
    output  wire [CBUS_DWID-1:0]			                cbus_rdata 		  ,
 	input   wire [CBUS_DWID-1:0]	                        cfg_pkt_len 	  ,
 	input   wire [CBUS_DWID-1:0]	                        cfg_pkt_num 	  ,
 	input   wire [CBUS_DWID-1:0]	                        cfg_pkt_gap 	  ,
 	input   wire [CBUS_DWID-1:0]	                        cfg_pkt_start 	  ,
	output	wire [DBG_WID-1:0]			                    dbg_sig						
);
reg [9:0] 	               raddr	 ;
reg 		                   ren	   ;
wire [(DAT_WID+MSG_WID+1)-1:0] rdata	 ;
sdp_ram_with_cbus #(
	.RAM_STYLE  ( "block"            ),
	.DWID       ( 1+MSG_WID+DAT_WID  ), 
	.AWID       ( 10                 ), 
	.CBUS_AWID  ( CBUS_AWID          ),
	.CBUS_DWID  ( CBUS_DWID          ),
	.INIT_FILE  ( INIT_FILE          ),                
	.DBG_WID    ( DBG_WID            ) 
) inst_sdp_ram (
    .clk     		  (  clk                      ),         
    .rst     		  (  rst                      ),         
    .waddr   		  ( {(10){1'b0}}              ),         
    .wen     		  (  1'b0       	            ),         
    .wdata   		  ( {1+DAT_WID + MSG_WID{1'b0}} ),         
    .raddr   		  (  raddr                    ),         
    .ren     		  (  ren                      ),         
    .rdata   		  (  rdata                    ),         
    .cbus_req 		  (  cbus_req                 ),
    .cbus_rw 		  (  cbus_rw                  ),
    .cbus_ack 		(  cbus_ack                 ),
    .cbus_addr 		(  cbus_addr                ),
    .cbus_wdata 	(  cbus_wdata               ),
    .cbus_rdata 	(  cbus_rdata               ),
    .dbg            (                           )          
);
reg [31:0] cnt_pkt_cyc    ;
reg [31:0] cnt_pkt_num    ;
reg        flag_pkt_run   ;
reg        flag_pkt_start ;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 ) begin
		  flag_pkt_start <= 1'b0;
	end
	else begin
		  if( flag_pkt_start==1'b0 && cfg_pkt_start[0]==1'b1 && cnt_pkt_num==0 )begin
		       flag_pkt_start <= 1'b1;
			end
		  else if( flag_pkt_start==1'b1 && cfg_pkt_start[0]==1'b0 && cnt_pkt_cyc==(cfg_pkt_gap-1) )begin
		       flag_pkt_start <= 1'b0;
			end
		  else if( flag_pkt_start==1'b1 && cfg_pkt_num!=0 && cnt_pkt_num==cfg_pkt_num && cnt_pkt_cyc==(cfg_pkt_gap-1) )begin
		       flag_pkt_start <= 1'b0;
			end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 ) begin
		  flag_pkt_run <= 1'b0;
	end
	else begin
		  if( flag_pkt_start==1'b1 && cfg_pkt_start[0]==1'b0 && cnt_pkt_cyc==(cfg_pkt_gap-1) )begin  
		       flag_pkt_run <= 1'b0;
			end
		  else if( flag_pkt_start==1'b1 && cfg_pkt_num!=0 && cnt_pkt_num==cfg_pkt_num && cnt_pkt_cyc==(cfg_pkt_gap-1) )begin  
		       flag_pkt_run <= 1'b0;
			end
		  else if( flag_pkt_start==1'b1 && cnt_pkt_cyc==(cfg_pkt_gap-1) && tx_pkt_rdy==1'b0 )begin 
		       flag_pkt_run <= 1'b0;
			end
		  else if( flag_pkt_start==1'b1 && cnt_pkt_cyc==(cfg_pkt_gap-1) && tx_pkt_rdy==1'b1 )begin 
		       flag_pkt_run <= 1'b1;
			end
		  else if( flag_pkt_start==1'b0 )begin
		       flag_pkt_run <= 1'b0;
			end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 ) begin
		  cnt_pkt_cyc <= 0;
	end
	else begin
		  if( flag_pkt_start==1'b0 )begin
							cnt_pkt_cyc <= 0;
			end
		  else if( flag_pkt_start==1'b1 && cnt_pkt_cyc==(cfg_pkt_gap-1) )begin
							cnt_pkt_cyc <= 0;
			end
		  else begin 
							cnt_pkt_cyc <= cnt_pkt_cyc + 1'b1;
			end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 ) begin
		  ren	<= 0;
	end
	else begin
		if( flag_pkt_run==1'b1 && cnt_pkt_cyc<cfg_pkt_len ) begin
			ren <= 1'b1;
		end
		else begin
			ren <= 1'b0;
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 ) begin
		raddr	<= 0;
	end
	else begin
		if( flag_pkt_start==1'b0 ) begin
			raddr <= 0;
		end
		else if( ren==1'b1 && raddr==(cfg_pkt_len-1) ) begin
			raddr <= 0;
		end
		else if( ren==1'b1 ) begin
			raddr <= raddr + 1'b1;
		end
	end
end
reg ren_d1;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 ) begin
		ren_d1                  <= 0 ;
		{tx_pkt_vld, tx_pkt_msg,tx_pkt_dat} <= 0 ;
	end
	else begin
		ren_d1	   <= ren    ;
		if( ren_d1==1'b1 ) begin
		    {tx_pkt_vld, tx_pkt_msg,tx_pkt_dat} <= rdata;
		end
		else begin
		    {tx_pkt_vld, tx_pkt_msg,tx_pkt_dat} <= rdata;
				tx_pkt_vld <= 1'b0;
		end
	end
end
assign rx_pkt_rdy = 1'b1;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 ) begin
		  cnt_pkt_num <= 0;
	end
	else begin
		  if( cfg_pkt_start==0 )begin
							cnt_pkt_num <= 0;
			end
		  else if( flag_pkt_start==1'b1 && cnt_pkt_cyc==(cfg_pkt_gap-1) )begin
							cnt_pkt_num <= cnt_pkt_num + 1'b1;
			end
	end
end
assign  dbg_sig = 32'h0;
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction
endmodule
