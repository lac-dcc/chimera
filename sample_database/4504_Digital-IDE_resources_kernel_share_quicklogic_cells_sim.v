// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

module inv (
  output Q,
  input A
);
  assign Q = A ? 0 : 1;
endmodule

module buff (
  output Q,
  input A
);
  assign Q = A;
endmodule

module logic_0 (
  output A
);
  assign A = 0;
endmodule

module logic_1 (
  output A
);
  assign A = 1;
endmodule

module gclkbuff (
  input A,
  output Z
);
  specify
    (A => Z) = 0;
  endspecify

  assign Z = A;
endmodule
