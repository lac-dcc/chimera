// Seed: 2398802806
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  always id_2 = 1;
  assign id_2 = id_1 >> -1'b0;
endmodule
module module_1 #(
    parameter id_8 = 32'd43,
    parameter id_9 = 32'd46
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
  assign id_3 = -1;
  defparam id_8 = id_2, id_9 = -1;
  wire id_10;
  module_0 modCall_1 (
      id_7,
      id_6
  );
  assign modCall_1.id_2 = 0;
  parameter id_11 = id_8;
endmodule
