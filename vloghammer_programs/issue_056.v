module issue_056(a, y);
  input [3:0] a;
  output [3:0] y;

  // This expression is constant zero: Whatever the inner expression evaluates to,
  // the replication operator duplicates it, thus only yielding an even number of
  // set bits. The XOR-reduce is only true if the number of set bits in the operand
  // is odd.
  //
  // But Verific 35_463_32_140722 thinks that for example a=0 yields y=1.

  assign y = ^{2{{|1, |1 << a}}};
endmodule
