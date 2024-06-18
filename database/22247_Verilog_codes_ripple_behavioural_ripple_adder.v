// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module full_adder(
  input a, b, cin,
  output sum, cout
);
  assign {sum, cout} = {a^b^cin, ((a & b) | (b & cin) | (a & cin))};
endmodule

module ripple_carry_adder #(parameter SIZE = 4) (
  input [SIZE-1:0] A, B, 
  input Cin,
  output [SIZE-1:0] S, Cout);

  full_adder fa0(A[0], B[0], Cin, S[0], Cout[0]);

  genvar g;
  generate
    for(g = 1; g < SIZE; g = g+1) begin : gen_loop
      full_adder fa (
        .a(A[g]),
        .b(B[g]),
        .cin(Cout[g-1]),
        .sum(S[g]),
        .cout(Cout[g])
      );
    end
  endgenerate

endmodule

