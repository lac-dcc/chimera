// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
	module ： MAC_array

	input  ： data from preload fifo

	output ： psum_out
	
	產生ALU陣列並接線，無其餘邏輯

*/
`timescale  10ns / 10ns

module MAC_array #(
    parameter integer MAC_NUM = 256
) 
(
    //global
    input wire clk,
    input wire rst_n,

    //data
    input wire [25*MAC_NUM-1:0] weight_from_preload,
    input wire [5*MAC_NUM-1:0] ifmaps_from_axis_preload,

    output wire [6*MAC_NUM-1:0] psum_out,

    //control
    input wire [MAC_NUM-1:0] enable,
    input wire [1:0] operation,
    input wire [4:0] kernel_size,

    input wire load_ifmaps,
    input wire load_weight
);

    genvar idx;
    generate
        for(idx=0;idx<MAC_NUM;idx=idx+1) begin:ALU_arr

            ALU u_ALU(
                .clk            (clk                                       ),
                .rst_n          (rst_n                                     ),
                .ifmaps_row0_in (ifmaps_from_axis_preload[(idx*5)+0]       ),
                .ifmaps_row1_in (ifmaps_from_axis_preload[(idx*5)+1]       ),
                .ifmaps_row2_in (ifmaps_from_axis_preload[(idx*5)+2]       ),
                .ifmaps_row3_in (ifmaps_from_axis_preload[(idx*5)+3]       ),
                .ifmaps_row4_in (ifmaps_from_axis_preload[(idx*5)+4]       ),
                .weight_in      (weight_from_preload[(idx*25+24) -: 25]    ),
                .MAC_out        (psum_out[(idx*6+5) -: 6]                  ),
                .enable         (enable[idx]                               ),
                .load_ifmaps    (load_ifmaps                               ),
                .load_weight    (load_weight                               ),
                .operation      (operation                                 ),
                .kernel_size    (kernel_size                               )
            );
            
        end
    endgenerate

    
endmodule