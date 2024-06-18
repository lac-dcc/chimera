// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module full_adder (
    input bit1,  // bit 1 to add
    input bit2, // bit 2 to add
    input cin, // carry in
    output sum,  // sum out
    output cout // carry out
  );
  wire bit1_xor_bit2;
  wire aftand1;
  wire aftand2;
  /* Combinational Logic */
  assign bit1_xor_bit2 = bit1 ^ bit2;
  assign sum = bit1_xor_bit2 ^ cin;
  assign aftand1 = bit1_xor_bit2&cin;
  assign aftand2 = bit1 & bit2;
  assign cout = aftand1 | aftand2;
endmodule
