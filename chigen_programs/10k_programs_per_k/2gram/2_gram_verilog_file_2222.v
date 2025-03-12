// Seed: 1247648526
module module_0 (
    output supply0 id_0
    , id_31,
    output uwire id_1,
    output wire id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wire id_5,
    input wand id_6,
    output wire id_7,
    output wor id_8,
    input supply1 id_9,
    input wor id_10,
    input tri1 id_11,
    input tri1 id_12,
    input supply0 id_13
    , id_32,
    output tri1 id_14,
    output wor id_15,
    output supply0 id_16,
    output tri0 id_17,
    input tri0 id_18,
    input wand id_19,
    output tri1 id_20,
    input tri0 id_21,
    input wand id_22,
    input tri0 id_23,
    output tri id_24,
    output wire id_25,
    input tri id_26,
    output tri0 id_27,
    input uwire id_28,
    output tri0 id_29
);
endmodule
module module_1 #(
    parameter id_0 = 32'd46,
    parameter id_2 = 32'd13,
    parameter id_4 = 32'd56,
    parameter id_6 = 32'd29,
    parameter id_9 = 32'd64
) (
    output tri _id_0,
    input wor id_1,
    input supply0 _id_2,
    output tri id_3,
    input wire _id_4
);
  wire _id_6;
  ;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_16 = 0;
  logic [id_6  <->  id_0 : id_2] id_8;
  assign id_3 = id_7;
  wire _id_9, id_10, id_11;
  logic [1 : id_4] id_12;
  ;
  assign #id_13 id_8[1'h0] = id_8;
  assign id_12[1] = id_9;
  always_latch @(*) deassign id_11[1'b0-id_9];
endmodule
