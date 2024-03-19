/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: relu.v
File Explanation: this module implements the ReLU function in verilog
File Start Time: December 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/


`resetall
`timescale 1ns / 1ps
`default_nettype none


module relu # (
    parameter DATA_WIDTH = 16
)(
    input wire clk,
    input wire rst,

    input wire [DATA_WIDTH-1:0] pre_relu_tdata,
    input wire pre_relu_tvalid,

    output wire [DATA_WIDTH-1:0] post_relu_tdata,
    output wire post_relu_tvalid
);
    reg [DATA_WIDTH-1:0] relu_tdata;
    reg relu_tvalid;

    assign post_relu_tdata = relu_tdata;
    assign post_relu_tvalid = relu_tvalid;

    always @ (posedge clk)
        if (rst) begin
            relu_tdata <= {DATA_WIDTH{1'b0}};
            relu_tvalid <= 1'b0;
        end else if (pre_relu_tvalid) begin
            relu_tdata <= (pre_relu_tdata[15] == 0)? pre_relu_tdata : 16'd0; // a ReLU function, based on sign bit
            relu_tvalid <= 1'b1;
        end else begin
            relu_tdata <= {DATA_WIDTH{1'b0}};
            relu_tvalid <= 1'b0;
        end

endmodule


`resetall
