// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module fibonacci
(
  input             clk,
  input             rst,
  output reg [15:0] num
);

  reg [15:0] num2;

  always @ (posedge clk)
    if (rst)
      { num, num2 } <= { 16'd1, 16'd1 };
    else
      { num, num2 } <= { num2, num + num2 };

endmodule

//----------------------------------------------------------------------------

module fibonacci_2
(
  input             clk,
  input             rst,
  output reg [15:0] num,
  output reg [15:0] num2
);

  // TODO

  // Implement a module that generates two fibonacci numbers per cycle


endmodule

//----------------------------------------------------------------------------

module testbench;

  logic clk;

  initial
  begin
    clk = 0;

    forever
      # 500 clk = ~ clk;
  end

  logic rst;
    
  initial
  begin
    rst <= 'x;
    repeat (2) @ (posedge clk);
    rst <= '1;
    repeat (2) @ (posedge clk);
    rst <= '0;
  end

  logic [15:0] f1_num, f2_num, f2_num2;

  fibonacci   f1 (.num (f1_num), .*);
  fibonacci_2 f2 (.num (f2_num), .num2 (f2_num2), .*);

  localparam n = 10;

  logic [15:0] fifo1 [$], fifo2 [$];

  initial
  begin
    @ (negedge rst);

    while (fifo1.size () < n || fifo2.size () < n)
    begin
      @ (posedge clk);

      $display ("%d (%d %d)", f1_num, f2_num, f2_num2);

      fifo1.push_back (f1_num);
      fifo2.push_back (f2_num);
      fifo2.push_back (f2_num2);
    end

    while (fifo1.size () > 0 && fifo2.size () > 0)
    begin
      logic [15:0] n1, n2;

      n1 = fifo1.pop_front ();
      n2 = fifo2.pop_front ();

      if (n1 !== n2)
      begin
        $display ("%s FAIL %d !== %d", `__FILE__, n1, n2);
        $finish;
      end
    end

    $display ("%s PASS", `__FILE__);

    `ifdef MODEL_TECH  // Mentor ModelSim and Questa
      $stop;
    `else
      $finish;
    `endif
  end

endmodule
