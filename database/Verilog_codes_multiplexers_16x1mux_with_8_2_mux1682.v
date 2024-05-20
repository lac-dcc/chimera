// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux_16x1 (
    input wire [15:0] data_in,  // Input data lines
    input wire [3:0] select,    // Selection lines
    output reg data_out         // Output data
);

wire [7:0] mux1_out;  // Output of the first 8x1 mux
wire [7:0] mux2_out;  // Output of the second 8x1 mux

// First 8x1 multiplexer
mux_8x1 mux1 (
    .data_in(data_in[7:0]),
    .select(select[3:2]),
    .data_out(mux1_out)
);

// Second 8x1 multiplexer
mux_8x1 mux2 (
    .data_in(data_in[15:8]),
    .select(select[1:0]),
    .data_out(mux2_out)
);

// Final 2x1 multiplexer
mux_2x1 mux_final (
    .data_in_0(mux1_out),
    .data_in_1(mux2_out),
    .select(select[3]),
    .data_out(data_out)
);

endmodule

module mux_8x1 (
    input wire [7:0] data_in,   // Input data lines
    input wire [2:0] select,    // Selection lines
    output reg data_out         // Output data
);

// 8x1 MUX implementation

always @(*) begin
    case(select)
        3'b000: data_out = data_in[0];
        3'b001: data_out = data_in[1];
        3'b010: data_out = data_in[2];
        3'b011: data_out = data_in[3];
        3'b100: data_out = data_in[4];
        3'b101: data_out = data_in[5];
        3'b110: data_out = data_in[6];
        3'b111: data_out = data_in[7];
        default: data_out = 1'bx; // Handle default case
    endcase
end

endmodule

module mux_2x1 (
    input wire [7:0] data_in_0,  // Input data line 0
    input wire [7:0] data_in_1,  // Input data line 1
    input wire select,           // Selection line
    output wire [7:0] data_out   // Output data
);

// 2x1 MUX implementation
assign data_out = select ? data_in_1 : data_in_0;

endmodule
