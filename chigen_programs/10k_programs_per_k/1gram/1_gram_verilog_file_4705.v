// Seed: 3449637423
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    assign id_2 = 1;
  endgenerate
endmodule
module module_1 (
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
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  nand primCall (id_1, id_3, id_2, id_6, id_7);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_3,
      id_6,
      id_3
  );
endmodule
