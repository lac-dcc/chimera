// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none


module exp # (
    parameter DATA_WIDTH = 16,
    parameter MEM_LEN = 12
)(
    input wire clk,
    input wire rst,

    input wire [DATA_WIDTH-1:0] input_tdata,
    input wire input_tvalid,
    // output wire input_tready,
    input wire input_tlast,

    output reg [DATA_WIDTH-1:0] output_tdata,
    output reg output_tvalid,
    // input wire output_tready,
    output reg output_tlast
);

    // exp for inputs between 0 and 11
    // overflows for inputs greater than 11
    wire [DATA_WIDTH-1:0] exp_value =
			  ($signed(input_tdata) < $signed(16'd0)) ? 16'd0
			  : (input_tdata == 16'd0) ? 16'd1
			  : (input_tdata == 16'd1) ? 16'd3
			  : (input_tdata == 16'd2) ? 16'd7
			  : (input_tdata == 16'd3) ? 16'd20
			  : (input_tdata == 16'd4) ? 16'd55
			  : (input_tdata == 16'd5) ? 16'd148
			  : (input_tdata == 16'd6) ? 16'd403
			  : (input_tdata == 16'd7) ? 16'd1096
			  : (input_tdata == 16'd8) ? 16'd2980
			  : (input_tdata == 16'd9) ? 16'd8103
			  : (input_tdata == 16'd10) ? 16'd2206
			  : (input_tdata == 16'd11) ? 16'd59874
			  : 16'hffff;

    always @ (posedge clk) begin
        output_tdata <= (rst) ? 'b0 : exp_value;
        output_tvalid <= (rst) ? 'b0 : input_tvalid;
        output_tlast <= (rst) ? 1'b0 : input_tlast;
        // if (input_tvalid) begin
        //     $display("exp input %d -> %d", $signed(input_tdata), exp_value);
        // end
    end

endmodule

`resetall
