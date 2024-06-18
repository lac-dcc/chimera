// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module ringer(
  input ring,
  input vibrate_mode,
  output ringer,
  output motor

);

  assign ringer = ring & ~vibrate_mode;
  assign motor = ring & vibrate_mode;

endmodule



