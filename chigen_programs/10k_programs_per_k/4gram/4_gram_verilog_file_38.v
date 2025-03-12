// Seed: 2615685841
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
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_5 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_8,
      id_3,
      id_8,
      id_4,
      id_7,
      id_6
  );
  inout supply0 id_6;
  input wire _id_5;
  output wire id_4;
  output wire id_3;
  output reg id_2;
  input wire id_1;
  always @(posedge -1 or posedge id_6) id_2 = id_8 | id_5;
  assign id_6 = 1;
  logic [-1 : -1] id_9;
  wire id_10, id_11, id_12;
  wire [id_5 : id_5] id_13;
endmodule
