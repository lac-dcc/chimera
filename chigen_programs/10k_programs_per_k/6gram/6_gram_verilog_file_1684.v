// Seed: 85723435
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  localparam id_7 = 1;
  logic [7:0] id_8;
  assign id_8[1] = -1'b0;
endmodule
module module_1 #(
    parameter id_9 = 32'd86
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  and primCall (id_4, id_15, id_14, id_8, id_6, id_10, id_5, id_12, id_16, id_7, id_2);
  output tri0 id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout logic [7:0] id_12;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_2,
      id_7,
      id_14,
      id_15
  );
  output wire id_11;
  input wire id_10;
  input wire _id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout supply0 id_2;
  output wire id_1;
  wire id_19;
  logic [7:0] id_20;
  assign id_2 = id_20 | 1;
  wire id_21;
  ;
  assign id_17#(
      .id_2({1'h0, -1} & 1),
      .id_2(1)
  ) = id_20[1 : 1] ? 1 & id_9 : id_12[id_9] ? 1 : id_8 ? 1 : (id_20);
  logic \id_22 = -1'b0;
  wire  id_23;
  assign id_20 = id_14;
endmodule
