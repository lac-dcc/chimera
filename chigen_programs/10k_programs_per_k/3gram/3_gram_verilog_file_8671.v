// Seed: 3158814429
module module_0 #(
    parameter id_15 = 32'd29,
    parameter id_16 = 32'd8
) (
    output tri0 id_0,
    input supply0 id_1,
    output tri id_2,
    input tri1 id_3,
    input supply1 id_4,
    output supply1 id_5,
    output uwire id_6,
    input uwire id_7,
    output uwire id_8,
    input tri1 id_9,
    output uwire id_10,
    output tri id_11,
    input tri1 id_12,
    output supply0 id_13
);
  defparam id_15.id_16 = 1; id_17(
      .id_0(id_7 * id_8), .id_1(id_1), .id_2(1'd0), .id_3(1)
  );
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    output tri id_2,
    output supply0 id_3,
    input tri0 id_4,
    input wand id_5,
    output supply0 id_6,
    output wand id_7,
    input tri0 id_8,
    input tri1 id_9,
    output wand id_10,
    input supply1 id_11,
    output wire id_12,
    input tri id_13,
    input tri0 id_14,
    output tri0 id_15,
    input supply1 id_16,
    input supply0 id_17,
    input tri0 id_18,
    input wand id_19,
    output tri0 id_20
    , id_27,
    input tri id_21,
    input tri0 id_22,
    output tri1 id_23,
    input wire id_24,
    input wand id_25
);
  wire id_28;
  or (id_2, id_21, id_8, id_19, id_27, id_17, id_0, id_4, id_18, id_28, id_24, id_5, id_22, id_13);
  module_0(
      id_3, id_25, id_12, id_18, id_11, id_23, id_3, id_22, id_20, id_9, id_7, id_23, id_25, id_2
  );
endmodule
