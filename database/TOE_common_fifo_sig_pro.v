`timescale 1ns / 1ps
module fifo_addr_cdc_tf #(
	parameter AWID       = 10
) (
  input 					clk_in,                    
  input 					rst_in,                    
  input 					clk_out,                   
  input 					rst_out,                   
  input  [AWID-1:0]			addr_in,                       
  output [AWID-1:0]			addr_out                       
);
wire  [AWID-1:0]			addr_in_gray;             
wire  [AWID-1:0]			addr_in_gray_new_clk;     
wire  [AWID-1:0]			addr_out_binary;          
assign addr_in_gray = binary2gray( addr_in );
async_convert #(
		.DWID(AWID),
		.DLY_NUM(3)
)
inst_async_convert(
		.clk_in  ( clk_in  ),
		.rst_in  ( rst_in  ),
		.clk_out ( clk_out ),
		.rst_out ( rst_out ),
		.din     ( addr_in_gray         ),
		.dout    ( addr_in_gray_new_clk )
);
assign addr_out_binary     = gray2binary( addr_in_gray_new_clk );
data_dly #(
		.DWID(AWID),
		.DLY_NUM(1)
)
inst_data_pipe(
		.clk     ( clk_out  ),
		.rst     ( rst_out  ),
		.din     ( addr_out_binary   ),
		.dout    ( addr_out          )
);
/* Logic is to get Gray code from Binary code */
function[AWID-1:0] binary2gray ;
    input[AWID-1:0] value;
    integer i;
    begin 
        binary2gray[AWID-1] = value[AWID-1];
        for (i=AWID-1; i>0; i = i - 1)
            binary2gray[i-1] = value[i] ^ value[i - 1];
    end
endfunction
/* Logic is to get binary code from gray code */
function[AWID-1:0] gray2binary ;
    input[AWID-1:0] value;
    integer i;
    begin 
        gray2binary[AWID-1] = value[AWID-1];
        for (i=AWID-1; i>0; i = i - 1)
            gray2binary[i-1] = gray2binary[i] ^ value[i - 1];
    end
endfunction
endmodule

`timescale 1ns / 1ps
module fifo_addr_logic #(
	parameter AWID       = 10
) (
  input 		    clk,                          
  input 		    rst,                          
  input 		    enb,                          
  input 		    inc,                          
(* max_fanout=100 *)output reg  [AWID-1:0]    addr                          
);
always@(posedge clk or posedge rst) begin
		if( rst==1'b1 ) begin
				addr <= 0;
		end
		else begin
				if( inc==1'b1 && enb==1'b1 )begin
						addr <= addr + 1'b1;
				end
		end
end
endmodule

`timescale 1ns / 1ps
module fifo_empty_logic #(
	parameter AWID             = 10   ,
	parameter AEMPTY_TH        = 4    ,
    parameter FLAG_ENABLE_STOP = 1'b1
) (
  input 					rclk,                           
  input 					rrst,                           
  input 					ren ,                           
  input  [AWID-1:0]			raddr,                          
  input  [AWID-1:0]			waddr,                          
  output reg                nempty,                          
  output reg                naempty,                         
  output reg                roverflow,                      
  output reg [AWID:0]       cnt_used                        
);
reg  [AWID-1:0]			waddr_dly;                         
wire [AWID-1:0]         cnt_used_comb;
assign cnt_used_comb = waddr - raddr;
always@(posedge rclk or posedge rrst) begin
		if( rrst==1'b1 ) begin
				waddr_dly <= 0;
		end
		else begin
				waddr_dly <= waddr;
		end
end
always@(posedge rclk or posedge rrst) begin
		if( rrst==1'b1 ) begin
				nempty <= 1'b0;
		end
		else begin
				if( ren==1'b1 && cnt_used_comb==1 )begin  
						nempty <= 1'b0;
				end
				else if( waddr!=waddr_dly ) begin
						nempty <= 1'b1;
				end
		end
end
always@(posedge rclk or posedge rrst) begin
		if( rrst==1'b1 ) begin
				naempty <= 1'b0;
		end
		else begin
				if( cnt_used_comb < AEMPTY_TH  && cnt_used_comb!=0 || nempty==1'b0 )begin  
						naempty <= 1'b0;
				end
				else if( waddr!=waddr_dly ) begin
						naempty <= 1'b1;
				end
		end
end
always@(posedge rclk or posedge rrst) begin
        if( rrst==1'b1 ) begin
                roverflow <= 1'b0;
        end
        else begin
                if( ren==1'b1 && nempty==1'b0 )begin
                        roverflow <= 1'b1;
                        /* synthesis translate_off */
                        $error("%t, %m, ERROR: roverflow happen", $time );
                        #1000;
                        if( FLAG_ENABLE_STOP==1'b1 ) begin
                                $stop;
                        end
                        /* synthesis translate_on */
                end
        end
end
always@(posedge rclk or posedge rrst) begin
		if( rrst==1'b1 ) begin
			cnt_used <= 0;
		end
		else begin
				if( waddr==raddr && nempty==1'b1 )begin 
						cnt_used <= 2**AWID;
				end
				else begin
						cnt_used <= cnt_used_comb;
				end
		end
end
endmodule

`timescale 1ns / 1ps
module fifo_full_logic #(
	parameter AWID             = 10   ,
	parameter AFULL_TH         = 4    ,
    parameter FLAG_ENABLE_STOP = 1'b1  
) (
  input 					wclk,                           
  input 					wrst,                           
  input 					wen ,                           
  input  [AWID-1:0]			waddr,                          
  input  [AWID-1:0]			raddr,                          
  output reg                nfull,                          
  output reg                nafull,                         
  output reg                woverflow,                      
  output reg [AWID:0]       cnt_free                        
);
reg  [AWID-1:0]			raddr_dly;                         
wire [AWID-1:0]         cnt_free_comb;
assign cnt_free_comb = raddr - waddr;
always@(posedge wclk or posedge wrst) begin
		if( wrst==1'b1 ) begin
				raddr_dly <= 0;
		end
		else begin
				raddr_dly <= raddr;
		end
end
always@(posedge wclk or posedge wrst) begin
		if( wrst==1'b1 ) begin
				nfull <= 1'b1;
		end
		else begin
				if( wen==1'b1 && cnt_free_comb==1 )begin  
						nfull <= 1'b0;
				end
				else if( raddr!=raddr_dly ) begin
						nfull <= 1'b1;
				end
		end
end
always@(posedge wclk or posedge wrst) begin
		if( wrst==1'b1 ) begin
				nafull <= 1'b1;
		end
		else begin
				if( cnt_free_comb < AFULL_TH  && cnt_free_comb!=0 || nfull==1'b0 )begin  
						nafull <= 1'b0;
				end
				else if( raddr!=raddr_dly ) begin
						nafull <= 1'b1;
				end
		end
end
always@(posedge wclk or posedge wrst) begin
        if( wrst==1'b1 ) begin
                woverflow <= 1'b0;
        end
        else begin
                if( wen==1'b1 && nfull==1'b0 )begin
                        woverflow <= 1'b1;
                        /* synthesis translate_off */
                        $error("%t, %m, ERROR: woverflow happen", $time );
                        #1000;
                        if( FLAG_ENABLE_STOP==1'b1 ) begin
                                $stop;
                        end
                        /* synthesis translate_on */
                end
        end
end
always@(posedge wclk or posedge wrst) begin
		if( wrst==1'b1 ) begin
				cnt_free <= 2**AWID;
		end
		else begin
				if( waddr==raddr && nfull==1'b1 )begin 
						cnt_free <= 2**AWID;
				end
				else begin
						cnt_free <= cnt_free_comb;
				end
		end
end
endmodule
`timescale 1ns / 1ps
module fifo_rdif_tf #(
        parameter DWID       = 18, 
        parameter AWID       = 10
) (
        input                     clk,                          
        input                     rst,                          
        output reg                old_ren,                           
        input  [DWID-1:0]         old_rdata,                         
        input                     old_nempty,                        
        input                     new_ren,                           
        output     [DWID-1:0]     new_rdata,                         
        output reg                new_nempty,                        
        output reg                new_roverflow                      
);
always@( * )begin
        if ( old_nempty==1'b1 && new_nempty==1'b0 ) begin
                old_ren = 1'b1;
        end
        else if( old_nempty==1'b1 && new_ren==1'b1 ) begin
                old_ren = 1'b1;
        end
        else begin
                old_ren = 1'b0;
        end
end
always@( posedge clk or posedge rst )begin
        if( rst==1'b1 ) begin
                new_nempty <= 1'b0;
        end
        else begin
                if( old_ren==1'b1 ) begin 
                        new_nempty <= 1'b1;
                end
                else if( new_ren==1'b1 )begin 
                        new_nempty <= 1'b0;
                end
        end
end
(* max_fanout=100 *)reg                old_ren_dly;
reg [DWID-1:0]     old_rdata_latch;           
always@( posedge clk or posedge rst )begin
        if( rst==1'b1 ) begin
                old_ren_dly <= 1'b0;
        end
        else begin
                old_ren_dly <= old_ren;
        end
end
always@( posedge clk  )begin
    if( old_ren_dly==1'b1 ) begin
            old_rdata_latch <= old_rdata;
    end
end
assign new_rdata = (old_ren_dly==1'b1) ? old_rdata : old_rdata_latch;
always@( posedge clk or posedge rst )begin
        if( rst==1'b1 ) begin
                new_roverflow <= 1'b0;
        end
        else begin
                if( new_ren==1'b1 && new_nempty==1'b0 ) begin 
                        new_roverflow <= 1'b1;
                        /* synthesis translate_off */
                        $display("%t, %m, ERROR: roverflow happen", $time );
                        #100;
                        $stop;
                        /* synthesis translate_on */
                end
        end
end
endmodule