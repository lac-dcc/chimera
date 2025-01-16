// Seed: 3257012885
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9#(.id_10(-1)),
    id_11,
    id_12
);
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  assign module_1.type_11 = 0;
endmodule
macromodule module_1;
  tri1 id_1, id_2;
  tri0 id_3;
  wor  id_4, id_5 = id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_1,
      id_5,
      id_4,
      id_5,
      id_3
  );
  assign id_4 = 1;
  wor  id_6;
  wire id_7;
  assign id_6 = id_3;
  wire id_8;
  assign id_5 = 1'b0;
endmodule
