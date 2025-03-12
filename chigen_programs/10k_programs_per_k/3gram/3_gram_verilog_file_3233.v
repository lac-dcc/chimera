// Seed: 1995415485
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_1
  );
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout reg id_2;
  inout wire id_1;
  always @(posedge -1) id_2 = !1'b0 + -1'b0;
endmodule
