module wburst_counter #(
  parameter integer WBURST_COUNTER_LEN    = 16,
  parameter integer WBURST_LEN            = 4,
  parameter integer MAX_BURST_LEN         = 16
)(
  input  wire                             clk,
  input  wire                             resetn,
  input  wire                             write_valid,
  input  wire                             write_flush,

  output wire [WBURST_LEN-1:0]            wburst_len,
  output wire                             wburst_len_push,
  output wire                             wburst_ready,

  input  wire                             wburst_issued,
  input  wire [WBURST_LEN-1:0]            wburst_issued_len
);


  wire flush;

  reg  [WBURST_COUNTER_LEN-1:0] write_count;

  reg wr_flush_sticky;

  always @(posedge clk)
  begin
    if (resetn == 0 || write_count == 0)
      wr_flush_sticky <= 0;
    else if (write_flush)
      wr_flush_sticky <= 1;
  end

  assign flush = wr_flush_sticky && write_count!=0;

  //assign wburst_ready = ((write_count >= MAX_BURST_LEN) || wr_flush_sticky) && !wburst_ready_d && write_count != 0;
  assign wburst_ready = ((write_count >= MAX_BURST_LEN) || wr_flush_sticky) && write_count != 0;
  assign wburst_len = write_count >= MAX_BURST_LEN ? MAX_BURST_LEN - 1 :
                      write_count != 0 ? write_count - 1 : 0;
  reg wburst_ready_d;

  always @(posedge clk)
  begin
    if (resetn)
      wburst_ready_d <= wburst_ready;
    else
      wburst_ready_d <= 0;
  end

  always @(posedge clk)
  begin
    if (!resetn)
      write_count <= 0;
    else if (write_valid)
    begin
      if (wburst_issued)
        write_count <= write_count - wburst_issued_len;
      else
        write_count <= write_count + 1;
    end else begin
      if (wburst_issued)
        write_count <= write_count - wburst_issued_len - 1;
      else
        write_count <= write_count + 0;
    end
  end

  assign wburst_len_push = wburst_ready && !wburst_ready_d;

endmodule
