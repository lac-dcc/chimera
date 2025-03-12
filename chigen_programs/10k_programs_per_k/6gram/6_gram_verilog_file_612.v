// Seed: 473775652
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  assign id_2[1] = id_1;
endmodule
module module_1 #(
    parameter id_8 = 32'd30
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  inout wire _id_8;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_7
  );
  inout wire id_7;
  output wire id_6;
  nand primCall (id_7, id_5, id_2, id_3);
  inout logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9 = id_5[id_8];
endmodule
