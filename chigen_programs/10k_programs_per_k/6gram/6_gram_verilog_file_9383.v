// Seed: 1519701258
module module_0 #(
    parameter id_7 = 32'd93,
    parameter id_8 = 32'd57
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire _id_7;
  assign id_2 = id_7;
  parameter id_8 = 1;
  parameter id_9 = -1;
  wire [id_8 : id_7] id_10;
endmodule
module module_1 #(
    parameter id_7 = 32'd27
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_8 = 0;
  output logic [7:0] id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_7 = 1'b0;
  wire id_8 = id_8;
  assign id_3[id_7] = id_1;
endmodule
