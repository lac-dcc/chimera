// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
	module ： MAC_array_control

	input  ： data from preload fifo

	output ： psum_out、valid訊號
	
	產生weight preload 陣列並合併ALU陣列並產生valid訊號

*/
`timescale  10ns / 10ns

`define INST_COMPUTE 32'd87 
`define INST_LOADIFMAPS 32'd88 

module MAC_array_control #(
    parameter integer MAC_NUM = 256,
    parameter integer BRAM_ADDRESS_WIDTH = 12
) 
(
    //golbal
    input wire clk,
    input wire rst_n,

    //data
    input wire [5*MAC_NUM-1:0] ifmaps_from_axis_preload,

    input wire [5*MAC_NUM-1:0] weight_from_bram,

    output wire [6*MAC_NUM-1:0] MAC_out,
    //control
    input wire [MAC_NUM-1:0] enable,
    input wire [1:0] operation,
    input wire [4:0] kernel_size,
    
    input wire load_weight_preload,
    input wire load_MAC_weight,
    input wire load_ifmaps,
    input wire pooling_compute,
    output reg MAC_o_valid,

    input wire ifmaps_fifo_empty

);

    wire [25*MAC_NUM-1:0] weight_from_preload;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            MAC_o_valid<=0;      
        end
        else begin
            MAC_o_valid<=(load_MAC_weight|pooling_compute); 
        end
    end

    /////////////////////instance////////////////////
    genvar idx;
    generate
        for(idx=0;idx<MAC_NUM;idx=idx+1) begin:weight_preload_arr
            weight_preload u_weight_preload(
                .clk                 (clk                                    ),
                .rst_n               (rst_n                                  ),
                .weight_from_bram    (weight_from_bram[idx*5+4 -:5]          ),
                .weight_from_preload (weight_from_preload[idx*25+24 -:25]    ),
                .load_weight_preload (load_weight_preload                    ) 
            ); 
        end
    endgenerate

    MAC_array 
    #(
        .MAC_NUM (MAC_NUM )
    )
    u_MAC_array(
        .clk                         (clk                       ),
        .rst_n                       (rst_n                     ),
        .weight_from_preload         (weight_from_preload       ),
        .ifmaps_from_axis_preload    (ifmaps_from_axis_preload  ),
        .psum_out                    (MAC_out                   ),
        .enable                      (enable                    ),
        .operation                   (operation                 ),
        .kernel_size                 (kernel_size               ),
        .load_ifmaps                 (load_ifmaps               ),
        .load_weight                 (load_MAC_weight           ) 
    );
    
endmodule