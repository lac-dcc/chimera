// Seed: 953642115
module module_0 #(
    parameter id_7 = 32'd32
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input logic [7:0] id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic _id_7;
  assign id_3 = id_5[id_7];
endmodule
module module_1 #(
    parameter id_7 = 32'd68
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6[id_7 : 1'b0],
    _id_7
);
  inout wire _id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_8,
      id_3,
      id_6,
      id_4
  );
  wire id_9;
  wire id_10;
  assign id_3 = id_9;
endmodule
