// Seed: 4140010472
module module_0 #(
    parameter id_10 = 32'd96,
    parameter id_6  = 32'd81,
    parameter id_7  = 32'd5
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire _id_6;
  parameter id_7 = -1;
  wire [id_7 : id_6] id_8;
  assign id_6 = id_7;
  wire id_9, _id_10;
  always_comb cover (1);
  wire [-1 : id_10] id_11;
endmodule
module module_1;
  static logic id_1;
  ;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
