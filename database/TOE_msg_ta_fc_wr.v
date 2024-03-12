`timescale 1ns / 1ps
module fc_wr #(
		parameter    DWID         = 128 				    ,  
		parameter    SOP_LSB      = 1    				    ,  
		parameter    SOP_MSB      = 1    				       
)(
		input	wire					clk  				,
		input 	wire					rst					,
		input 	wire [1-1:0] 			in_cell_vld			,           
		output 	wire [1-1:0] 			in_cell_rdy			,           
		input 	wire [DWID-1:0] 		in_cell_dat			,           
		output  wire [1-1:0]            fst_cell_wen 		,			
		input   wire [1-1:0]            fst_cell_nafull 	, 			
		output  wire [DWID-1:0]         fst_cell_wdata 		 			
);
integer   				  i							;
wire     				  sop_flag                  ;
assign sop_flag = in_cell_dat[SOP_MSB: SOP_LSB];
assign fst_cell_wen = ( sop_flag==1'b1 && in_cell_vld==1'b1 ) ? 1'b1 : 1'b0;
assign fst_cell_wdata = in_cell_dat;
assign in_cell_rdy = fst_cell_nafull;
endmodule
