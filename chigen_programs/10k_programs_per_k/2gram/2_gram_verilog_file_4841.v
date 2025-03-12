// Seed: 3597199925
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
    id_11#(
        .id_12(id_13),
        .id_14(1'b0),
        .id_15(~-1'h0),
        .id_16(1),
        .id_17(1),
        .id_18(1),
        .id_19(-1 + -1),
        .id_20(-1)
    ),
    id_21,
    id_22
);
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout supply0 id_1;
  assign id_1 = -1;
  assign id_7 = id_3;
endmodule
module module_1 #(
    parameter id_7 = 32'd44,
    parameter id_8 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
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
    id_21
);
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire _id_8;
  input wire _id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire [id_7 : -1] id_22;
  module_0 modCall_1 (
      id_21,
      id_10,
      id_12,
      id_22,
      id_22,
      id_12,
      id_14,
      id_9,
      id_12,
      id_17,
      id_15,
      id_19,
      id_11
  );
  wire [(  id_8  ) : ""] id_23;
  wire id_24;
  wire id_25;
  ;
  nand primCall (
      id_11,
      id_21,
      id_10,
      id_18,
      id_19,
      id_17,
      id_20,
      id_22,
      id_9,
      id_15,
      id_14,
      id_16,
      id_6,
      id_12,
      id_3,
      id_1,
      id_13
  );
  static logic [7:0] id_26;
  always_ff id_26[-1] = -1;
  parameter id_27 = 1 < 1 - -1;
endmodule
