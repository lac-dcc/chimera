// Seed: 2502049140
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  tri id_6 = 1;
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
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1 ? id_5 * 1'b0 : 1;
  xnor primCall (id_7, id_4, id_1, id_5, id_2, id_8, id_6);
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_2,
      id_7
  );
  assign modCall_1.type_7 = 0;
endmodule
