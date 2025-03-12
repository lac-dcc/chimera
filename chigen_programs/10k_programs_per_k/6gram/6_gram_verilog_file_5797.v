// Seed: 59400089
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output tri0 id_1;
  assign id_1 = id_2 !=? id_2;
endmodule
module module_1 #(
    parameter id_4 = 32'd70,
    parameter id_7 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8
);
  inout wire id_8;
  input wire _id_7;
  inout wire id_6;
  output wire id_5;
  inout wire _id_4;
  module_0 modCall_1 (
      id_3,
      id_8
  );
  assign modCall_1.id_1 = 0;
  inout wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  assign id_3 = id_1[id_4>=1 : id_7];
endmodule
