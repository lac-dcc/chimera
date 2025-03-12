// Seed: 1702629404
module module_0 #(
    parameter id_14 = 32'd1
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout logic [7:0] id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire _id_14;
  generate
    assign id_12 = id_12 ? id_12 : id_2;
    assign id_12[id_14] = id_9 ? -1 : 1'h0;
  endgenerate
endmodule
module module_1 #(
    parameter id_1 = 32'd41,
    parameter id_2 = 32'd50
) (
    _id_1,
    _id_2
);
  inout wire _id_2;
  inout wire _id_1;
  wire [id_2 : -1] id_3;
  logic [1 : -1] id_4;
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3
  );
  parameter id_5 = 1;
  assign id_2 = id_1;
  assign id_4[id_1] = 1 == -1;
endmodule
