// Seed: 1586822173
module module_0 (
    output uwire id_0,
    input wor id_1,
    input uwire id_2,
    input wand id_3,
    input tri0 id_4,
    input wire id_5
    , id_19,
    output wor id_6,
    input wire id_7,
    output wire id_8,
    input wand id_9,
    input supply0 id_10,
    input wire id_11,
    output wor id_12,
    input supply0 id_13,
    input tri1 id_14,
    input tri1 id_15,
    input uwire id_16,
    input uwire id_17
);
  logic id_20 = 1;
  assign module_1.id_9 = 0;
  initial id_19 <= -1;
endmodule
module module_1 #(
    parameter id_23 = 32'd11,
    parameter id_4  = 32'd42
) (
    input supply0 id_0,
    input wire id_1,
    input uwire id_2,
    input uwire id_3,
    input supply1 _id_4,
    input tri id_5,
    input wor id_6,
    input wire id_7,
    input supply1 id_8,
    input wor id_9,
    output supply1 id_10,
    input tri0 id_11
    , id_28,
    input uwire id_12,
    output wand id_13,
    input supply0 id_14,
    input tri1 id_15,
    input tri id_16,
    input tri0 id_17,
    input tri1 id_18,
    input tri0 id_19,
    output tri0 id_20,
    input supply1 id_21,
    output supply0 id_22,
    input supply1 _id_23,
    input tri0 id_24,
    output wire id_25,
    input wire id_26
);
  assign id_28 = id_15;
  logic id_29;
  ;
  wor id_30 = -1'b0, id_31 = 1;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_5,
      id_5,
      id_14,
      id_2,
      id_13,
      id_17,
      id_22,
      id_8,
      id_5,
      id_8,
      id_13,
      id_5,
      id_5,
      id_1,
      id_21,
      id_12
  );
  logic id_32[{  id_23  ,  id_4  } : 1], id_33, id_34 = (id_29);
endmodule
