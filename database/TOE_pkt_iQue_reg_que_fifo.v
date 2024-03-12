module reg_que_fifo #(
    parameter RAM_STYLE  = "distributed",              
	parameter MQNUM      = 8,                          
	parameter DWID       = 18, 
	parameter AWID       = 10, 
	parameter AFULL_TH   = 4, 
	parameter AEMPTY_TH  = 4, 
	parameter DBG_WID    = 32 
) (
  input 		    				clk			,              
  input 		    				rst			,              
  input  [1*MQNUM-1:0]				wen			,              
  input  [DWID-1:0]   	    		wdata		,              
  output [1*MQNUM-1:0]          	nfull		,              
  output [1*MQNUM-1:0]          	nafull		,              
  output [1*MQNUM-1:0]          	woverflow	,              
  output [(AWID+1)*MQNUM-1:0]		cnt_free	,              
  input  [1*MQNUM-1:0]				ren			,              
  output [DWID-1:0]   	    		rdata		,              
  output [1*MQNUM-1:0]          	nempty		,              
  output [1*MQNUM-1:0]          	naempty		,              
  output [1*MQNUM-1:0]          	roverflow	,              
  output [(AWID+1)*MQNUM-1:0]		cnt_used	,              
  output reg [DBG_WID*MQNUM-1:0]    dbg                            
);
localparam MQBIT = logb(MQNUM);
reg  [AWID+MQBIT-1:0] mq_waddr    ;
reg  [AWID+MQBIT-1:0] mq_raddr    ;
wire [ 1-1:0]         mq_wen      ;
wire [ 1-1:0]         mq_ren      ;
wire [AWID*MQNUM-1:0] sq_waddr    ;
wire [AWID*MQNUM-1:0] sq_raddr    ;
genvar i;
integer j;
sdp_ram #(
        .RAM_STYLE   ( RAM_STYLE   ),
	.DWID        ( DWID        ), 
	.AWID        ( AWID+MQBIT  ), 
	.DBG_WID     ( DBG_WID     ) 
) inst_sdp_ram (
    .clk     (  clk         ),         
    .waddr   (  mq_waddr    ),         
    .wen     (  mq_wen      ),         
    .wdata   (  wdata       ),         
    .raddr   (  mq_raddr    ),         
    .ren     (  mq_ren      ),         
    .rdata   (  rdata       ),         
    .dbg     (              )          
);
generate
if(MQBIT!=0) begin
	always @ ( * ) begin
		mq_waddr[AWID+MQBIT-1:AWID] = 0;
		mq_waddr[AWID-1      :0   ] = sq_waddr[0*AWID+:AWID];
		for( j=0; j<MQNUM; j=j+1 )begin
			if( wen[j]==1'b1 ) begin
				mq_waddr[AWID+MQBIT-1:AWID] = j;
				mq_waddr[AWID-1      :0   ] = sq_waddr[j*AWID+:AWID];
			end
		end
	end
	always @ ( * ) begin
		mq_raddr[AWID+MQBIT-1:AWID] = 0;
		mq_raddr[AWID-1      :0   ] = sq_raddr[0*AWID+:AWID];
		for( j=0; j<MQNUM; j=j+1 )begin
			if( ren[j]==1'b1 ) begin
				mq_raddr[AWID+MQBIT-1:AWID] = j;
				mq_raddr[AWID-1      :0   ] = sq_raddr[j*AWID+:AWID];
			end
		end
	end
end
else begin
	always @ ( * ) begin
		mq_waddr[AWID-1      :0   ] = sq_waddr[0*AWID+:AWID];
		for( j=0; j<MQNUM; j=j+1 )begin
			if( wen[j]==1'b1 ) begin
				mq_waddr[AWID-1      :0   ] = sq_waddr[j*AWID+:AWID];
			end
		end
	end
	always @ ( * ) begin
		mq_raddr[AWID-1      :0   ] = sq_raddr[0*AWID+:AWID];
		for( j=0; j<MQNUM; j=j+1 )begin
			if( ren[j]==1'b1 ) begin
				mq_raddr[AWID-1      :0   ] = sq_raddr[j*AWID+:AWID];
			end
		end
	end
end
endgenerate
assign mq_wen = |wen[MQNUM-1:0];
assign mq_ren = |ren[MQNUM-1:0];
generate 
for( i=0; i<MQNUM; i=i+1 ) begin
fifo_addr_logic #(
	.AWID (AWID)
	)
inst_waddr(
	.clk         ( clk                    ),
	.rst         ( rst                    ),
	.enb         ( nfull[i]               ),
	.inc         ( wen[i]                 ),
	.addr        ( sq_waddr[i*AWID+:AWID] )
	);
fifo_addr_logic #(
	.AWID (AWID)
	)
inst_raddr(
	.clk         ( clk                    ),
	.rst         ( rst                    ),
	.enb         ( nempty[i]              ),
	.inc         ( ren[i]                 ),
	.addr        ( sq_raddr[i*AWID+:AWID] )
	);
fifo_full_logic #(
	.AWID        ( AWID       ),
	.AFULL_TH    ( AFULL_TH   )
	)
inst_full_logic(
	.wclk        ( clk                             ),
	.wrst        ( rst                             ),
	.wen         ( wen[i]                          ),
	.waddr       ( sq_waddr[i*AWID+:AWID]          ),
	.raddr       ( sq_raddr[i*AWID+:AWID]          ),
	.nfull       ( nfull[i]                        ),
	.nafull      ( nafull[i]                       ),
	.woverflow   ( woverflow[i]                    ),
	.cnt_free    ( cnt_free[(AWID+1)*i +:(AWID+1)] )
	);
fifo_empty_logic #(
	.AWID        ( AWID       ),
	.AEMPTY_TH   ( AEMPTY_TH  )
	)
