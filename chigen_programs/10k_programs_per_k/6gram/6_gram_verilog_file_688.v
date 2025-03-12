// Seed: 4079352004
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output supply1 id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_7 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout reg id_6;
  nand primCall (id_4, id_6, id_3, id_1);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always @((-1) - id_6 or id_3 or id_1) id_6 = -1'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_4
  );
endmodule
