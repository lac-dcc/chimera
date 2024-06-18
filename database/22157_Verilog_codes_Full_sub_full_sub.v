// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

// Full Subtractor module
module full_subtractor(A, B, Cin, Diff, Borrow);
  input A, B, Cin;
  output Diff, Borrow;
  
  assign Diff = A ^ B ^ Cin;
  assign Borrow = (~A & B) | (~A & Cin) | (B & Cin);
endmodule
