// Seed: 2639862228
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input tri0 id_2
);
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output uwire id_2,
    output tri1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input tri0 id_6,
    input tri id_7,
    output tri1 id_8
);
  specify
    specparam id_10 = 1;
  endspecify
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
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
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  inout wire id_22;
  output wire id_21;
  output wire id_20;
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_12 = id_8;
endmodule
module module_3 #(
    parameter id_4 = 32'd32
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input logic [7:0] id_9;
  input logic [7:0] id_8;
  inout wire id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  inout wire _id_4;
  inout wire id_3;
  inout uwire id_2;
  output wire id_1;
  assign id_6 = id_9[~id_4];
  parameter id_11 = 1;
  assign id_2 = 1;
  module_2 modCall_1 (
      id_11,
      id_6,
      id_10,
      id_10,
      id_10,
      id_6,
      id_7,
      id_10,
      id_11,
      id_10,
      id_10,
      id_2,
      id_2,
      id_10,
      id_11,
      id_3,
      id_3,
      id_2,
      id_3,
      id_7,
      id_7,
      id_11,
      id_10
  );
  generate
    wire id_12;
    ;
    genvar id_13;
    assign id_5[1&1] = -1;
  endgenerate
endmodule
