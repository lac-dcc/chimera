// Seed: 4046416297
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input wor id_2,
    output uwire id_3,
    input tri id_4,
    input wor id_5,
    input tri1 id_6
    , id_28,
    output tri0 id_7,
    input tri id_8,
    input supply1 id_9,
    input tri1 id_10,
    output tri id_11,
    output tri1 id_12,
    output supply0 id_13,
    output wor id_14,
    input tri0 id_15,
    input uwire id_16,
    input tri id_17,
    output tri id_18,
    input wor id_19,
    input tri0 id_20,
    input tri id_21,
    input tri1 id_22,
    input tri1 id_23,
    input wire id_24,
    output wor id_25,
    output wor id_26
);
  supply0 id_29 = id_4 == id_17;
  always @(posedge 1 + (id_4)) id_11 = 1;
  assign module_1.type_36 = 0;
  wire id_30 = !id_28.id_6;
  assign id_18 = id_5;
endmodule
module module_1 #(
    parameter id_31 = 32'd52,
    parameter id_32 = 32'd96
) (
    output tri id_0,
    output uwire id_1,
    input uwire id_2,
    output uwire id_3,
    input wire id_4,
    input wand id_5,
    input supply1 id_6,
    output uwire id_7,
    input tri1 id_8,
    input wor id_9,
    output tri0 id_10,
    input uwire id_11,
    input uwire id_12,
    input wire id_13,
    output wand id_14,
    output wand id_15,
    input supply1 id_16,
    input supply1 id_17,
    input tri id_18,
    input uwire id_19,
    input tri0 id_20,
    output wire id_21,
    input tri1 id_22,
    input uwire id_23,
    input tri1 id_24,
    output supply0 id_25,
    output wire id_26,
    input wor id_27,
    input tri0 id_28,
    output wand id_29
);
  defparam id_31.id_32 = 1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_27,
      id_29,
      id_9,
      id_5,
      id_20,
      id_15,
      id_12,
      id_12,
      id_17,
      id_25,
      id_25,
      id_7,
      id_14,
      id_20,
      id_4,
      id_6,
      id_15,
      id_16,
      id_2,
      id_5,
      id_2,
      id_18,
      id_20,
      id_14,
      id_3
  );
endmodule
