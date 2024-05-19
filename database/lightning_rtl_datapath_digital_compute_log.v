// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none


module log # (
    parameter DATA_WIDTH = 16,
    parameter MEM_LEN = 8192
)(
    input wire clk,
    input wire rst,

    input wire [DATA_WIDTH-1:0] input_tdata,
    input wire input_tvalid,
    // output wire input_tready,
    input wire input_tlast,

    output wire [15:0] output_tdata,
    output wire output_tvalid,
    output wire output_tlast
    // input wire output_tready
);
    wire ENQ;
    wire DEQ;
    reg tvalid;
    reg tlast;
    reg [15:0] tdata;

    wire [15:0] log_lut_tdata;                // XXXX

    assign ENQ = input_tvalid && (!tvalid || DEQ);
    assign DEQ = tvalid;

    assign output_tdata = tdata;
    assign output_tlast = tlast;
    assign output_tvalid = tvalid;

    // assign input_tready = output_tready || !output_tvalid;

    always @ (posedge clk) begin
        tdata <= (rst) ? 'b0
               : (ENQ) ? log_lut_tdata
               : tdata;
        tvalid <= (rst) ? 1'b0
                : (ENQ) ? 1'b1
                : (DEQ) ? 1'b0
                : tvalid;
        tlast <= (rst) ? 1'b0
               : (ENQ) ? input_tlast
               : (DEQ) ? 1'b0
               : tlast;
        if (input_tvalid && input_tdata[DATA_WIDTH-1:18] != 0) begin
            $display("ERROR! input to log overflows LUT %h", input_tdata);
        end
    end

    reg [15:0] log_lut[0:MEM_LEN-1];

    assign log_lut_tdata = log_lut[input_tdata[17:5]];

    initial begin
        `include "../sram/nonlinear_lut/log_lut.v"
    end

endmodule

`resetall
