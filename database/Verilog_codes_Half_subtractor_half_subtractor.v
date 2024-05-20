// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

// Half Subtractor Module
module half_subtractor(input a, b, output diff, borrow);
    assign diff = a ^ b;
    assign borrow = a & ~b;
endmodule
