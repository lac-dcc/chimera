// Seed: 1910140244
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_10 = 32'd24,
    parameter id_11 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  defparam id_10.id_11 = 1;
  wire id_12;
  nand primCall (id_8, id_9, id_2, id_3, id_5, id_6, id_11, id_1, id_12, id_7, id_10);
  module_0 modCall_1 (
      id_5,
      id_1,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
