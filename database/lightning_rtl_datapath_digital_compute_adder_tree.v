// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none


module adder_tree # (
    parameter IN_DATA_WIDTH = 256,
    parameter OUT_DATA_WIDTH = 16
)(
    input wire clk,
    input wire rst,

    input wire [IN_DATA_WIDTH-1:0] s_tdata,  // we assume the number here is signed
    input wire s_tvalid,

    output wire [OUT_DATA_WIDTH-1:0] m_tdata,
    output wire m_tvalid
);
    reg [15:0] r1_adder_1;
    reg [15:0] r1_adder_2;
    reg [15:0] r1_adder_3;
    reg [15:0] r1_adder_4;
    reg [15:0] r1_adder_5;
    reg [15:0] r1_adder_6;
    reg [15:0] r1_adder_7;
    reg [15:0] r1_adder_8;

    reg [15:0] r2_adder_1;
    reg [15:0] r2_adder_2;
    reg [15:0] r2_adder_3;
    reg [15:0] r2_adder_4;

    reg [15:0] r3_adder_1;
    reg [15:0] r3_adder_2;

    reg [15:0] r4_adder_1;

    reg r1_valid;
    reg r2_valid;
    reg r3_valid;
    reg r4_valid;

    assign m_tdata = r4_adder_1;
    assign m_tvalid = r4_valid;

    always @ (posedge clk) begin
        if (rst) begin
            r1_adder_1 <= 16'd0;
            r1_adder_2 <= 16'd0;
            r1_adder_3 <= 16'd0;
            r1_adder_4 <= 16'd0;
            r1_adder_5 <= 16'd0;
            r1_adder_6 <= 16'd0;
            r1_adder_7 <= 16'd0;
            r1_adder_8 <= 16'd0;
            r1_valid <= 1'b0;

            r2_adder_1 <= 16'd0;
            r2_adder_2 <= 16'd0;
            r2_adder_3 <= 16'd0;
            r2_adder_4 <= 16'd0;
            r2_valid <= 1'b0;

            r3_adder_1 <= 16'd0;
            r3_adder_2 <= 16'd0;
            r3_valid <= 1'b0;

            r4_adder_1 <= 16'd0;
            r4_valid <= 1'b0;

        end else begin
            r1_adder_1 <= s_tdata[15:0] + s_tdata[31:16];
            r1_adder_2 <= s_tdata[47:32] + s_tdata[63:48];
            r1_adder_3 <= s_tdata[79:64] + s_tdata[95:80];
            r1_adder_4 <= s_tdata[111:96] + s_tdata[127:112];
            r1_adder_5 <= s_tdata[143:128] + s_tdata[159:144];
            r1_adder_6 <= s_tdata[175:160] + s_tdata[191:176];
            r1_adder_7 <= s_tdata[207:192] + s_tdata[223:208];
            r1_adder_8 <= s_tdata[239:224] + s_tdata[255:240];
            r1_valid <= s_tvalid;

            r2_adder_1 <= r1_adder_1 + r1_adder_2;
            r2_adder_2 <= r1_adder_3 + r1_adder_4;
            r2_adder_3 <= r1_adder_5 + r1_adder_6;
            r2_adder_4 <= r1_adder_7 + r1_adder_8;
            r2_valid <= r1_valid;

            r3_adder_1 <= r2_adder_1 + r2_adder_2;
            r3_adder_2 <= r2_adder_3 + r2_adder_4;
            r3_valid <= r2_valid;

            r4_adder_1 <= r3_adder_1 + r3_adder_2;
            r4_valid <= r3_valid;
        end
    end
        
endmodule


`resetall
