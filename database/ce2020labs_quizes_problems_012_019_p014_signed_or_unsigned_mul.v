// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

// Non-parameterized signed multiplication of 4-bit numbers
// that produces 8-bit result

module signed_mul_4
(
  input  signed [3:0] a, b,
  output signed [7:0] res
);

  assign res = a * b;

endmodule

//----------------------------------------------------------------------------

// Parameterized unsigned multiplication of N-bit numbers
// that produces 2N-bit result

module unsigned_mul
# (
  parameter n = 8
)
(
  input  [    n - 1:0] a, b,
  output [2 * n - 1:0] res
);

  assign res = a * b;

endmodule

//----------------------------------------------------------------------------

module signed_or_unsigned_mul
# (
  parameter n = 8
)
(
  input  [    n - 1:0] a, b,
  input                sign,
  output [2 * n - 1:0] res
);

  // TODO

  // Implement a module that generates either signed or unsigned result
  // of the multiplication as requested by sign bit.


endmodule

//----------------------------------------------------------------------------

module testbench;

  localparam n = 4;

  logic          [    n - 1:0] a, b;
  logic                        sign;
  logic          [2 * n - 1:0] res;

  logic   signed [    n - 1:0] sa, sb;
  logic   signed [2 * n - 1:0] sres;

  logic unsigned [2 * n - 1:0] t_res;
  logic   signed [2 * n - 1:0] t_sres;

  signed_mul_4 i_signed_mul_4
    (.a (a), .b (b), .res (t_sres));

  unsigned_mul #(n) i_unsigned_mul           
    (.a (a), .b (b), .res (t_res));

  signed_or_unsigned_mul #(.n (n)) i_signed_or_unsigned_mul 
    (.a (a), .b (b), .sign (sign), .res (res));

  task test
    (
      input [n - 1:0] t_a, t_b,
      input t_sign
    );

    { a, b, sign } = { t_a, t_b, t_sign };

    # 1;

    { sa, sb, sres } = { a, b, res };

    if (sign)
    begin
      $display ("TEST   signed %d * %d = %d", sa, sb, sres);

      if (sres !== t_sres)
      begin
        $display ("%s FAIL: %d EXPECTED", `__FILE__, t_sres);
        $finish;
      end
    end
    else
    begin
      $display ("TEST unsigned %d * %d = %d", a, b, res);

      if (res !== t_res)
      begin
        $display ("%s FAIL: %d EXPECTED", `__FILE__, t_res);
        $finish;
      end
    end
    
  endtask

  localparam signed [n - 1:0] smin = 1'b1 << (n - 1);
  localparam signed [n - 1:0] smax = ~ smin;
  localparam        [n - 1:0] umax = ~ { n { 1'b0 } };

  initial
    begin
      for (int i = 0; i <= umax; i ++)
      for (int j = 0; j <= umax; j ++)
        test (i, j, 0);

      for (int i = smin; i <= smax; i ++)
      for (int j = smin; j <= smax; j ++)
        test (i, j, 1);

      $display ("%s PASS", `__FILE__);
      $finish;
    end

endmodule
