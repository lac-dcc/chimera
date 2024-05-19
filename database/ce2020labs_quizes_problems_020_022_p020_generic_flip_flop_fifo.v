// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

// A generic D-flip-flop based FIFO

module generic_flip_flop_fifo_rtl
# (
  parameter width = 8, depth = 10
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

module fifo_model
# (
  parameter width = 8, depth = 2
)
(
  input                      clk,
  input                      rst,
  input                      push,
  input                      pop,
  input        [width - 1:0] write_data,
  output logic [width - 1:0] read_data,
  output logic               empty,
  output logic               full
);

  logic [width - 1:0] queue [$];
  logic [width - 1:0] dummy;

  always @ (posedge clk)
    if (rst)
    begin
      queue  = {};
      empty <= '1;
      full  <= '0;
    end
    else
    begin
      assert (~ (queue.size () == depth & push & ~ pop));
      assert (~ (queue.size () == 0     & pop));
      
      if (queue.size () > 0 & pop)
        dummy <= queue.pop_front ();

      if (queue.size () < depth & push)
        queue.push_back (write_data);
        
      if (queue.size () > 0)
        read_data <= queue [0];
      else
        read_data <= 'x;

      empty <= queue.size () == 0;
      full  <= queue.size () == depth;
    end
      
endmodule

//----------------------------------------------------------------------------

module testbench;
  
  localparam fifo_width = 8, fifo_depth = 5;
  
  logic                    clk;
  logic                    rst;
  logic                    push;
  logic                    pop;
  logic [fifo_width - 1:0] write_data;

  logic [fifo_width - 1:0] rtl_read_data;
  logic                    rtl_empty;
  logic                    rtl_full;

  logic [fifo_width - 1:0] model_read_data;
  logic                    model_empty;
  logic                    model_full;

  //--------------------------------------------------------------------------

  generic_flip_flop_fifo_rtl
  # (
    .width (fifo_width),
    .depth (fifo_depth)
  )
  rtl
  (
    .read_data ( rtl_read_data ),
    .empty     ( rtl_empty     ),
    .full      ( rtl_full      ),
    .*
  );

  //--------------------------------------------------------------------------

  fifo_model
  # (
    .width (fifo_width),
    .depth (fifo_depth)
  )
  model
  (
    .read_data ( model_read_data ),
    .empty     ( model_empty     ),
    .full      ( model_full      ),
    .*
  );

  //--------------------------------------------------------------------------

  initial
  begin
    clk = '0;
    forever #5 clk = ~ clk;
  end
  
  //--------------------------------------------------------------------------

  // Monitor

  always @ (posedge clk)
    # 1  // This delay is necessary because of combinational logic after ff
    if (rst === '0)
    begin
      assert ( rtl_empty === model_empty );
      assert ( rtl_full  === model_full  );

      if (~ rtl_empty)
        assert ( rtl_read_data === model_read_data );
    end
  
  //--------------------------------------------------------------------------

  // Logger

  always @ (posedge clk)
    if (rst === '0)
    begin
      if (push)
        $write ("push %h", write_data);
      else
        $write ("       ");

      if (pop)
        $write ("  pop %h", rtl_read_data);
      else
        $write ("        ");

      # 1  // This delay is necessary because of combinational logic after ff
      
      $write ("  %5s %4s",
        rtl_empty ? "empty" : "     ",
        rtl_full  ? "full"  : "    ");

      $write (" [");

      for (int i = 0; i < model.queue.size (); i ++)
        $write (" %h", model.queue [model.queue.size () - i - 1]);

      $display (" ]");
    end
  
  //--------------------------------------------------------------------------

  initial
  begin
    $dumpfile ("dump.vcd");
    $dumpvars;

    // Initialization

    push <= '0;
    pop  <= '0;

    // Reset

    #3 rst <= '1;
    repeat (6) @ (posedge clk);
    rst <= '0;
    
    // Randomized test

    repeat (100)
    begin
      @ (posedge clk);
      # 1  // This delay is necessary because of combinational logic after ff

      pop  <= '0;
      push <= '0;

      if (rtl_full & $urandom_range (1, 100) <= 40)
      begin
        pop  <= '1;
        push <= '1;

        write_data <= $urandom;
      end

      if (~ rtl_empty & $urandom_range (1, 100) <= 50)
        pop <= '1;
      
      if (~ rtl_full & $urandom_range (1, 100) <= 60)
      begin
        push <= '1;
        write_data <= $urandom;
      end
    end

    $display ("%s PASS", `__FILE__);
    $finish;
  end

endmodule
