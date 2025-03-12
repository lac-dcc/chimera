// Seed: 2862689780
module module_0 (
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output tri0 id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_17 = 1;
endmodule
module module_1 #(
    parameter id_0 = 32'd25,
    parameter id_9 = 32'd33
) (
    input supply1 _id_0,
    input wire id_1
    , id_12,
    output supply1 id_2,
    output tri id_3,
    input wire id_4,
    input wire id_5,
    input supply1 id_6,
    input wire id_7,
    output wor id_8,
    input tri1 _id_9,
    output tri1 id_10
);
  logic [(  -1  ) : id_0] id_13 = 1;
  wire [1 : id_9] id_14;
  logic id_15;
  ;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_15,
      id_14,
      id_13,
      id_14,
      id_12,
      id_14,
      id_12,
      id_13,
      id_15,
      id_12,
      id_15,
      id_15,
      id_15,
      id_14,
      id_15
  );
  assign modCall_1.id_17 = 0;
  assign id_8 = 1'h0 == -1;
endmodule
