// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module flip_flop_fifo
# (
	parameter width = 0,
				 depth = 10
)
(
  input              clk,
  input              rst,
  input              push,
  input              pop,
  input  [width-1:0] write_data,
  output [width-1:0] read_data,
  output             empty,
  output             full
);

  localparam pointer_width = $clog2 (depth),
             counter_width = $clog2 (depth + 1);

  localparam [counter_width - 1:0] max_ptr = counter_width' (depth - 1);

  logic [pointer_width - 1:0] wr_ptr, rd_ptr;
  logic [counter_width - 1:0] cnt;

  reg [width - 1:0] data [depth - 1:0];

  //--------------------------------------------------------------------------

  always @ (posedge clk)
    if (rst) begin
      wr_ptr <= '0;
		rd_ptr <= '0;
    end else if (push&~full)
      wr_ptr <= (wr_ptr == max_ptr) ? '0 : wr_ptr + 1'b1;
	 else if (pop&~empty)
		rd_ptr <= (rd_ptr == max_ptr) ? '0 : rd_ptr + 1'b1; 
		

  // TODO: Add logic for rd_ptr

  //--------------------------------------------------------------------------

  always @ (posedge clk)
    if (push)
      data[wr_ptr] <= write_data;

  assign read_data = empty ? 0 : data[rd_ptr];

  //--------------------------------------------------------------------------

  always @ (posedge clk)
    if (rst)
      cnt <= '0;
    else if (push & ~ pop & ~full)
      cnt <= cnt + 1'b1;
    else if (pop & ~ push & ~empty)
      cnt <= cnt - 1'b1;

  //--------------------------------------------------------------------------

  assign empty = rst ? 0 : ~(|cnt);
  
  assign full =  rst ? 0 : (cnt==depth);

  // TODO: Add logic for full output

endmodule