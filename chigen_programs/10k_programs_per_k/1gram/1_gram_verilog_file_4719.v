// Seed: 1308485379
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout uwire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = -1;
endmodule
module module_1 #(
    parameter id_8 = 32'd53
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire _id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_6
  );
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire [id_8 : -1 'b0 !=?  1] id_11;
  xor primCall (id_10, id_9, id_6);
  tri id_12 = id_6 & "";
endmodule
