// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
	module ： psum_out_data_package

	input  ： data from psum_adder

	output ： M_AXIS data
	
	將psum_adder輸出整形為AXIS所需之輸出

	psum_adder一次僅輸出1bit，故此模組會將1bit包裝至32bit或是所有channel接運算完畢再輸出至axis_master
	假設input channel = 35 則會等35筆psum_adder的輸出，分成32bit及3bit輸出至axis_master

*/
`timescale  10ns / 10ns

	module psum_out_data_package #
	(
		parameter integer C_M_AXIS_TDATA_WIDTH	= 32

	)
	(
		input wire clk,
    	input wire rst_n,
        input wire [1:0] operation,
        input wire [11:0] output_channel_size,
		input wire layer_finish,
        input wire in_valid,
        input wire in_data,

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
	

	///////////////////reg//////////////////////////
    reg [8:0] output_channel_cnt;
	reg [4:0] write_ptr;
	reg write_ptr_31_buf;
	///////////////////wire//////////////////////////
	wire next_package;
	/////////////////////assign////////////////////////
	assign next_package =(output_channel_cnt+9'd1 == output_channel_size);
	///////////////////output//////////////////////////
	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            out_data <= {C_M_AXIS_TDATA_WIDTH{1'd0}};
        end
        else begin
            if (write_ptr == 5'd0 && in_valid) begin
                out_data <= {31'd0,in_data};
            end
            else begin
                out_data[write_ptr] <= in_valid ? in_data : out_data[write_ptr];
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            out_valid <= 1'd0;
        end
        else begin
            out_valid <= ((in_valid && (write_ptr == 5'd31)) || (layer_finish && (operation == 2'd0)) || (in_valid && next_package));
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            write_ptr_31_buf <= 1'd0;
        end
        else begin
            write_ptr_31_buf <= (write_ptr == 5'd31);
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            out_last <= 1'd0;
        end
        else begin
            out_last <= layer_finish;
        end
    end

	/////////////////////write_ptr///////////////////////
	always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            write_ptr <= 5'd0;
        end
        else begin
            write_ptr <= (layer_finish) ? 5'd0 :
                         in_valid     ? (next_package ? 5'd0 : write_ptr+5'd1) : write_ptr;
        end
    end
    ////////////////////output_channel_cnt/////////////
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            output_channel_cnt <= 9'd0;
        end
        else begin
            output_channel_cnt <=  in_valid ? (next_package ? 9'd0 : output_channel_cnt+9'd1) : output_channel_cnt;
        end
    end
	//=================================================================================
endmodule
