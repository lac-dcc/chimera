// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux_8x1 (
  input [7:0] data,
  input [2:0] sel,
  output reg out
);

always @* begin
  case (sel)
    3'b000: out = data[0];
    3'b001: out = data[1];
    3'b010: out = data[2];
    3'b011: out = data[3];
    3'b100: out = data[4];
    3'b101: out = data[5];
    3'b110: out = data[6];
    3'b111: out = data[7];
    default: out = 1'bz; 
  endcase
end

endmodule

module mux_16x1 (
  input [15:0] data,
  input [3:0] sel,
  output reg out
);

wire [7:0] mux_1_out;

mux_8x1 mux_1 (
  .data(data[7:0]),
  .sel(sel[2:0]),
  .out(mux_1_out[0])
);

mux_8x1 mux_2 (
  .data(data[15:8]),
  .sel(sel[2:0]),
  .out(mux_1_out[1])
);

always @* begin
  case (sel[3])
    1'b0: out = mux_1_out[0];
    1'b1: out = mux_1_out[1];
  endcase
end

endmodule

