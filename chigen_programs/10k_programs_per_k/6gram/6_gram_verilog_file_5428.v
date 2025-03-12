// Seed: 14219966
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input wand id_2,
    input wand id_3,
    input wor id_4,
    input supply1 id_5,
    input supply0 id_6,
    output wand id_7,
    output tri1 id_8,
    input wor id_9,
    input uwire id_10,
    output supply1 id_11,
    input tri id_12,
    input wor id_13,
    input tri0 id_14
    , id_26,
    input supply1 id_15,
    input wor id_16,
    output wor id_17,
    output tri id_18,
    output uwire id_19,
    output supply0 id_20,
    input supply0 id_21,
    output supply1 id_22,
    input supply0 id_23,
    input tri1 id_24
);
  parameter id_27 = 1 == 1;
  wire id_28 = id_26;
  assign id_20 = !id_24;
endmodule
module module_1 #(
    parameter id_16 = 32'd76,
    parameter id_4  = 32'd68,
    parameter id_8  = 32'd39
) (
    output tri0 id_0,
    input tri id_1,
    input tri id_2,
    output wire id_3,
    input tri1 _id_4,
    input tri0 id_5,
    output wor id_6,
    input wire id_7,
    input uwire _id_8,
    output wand id_9,
    input tri0 id_10,
    output wand id_11,
    input tri0 id_12,
    output uwire id_13,
    input supply1 id_14,
    input tri0 id_15,
    input tri1 _id_16,
    output wire id_17
);
  wand [id_8 : id_16] id_19;
  wire id_20;
  assign id_17 = -1'b0;
  assign id_19 = -1;
  assign id_3  = -1;
  wire [id_4 : -1] id_21;
  module_0 modCall_1 (
      id_15,
      id_2,
      id_5,
      id_2,
      id_2,
      id_12,
      id_5,
      id_6,
      id_11,
      id_10,
      id_2,
      id_17,
      id_15,
      id_12,
      id_10,
      id_7,
      id_1,
      id_6,
      id_11,
      id_9,
      id_9,
      id_7,
      id_11,
      id_12,
      id_2
  );
  assign modCall_1.id_5 = 0;
  logic id_22;
  logic id_23;
  tri   id_24 = -1'b0;
endmodule
