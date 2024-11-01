module issue_046(a, y);
  input signed [3:0] a;
  output [3:0] y;

  // This should set y=4'b1111 but Verilator d7e4bc1 sets y=4'b0001 instead.
  assign y = $signed(5'd1 > a-a);
endmodule
