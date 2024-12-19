// Seed: 709412933
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  wire id_8 = (id_6);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8;
  xnor primCall (id_5, id_7, id_2, id_4, id_6, id_8, id_3);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_7,
      id_7
  );
endmodule
