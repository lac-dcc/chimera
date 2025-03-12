// Seed: 852430576
module module_0 (
    id_1#(.id_2(1)),
    id_3
);
  output wire id_2;
  inout wire id_1;
  wire id_4, id_5;
  wire id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd32,
    parameter id_4 = 32'd22
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5[id_3!=?id_4 : 1]
);
  inout logic [7:0] id_5;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  output wire _id_4;
  output wire _id_3;
  nand primCall (id_2, id_5, id_1);
  inout wire id_2;
  inout wire id_1;
  assign id_3 = id_5;
endmodule
