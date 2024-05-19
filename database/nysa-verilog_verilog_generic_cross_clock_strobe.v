// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

module cross_clock_strobe (
  input         rst,
  input         in_clk,
  input         in_stb,

  input         out_clk,
  output        out_stb
);

//parameters
//registers/wires
reg             toggle_stb;
reg       [2:0] sync_out_clk;
//submodules
//asynchronous logic
assign          out_stb = (sync_out_clk[2] ^ sync_out_clk[1]);
//synchronous logic

always @ (posedge in_clk) begin
  if (rst) begin
    toggle_stb    <=  0;
  end
  else begin
    if (in_stb) begin
      toggle_stb  <=  ~toggle_stb;
    end
  end
end

always @ (posedge out_clk) begin
  if (rst) begin
    sync_out_clk  <=  0;
  end
  else begin
    sync_out_clk  <=  {sync_out_clk[1:0], toggle_stb};
  end
end

endmodule
