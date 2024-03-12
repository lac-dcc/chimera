`timescale 1ns / 1ps
module cpkt_mux #(
    parameter    CHN0_HPRIORY = 0 ,   
		parameter    UNUM         = 128 							,               
		parameter    ID_WID       = logb(UNUM)						,
		parameter    CELLSZ       = 1 								,               
		parameter    GAP          = 2 								,               
		parameter    DWID         = 12 								,               
		parameter    DBG_WID	  = 32    							 				
) (
		input	wire							clk		 			,
		input 	wire							rst					,
		output  reg  [1*UNUM-1:0] 				in_cpkt_ren			,           
		input   wire [DWID*UNUM-1:0] 			in_cpkt_rdata		,           
		input   wire [1*UNUM-1:0] 				in_cpkt_nempty		,           
	    output  reg  [1-1:0] 					out_info_wen        ,          	
	    output  reg  [ID_WID-1:0] 			    out_info_wdata      ,           
	    input  	wire [1-1:0] 					out_info_nafull     ,           
	    output  reg  [1-1:0] 					out_cpkt_wen        ,          	
	    output  reg  [DWID-1:0] 				out_cpkt_wdata      ,           
	    input  	wire [1-1:0] 					out_cpkt_nafull     ,           
		output	wire [DBG_WID-1:0]				dbg_sig							
);
reg  [7:0]						cnt_clk     ;
reg  [1-1:0] 					get_gnt		;
wire [1*UNUM-1:0] 				gnt			;
wire [ID_WID-1:0] 				gnt_id		;
reg  [ID_WID-1:0] 				gnt_id_reg	;
wire [1*UNUM-1:0] 				in_cpkt_nempty_tmp;	
generate 
        if (CHN0_HPRIORY == 0 ) begin   
           rr_arb #(.REQ_NUM(UNUM) ) u_rr_arb( .clk(clk), .rst(rst), .req(in_cpkt_nempty), .get_gnt( get_gnt ), .gnt(gnt), .gnt_id(gnt_id) );
        end
        else  begin
           assign in_cpkt_nempty_tmp = (in_cpkt_nempty[0]==1'b1) ? { {(UNUM-1){1'b0}}, 1'b1} : in_cpkt_nempty;
           rr_arb #(.REQ_NUM(UNUM) ) u_rr_arb( .clk(clk), .rst(rst), .req(in_cpkt_nempty_tmp), .get_gnt( get_gnt ), .gnt(gnt), .gnt_id(gnt_id) );
        end
endgenerate
always @ ( posedge clk or posedge rst ) begin
		if( rst==1'b1 ) begin
				cnt_clk <= 0;
				get_gnt <= 0;
		end
		else begin
				if( cnt_clk>(GAP-1) && gnt!=0 ) begin
						cnt_clk <= 0;
						get_gnt <= (out_cpkt_nafull==1'b1 && out_info_nafull==1'b1) ? 1'b1 : 1'b0;
				end
				else begin
						cnt_clk <= cnt_clk+1'b1;
						get_gnt <= 1'b0;
				end
		end
end
wire get_gnt_dly;
ctrl_dly #( .DWID(1), .DLY_NUM(CELLSZ) ) u_ctrl_pipe_get_gnt( .clk(clk), .rst(rst), .din( get_gnt ), .dout( get_gnt_dly ) );
always @ ( posedge clk or posedge rst ) begin
		if( rst==1'b1 ) begin
				in_cpkt_ren     <= 0;
				gnt_id_reg  	<= 0;
		end
		else begin
				if( get_gnt==1'b1 ) begin
						in_cpkt_ren <= gnt;
						gnt_id_reg  <= gnt_id 	;
				end
				else if( get_gnt_dly==1'b1 ) begin
						in_cpkt_ren <= 0;
				end
		end
end
always @ ( posedge clk or posedge rst ) begin
        if( rst==1'b1 ) begin
                out_info_wen   <= 0;
                out_info_wdata <= 0;
                out_cpkt_wen   <= 0;
                out_cpkt_wdata <= 0;
        end
        else begin
                out_info_wen   <= get_gnt	;
                if( get_gnt==1'b1 ) begin
                        out_info_wdata <= gnt_id 	;
                end
                out_cpkt_wen   <= |in_cpkt_ren	;
                out_cpkt_wdata <= in_cpkt_rdata[gnt_id_reg*DWID+:DWID];
                end
        end
assign dbg_sig = 32'h0;
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
