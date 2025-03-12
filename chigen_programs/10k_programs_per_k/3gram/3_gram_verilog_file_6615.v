// Seed: 1298505741
module module_0 #(
    parameter id_16 = 32'd99
) (
    output supply0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    inout uwire id_4,
    input tri0 id_5,
    input supply1 id_6#(
        ._id_16(-1),
        .id_17 (1),
        .id_18 (1 - -1)
    ),
    input tri id_7,
    input wire id_8,
    input wire id_9,
    output tri1 id_10,
    output supply1 id_11,
    input tri1 id_12,
    output supply1 id_13,
    output supply0 id_14
);
  wire id_19;
  parameter id_20 = 1;
  assign id_4 = 1;
  real id_21;
  assign id_17 = -1'b0;
  assign id_18 = 1;
  logic [1 : id_16] id_22;
endmodule
module module_1 #(
    parameter id_6 = 32'd11
) (
    input uwire id_0,
    input supply1 id_1,
    input tri0 id_2,
    output wand id_3,
    input tri0 id_4,
    input wire id_5,
    input uwire _id_6,
    output tri0 id_7,
    input tri id_8,
    output wor id_9,
    output supply1 id_10,
    input tri0 id_11,
    input tri id_12,
    output tri id_13,
    input supply0 id_14,
    input uwire id_15,
    input tri id_16,
    output tri1 id_17,
    input wand id_18,
    inout uwire id_19
);
  wire id_21[id_6 : 1];
  module_0 modCall_1 (
      id_19,
      id_7,
      id_2,
      id_0,
      id_19,
      id_5,
      id_5,
      id_11,
      id_2,
      id_16,
      id_17,
      id_3,
      id_1,
      id_10,
      id_19
  );
  assign modCall_1.id_13 = 0;
endmodule
