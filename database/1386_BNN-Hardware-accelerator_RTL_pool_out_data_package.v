// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
	module ： pool_out_data_package

	input  ： data from MAC

	output ： M_AXIS data
	
	將MAC輸出整形為AXIS所需之輸出

	MAC之輸出最多會同時有256bit，此模組將其用計數器以32bit分段輸出至axis_master

*/
`timescale  10ns / 10ns

	module pool_out_data_package #
	(
		parameter integer C_M_AXIS_TDATA_WIDTH	= 32
	)
	(
		input wire clk,
    	input wire rst_n,

		input wire layer_finish,
        input wire MAC_o_valid,
        input wire [255:0]MAC_out,

		input wire [11:0] input_channel_size,
		input wire [2:0] stride,

        output reg pooling_finish,
		
        output reg out_valid,
        output reg out_last,
        output reg [C_M_AXIS_TDATA_WIDTH-1:0] out_data

	);
	//=================================================================================

	///////////////////function//////////////////////////
	function integer clogb2 (input integer bit_depth);                                   
	  begin                                                                              
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
	      bit_depth = bit_depth >> 1;                                                    
	  end                                                                                
	endfunction  
	///////////////////localparam////////////////////////
	localparam IDLE 	= 2'd0;
    localparam OUT 		= 2'd1;
	///////////////////reg//////////////////////////
	reg [1:0] state;
	reg [3:0] transfer_cnt;

	reg last_buf;
	///////////////////wire//////////////////////////
	wire [3:0] transfer_num;
	assign transfer_num = (input_channel_size[11:5]+(|input_channel_size[4:0]))-4'd1;
	////////////////////output/////////////////////////
	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
           	out_valid <= 1'd0;
        end
        else begin
			out_valid <= (state==OUT);
        end
    end
	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
           	out_last <= 1'd0;
        end
        else begin
			out_last <= ((transfer_cnt==transfer_num) && last_buf);
        end
    end
	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
           	out_data <= 32'd0;
        end
        else begin
			out_data <= MAC_out[transfer_cnt*32 +: 32];
        end
    end
	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
           	pooling_finish <= 1'd0;
        end
        else begin
			pooling_finish <= ((transfer_cnt==transfer_num) && (state == OUT));
        end
    end
	////////////////////state//////////////////////////
	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
           	state <= IDLE;
        end
        else begin
			case(state)
				IDLE	: state <= MAC_o_valid ? OUT : IDLE;
				OUT		: state <= (transfer_cnt==transfer_num) ? IDLE : OUT;
			endcase
        end
    end

	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
           	transfer_cnt <= 4'd0;
        end
        else begin
			transfer_cnt <= (state == OUT) ? ((transfer_cnt == transfer_num) ? transfer_cnt : transfer_cnt+4'd1) : 4'd0;
        end
    end

	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
           	last_buf <= 1'd0;
        end
        else begin
			last_buf <= (state == IDLE && layer_finish) ? 1'd1:
						(state == OUT && (transfer_cnt==transfer_num)) ? 1'd0 : last_buf;
        end
    end

	//=================================================================================
endmodule