inst_empty_logic(
	.rclk       ( clk                              ),
	.rrst       ( rst                              ),
	.ren        ( ren[i]                           ),
	.raddr      ( sq_raddr[i*AWID+:AWID]           ),
	.waddr      ( sq_waddr[i*AWID+:AWID]           ),
	.nempty     ( nempty[i]                        ),
	.naempty    ( naempty[i]                       ),
	.roverflow  ( roverflow[i]                     ),
	.cnt_used   ( cnt_used[(AWID+1)*i +:(AWID+1)]  )
	);
always @ ( * ) begin
	dbg[ DBG_WID*i +:DBG_WID ] = { {(DBG_WID-4){1'b0}}, roverflow[i], woverflow[i], nempty[i], nafull[i] };
end
end
endgenerate
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

module sdp_ram #(
    parameter RAM_STYLE  = "distributed",                  
	parameter DWID       = 18, 
	parameter AWID       = 10, 
        parameter INIT_FILE  = "",                        
	parameter DBG_WID    = 32 
) (
  input 					clk,                           
  input  [AWID-1:0]	        waddr,                         
  input 					wen,                           
  input  [DWID-1:0]   	    wdata,                         
  input  [AWID-1:0]         raddr,                         
  input                     ren,                           
  output [DWID-1:0]         rdata,                         
  output [DBG_WID-1:0]      dbg                            
);
generate
if( RAM_STYLE=="block" ) begin : bram
  xilinx_simple_dual_port_1_clock_bram #(
    .RAM_WIDTH(DWID),                  
    .RAM_DEPTH(2**AWID),            
    .RAM_PERFORMANCE("LOW_LATENCY"),      
    .INIT_FILE(INIT_FILE)                        
  ) inst_sync_sdp_ram (
    .addra(waddr),    
    .addrb(raddr),    
    .dina(wdata),     
    .clka(clk),       
    .wea(wen),        
    .enb(ren),        
    .rstb(1'b0),         
    .regceb(1'b0),       
    .doutb(rdata)     
  );
end
else if( RAM_STYLE=="distributed" ) begin : dram
  xilinx_simple_dual_port_1_clock_dram #(
    .RAM_WIDTH(DWID),                  
    .RAM_DEPTH(2**AWID),            
    .RAM_PERFORMANCE("LOW_LATENCY"),      
    .INIT_FILE(INIT_FILE)                        
  ) inst_sync_sdp_ram (
    .addra(waddr),    
    .addrb(raddr),    
    .dina(wdata),     
    .clka(clk),       
    .wea(wen),        
    .enb(ren),        
    .rstb(1'b0),         
    .regceb(1'b0),       
    .doutb(rdata)     
  );
end
else begin : auto
  xilinx_simple_dual_port_1_clock_ram #(
    .RAM_WIDTH(DWID),                  
    .RAM_DEPTH(2**AWID),            
    .RAM_PERFORMANCE("LOW_LATENCY"),      
    .INIT_FILE(INIT_FILE)                        
  ) inst_sync_sdp_ram (
    .addra(waddr),    
    .addrb(raddr),    
    .dina(wdata),     
    .clka(clk),       
    .wea(wen),        
    .enb(ren),        
    .rstb(1'b0),         
    .regceb(1'b0),       
    .doutb(rdata)     
  );
end
endgenerate
assign dbg = {DBG_WID{1'h0}};
endmodule
