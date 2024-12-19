// Seed: 286338793
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_6, id_7, id_8, id_9 = id_4;
  xnor primCall (id_2, id_9, id_13, id_7, id_12, id_4, id_8);
  assign id_7 = id_2[1'b0];
  initial
  `define pp_10 0
  assign id_3 = id_8 + 1;
  always id_9 <= id_7;
  wire id_11, id_12, id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_3,
      id_11,
      id_11
  );
endmodule
