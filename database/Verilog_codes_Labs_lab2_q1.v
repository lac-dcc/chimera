// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module lab2_1(input Headlight, input Ignition, output Alarm);
assign Alarm = (Headlight & ~Ignition);
endmodule
