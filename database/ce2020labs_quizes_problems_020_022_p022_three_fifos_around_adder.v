// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

// TODO: Complete all the assignments
// to finish the design of three_fifos_around_adder

/*
assign can_push_a  = ...
assign can_push_b  = ...
assign can_pop_sum = ...

assign pop_a    = ...
assign pop_b    = ...
assign push_sum = ...

assign write_data_sum = ...
*/

// A generic D-flip-flop based FIFO
// This is the same as in the previous exercises

module generic_flip_flop_fifo
# (
  parameter width = 8, depth = 3
)
(
  input                clk,
  input                rst,
  input                push,
  input                pop,
  input  [width - 1:0] write_data,
  output [width - 1:0] read_data,
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

  // TODO: Add logic for full output

endmodule

//----------------------------------------------------------------------------

module three_fifos_around_adder
(
  input         clk,
  input         rst,
  output        can_push_a,
  input         push_a,
  input  [15:0] a,
  output        can_push_b,
  input         push_b,
  input  [15:0] b,
  output        can_pop_sum,
  input         pop_sum,
  output [15:0] sum
);

  wire        pop_a, pop_b, push_sum;
  wire        empty_a, empty_b, empty_sum;
  wire        full_a, full_b, full_sum;
  wire [15:0] read_data_a, read_data_b, write_data_sum;

  generic_flip_flop_fifo # (.width (16), .depth (5))
  fifo_a
  (
    .clk        ( clk         ),
    .rst        ( rst         ),
    .push       ( push_a      ),
    .pop        ( pop_a       ),
    .empty      ( empty_a     ),
    .full       ( full_a      ),
    .write_data ( a           ),
    .read_data  ( read_data_a )
  );

  generic_flip_flop_fifo # (.width (16), .depth (5))
  fifo_b
  (
    .clk        ( clk         ),
    .rst        ( rst         ),
    .push       ( push_b      ),
    .pop        ( pop_b       ),
    .empty      ( empty_b     ),
    .full       ( full_b      ),
    .write_data ( b           ),
    .read_data  ( read_data_b )
  );

  generic_flip_flop_fifo # (.width (16), .depth (5))
  fifo_sum
  (
    .clk        ( clk            ),
    .rst        ( rst            ),
    .push       ( push_sum       ),
    .pop        ( pop_sum        ),
    .empty      ( empty_sum      ),
    .full       ( full_sum       ),
    .write_data ( write_data_sum ),
    .read_data  ( sum            )
  );

  // TODO: Complete all the assignments
  // to finish the design of three_fifos_around_adder

  /*
  assign can_push_a  = ...
  assign can_push_b  = ...
  assign can_pop_sum = ...

  assign pop_a    = ...
  assign pop_b    = ...
  assign push_sum = ...

  assign write_data_sum = ...
  */


endmodule

//----------------------------------------------------------------------------

module testbench;
  
  logic        clk;
  logic        rst;
  logic        can_push_a;
  logic        push_a;
  logic [15:0] a;
  logic        can_push_b;
  logic        push_b;
  logic [15:0] b;
  logic        can_pop_sum;
  logic        pop_sum;
  logic [15:0] sum;

  three_fifos_around_adder dut (.*);  // DUT = Design Under Test

  //--------------------------------------------------------------------------

  initial
  begin
    clk = '0;
    forever #5 clk = ~ clk;
  end
  
  //--------------------------------------------------------------------------

  bit back_to_back  = 1;
  bit back_pressure = 0;

  // Sender for a

  always @ (posedge clk)
  begin
     # 1 // This delay is necessary because of combinational logic after ff
         // for can_push_a

    if (rst)
    begin
      a      <= '0;
      push_a <= '0;
    end
    else if (can_push_a & (back_to_back | $urandom_range (1, 100) <= 90))
    begin
      push_a <= '1;
      a <= a + 16'h1;
    end
    else
    begin
      push_a <= '0;
    end
  end

  //--------------------------------------------------------------------------

  // Sender for b

  always @ (posedge clk)
  begin
     # 1 // This delay is necessary because of combinational logic after ff
         // for can_push_b

    if (rst)
    begin
      b      <= '0;
      push_b <= '0;
    end
    else if (  can_push_b
             & (back_to_back | $urandom_range (1, 100) <= 50)
             & ~ back_pressure)
    begin
      push_b <= '1;
      b <= b + 16'h100;
    end
    else
    begin
      push_b <= '0;
    end
  end

  //--------------------------------------------------------------------------

  // Receiver for sum - randomized pop signal

  reg pop_sum_raw;

  always @ (posedge clk)
    if (rst)
      pop_sum_raw <= '0;
    else
      pop_sum_raw <= back_to_back | ($urandom_range (1, 100) <= 50);

  assign pop_sum = pop_sum_raw & can_pop_sum;

  // Receiver for sum - the expected value

  logic [15:0] expected_sum;

  always @ (posedge clk)
    if (rst)
    begin
      expected_sum <= 16'h101;
    end
    else if (pop_sum)
    begin
      if (sum != expected_sum)
      begin
        $display ("%s FAIL: %h EXPECTED", `__FILE__, expected_sum);
        $finish;
      end

      expected_sum <= expected_sum + 16'h101;
    end

  //--------------------------------------------------------------------------

  // Logger

  int cycle = 0;

  always @ (posedge clk)
  begin
    $write ("%4d ", cycle ++);

    if ( push_a  ) $write ( " a %h"   , a   ); else $write ( "       " );
    if ( push_b  ) $write ( " b %h"   , b   ); else $write ( "       " );
    if ( pop_sum ) $write ( " sum %h" , sum );
    $display;
  end

  //--------------------------------------------------------------------------

  initial
  begin
    $dumpfile ("dump.vcd");
    $dumpvars;

    repeat (2) @ (posedge clk);
    #3 rst <= '1;
    repeat (2) @ (posedge clk);
    rst <= '0;

    back_to_back = 1;
    repeat (10)  @ (posedge clk);

    back_pressure = 1;
    repeat (10)  @ (posedge clk);

    back_pressure = 0;
    back_to_back  = 0;

    repeat (100) @ (posedge clk);

    $display ("%s PASS", `__FILE__);
    $finish;
  end

endmodule
