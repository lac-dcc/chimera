// Seed: 3944803328
module module_0 (
    id_1,
    id_2,
    id_3
);
  output uwire id_3;
  output wire id_2;
  input wire id_1;
  genvar id_4;
  wire id_5;
  wire [-1 : -1] id_6;
  assign id_3 = id_1 ? 1 : -1'b0 < id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd15,
    parameter id_6 = 32'd70
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  nand primCall (id_5, id_4, id_10, id_9);
  inout wire _id_6;
  inout wire id_5;
  inout wire id_4;
  output wire _id_3;
  output wire id_2;
  output wire id_1;
  logic [id_6 : ~  id_3] id_10;
  ;
  module_0 modCall_1 (
      id_9,
      id_1,
      id_5
  );
endmodule
