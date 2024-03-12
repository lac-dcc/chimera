// This module fetches video data from DRAM

`include "tune.v"

module video_fetch
(
  // clocks
  input  wire       clk,

  // control
  input  wire [3:0]  f_sel,
  input  wire [1:0]  b_sel,
  input  wire        fetch_stb,

  // video data
  output reg  [31:0] fetch_data,
  output reg  [31:0] fetch_temp,

  // DRAM interface
  input  wire        video_strobe,
  input  wire [15:0] video_data
);

  always @(posedge clk) if (video_strobe)
  begin
    if (f_sel[0]) fetch_temp[ 7: 0] <= b_sel[0] ? video_data[15:8] : video_data[ 7:0];
    if (f_sel[1]) fetch_temp[15: 8] <= b_sel[1] ? video_data[15:8] : video_data[ 7:0];
    if (f_sel[2]) fetch_temp[23:16] <= video_data[ 7:0];
    if (f_sel[3]) fetch_temp[31:24] <= video_data[15:8];
  end

  always @(posedge clk) if (fetch_stb)
    fetch_data <= fetch_temp;

endmodule
