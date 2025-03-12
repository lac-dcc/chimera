// Seed: 4205705218
module module_0 (
    input tri id_0,
    output uwire id_1,
    input tri0 id_2#(
        .id_23(1 - 1),
        .id_24(1),
        .id_25(1),
        .id_26(1)
    ),
    output tri id_3,
    output tri0 id_4,
    input tri1 id_5,
    input uwire id_6,
    output wire id_7,
    input supply1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    input wor id_12,
    input wire id_13,
    input supply1 id_14,
    input tri0 id_15
    , id_27,
    output supply1 id_16,
    input supply0 id_17,
    output supply1 id_18,
    output tri0 id_19,
    input wire id_20,
    input wire id_21
);
  assign id_3 = id_14 - id_2;
  parameter id_28 = (1 == 1'h0);
  shortint id_29 = id_0.id_2, id_30 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd77
) (
    output tri1 id_0,
    input wor _id_1,
    output wand id_2,
    output tri id_3,
    input supply0 id_4,
    output tri0 id_5
);
  localparam id_7 = 1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_2,
      id_0,
      id_4,
      id_4,
      id_5,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4,
      id_3,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_7 = 0;
  logic id_8;
  assign id_3 = id_8["" : id_1];
  parameter id_9 = -1'b0 || id_7;
  nor primCall (id_5, id_4, id_7);
endmodule
