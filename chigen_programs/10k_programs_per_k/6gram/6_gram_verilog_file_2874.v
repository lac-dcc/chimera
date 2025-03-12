// Seed: 2056996016
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output supply1 id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_5 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd68,
    parameter id_6 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6,
    id_7
);
  input wire id_7;
  input wire _id_6;
  input wire _id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_8;
  ;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_3,
      id_8,
      id_3,
      id_3,
      id_8
  );
  assign modCall_1.id_5 = 0;
  assign id_4[id_5][-1][id_6] = 1;
endmodule
