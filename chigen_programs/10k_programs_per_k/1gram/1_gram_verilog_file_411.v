// Seed: 762636201
module module_0 #(
    parameter id_31 = 32'd93
) (
    output tri0 id_0,
    output wire id_1#(.id_30(-1'b0)),
    input uwire id_2,
    input tri0 id_3,
    output tri1 id_4,
    output tri0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input tri id_8,
    input wire id_9,
    input tri0 id_10,
    output tri id_11,
    input wand id_12,
    input tri0 id_13,
    input tri1 id_14,
    input wand id_15,
    input uwire id_16,
    output wire id_17,
    input uwire id_18,
    output uwire id_19,
    input wor id_20,
    output tri0 id_21,
    output wor id_22,
    input uwire id_23,
    input tri1 id_24,
    input wor id_25,
    input supply0 id_26,
    output wand id_27,
    input tri0 id_28
);
  assign id_17 = (1) & 1;
  assign id_4  = (id_24) || id_9;
  parameter id_31 = 1 - ~1'h0;
  parameter id_32 = -1;
  assign id_22 = id_24;
  defparam id_31 = 1'b0, id_31 = id_31;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd86
) (
    output tri id_0,
    input tri id_1,
    output tri0 id_2,
    input uwire id_3,
    output wor id_4,
    output tri id_5,
    input tri0 id_6,
    input uwire id_7,
    input wor id_8[1 : id_11],
    output tri1 id_9,
    input supply0 id_10,
    output uwire _id_11,
    input supply0 id_12,
    input tri1 id_13
);
  assign id_2 = 1;
  assign id_4 = id_1 - -1'b0;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_3,
      id_2,
      id_9,
      id_7,
      id_13,
      id_10,
      id_8,
      id_1,
      id_0,
      id_6,
      id_8,
      id_8,
      id_13,
      id_7,
      id_9,
      id_7,
      id_2,
      id_6,
      id_2,
      id_0,
      id_10,
      id_12,
      id_3,
      id_7,
      id_2,
      id_6
  );
endmodule
