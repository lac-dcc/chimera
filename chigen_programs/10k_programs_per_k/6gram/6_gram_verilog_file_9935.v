// Seed: 3887267564
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  output uwire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_9 = 1;
  wire id_10;
  wire id_11;
  ;
  assign id_6 = id_10 + (1'b0);
endmodule
module module_1 #(
    parameter id_7 = 32'd19
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8
);
  inout wire id_8;
  input wire _id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_8,
      id_3,
      id_8,
      id_4,
      id_8,
      id_5
  );
  inout wire id_3;
  input logic [7:0] id_2;
  input wire id_1;
endmodule
