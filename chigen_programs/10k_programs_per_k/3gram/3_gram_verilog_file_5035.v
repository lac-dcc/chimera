// Seed: 4210153182
module module_0 (
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
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10;
  wire id_11;
  wire id_12;
endmodule
module module_1 #(
    parameter id_3 = 32'd19
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  inout logic [7:0] id_4;
  inout wire _id_3;
  input wire id_2;
  input wire id_1;
  assign id_4.id_4[-1][id_3] = 1;
  genvar id_5;
  parameter id_6 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_2,
      id_1,
      id_6,
      id_5
  );
  localparam id_7 = (id_6);
  assign id_4 = id_5;
endmodule
