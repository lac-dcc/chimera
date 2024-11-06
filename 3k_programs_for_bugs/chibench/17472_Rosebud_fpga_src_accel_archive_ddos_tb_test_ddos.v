// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module test_ddos #(
  parameter TIME_WIDTH = 25,
  parameter CNT_WIDTH  = 10,
  parameter HASH_BITS  = 16
)(
  input  wire             clk,
  input  wire             rst,

  input  [15:0]           len_thresh,
  input  [TIME_WIDTH-1:0] time_thresh,
  input                   alert,

  input  [31:0]           dst_ip,
  input  [15:0]           payload_len,
  input                   hdr_valid,
  output                  ready,

  output [CNT_WIDTH-1:0]  occurence,
  output                  alerted,
  output                  occ_valid
);

  ddos_detector # (
    .TIME_WIDTH(TIME_WIDTH),
    .CNT_WIDTH(CNT_WIDTH),
    .HASH_BITS(HASH_BITS)
  ) ddos_inst (
    .clk(clk),
    .rst(rst),

    .len_thresh(len_thresh),
    .time_thresh(time_thresh),
    .alert(alert),

    .dst_ip(dst_ip),
    .payload_len(payload_len),
    .hdr_valid(hdr_valid),
    .ready(ready),

    .init_wr_addr(),
    .init_wr_en(1'b0),

    .occurence(occurence),
    .alerted(alerted),
    .occ_valid(occ_valid)
  );

  ///////////////////////////////////////////////
  ////////////// Generating Waveform ////////////
  ///////////////////////////////////////////////
  localparam LINE_WIDTH = TIME_WIDTH + CNT_WIDTH + 1;
  localparam URAM_WIDTH = 2 * LINE_WIDTH;

  integer i;
  initial begin
    for (i = 0; i < 2**(HASH_BITS-1); i = i + 1)
            ddos_inst.mem[i] = {URAM_WIDTH{1'b0}};

    $dumpfile ("sim_build/test_ddos.fst");
    $dumpvars (0,test_ddos);
    #1;
  end

endmodule
