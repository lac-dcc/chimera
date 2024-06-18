// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module flip_flop_fifo
# (
	parameter HPOS_WIDTH=0,
				 VPOS_WIDTH=0,
				 width = HPOS_WIDTH+VPOS_WIDTH+1,
				 depth = 10
)
(
  input                clk,
  input                rst,
  input                push,
  input                pop,
  input  [width-1:0] write_data,
  output [width-1:0] read_data,
  output               empty,
  output               full
);

  localparam pointer_width = $clog2 (depth),
             counter_width = $clog2 (depth + 1);

  localparam [counter_width - 1:0] max_ptr = counter_width' (depth - 1);

  logic [pointer_width - 1:0] wr_ptr, rd_ptr;
  logic [counter_width - 1:0] cnt;

  reg [width - 1:0] data [0: depth - 1];

  //--------------------------------------------------------------------------

  always @ (posedge clk)
    if (rst)
      wr_ptr <= '0;
    else if (push)
      wr_ptr <= wr_ptr == max_ptr ? '0 : wr_ptr + 1'b1;
	 else if (pop)
		rd_ptr <= (rd_ptr == wr_ptr) ? rd_ptr : rd_ptr + 1'b1; 
		

  // TODO: Add logic for rd_ptr

  //--------------------------------------------------------------------------

  always @ (posedge clk)
    if (push)
      data [wr_ptr] <= write_data;

  assign read_data = data [rd_ptr];

  //--------------------------------------------------------------------------

  always @ (posedge clk)
    if (rst)
      cnt <= '0;
    else if (push & ~ pop)
      cnt <= cnt + 1'b1;
    else if (pop & ~ push)
      cnt <= cnt - 1'b1;

  //--------------------------------------------------------------------------

  assign empty = ~| cnt;
  
  assign full = (cnt==depth) ? 1'b1 : 0 ;

  // TODO: Add logic for full output

endmodule