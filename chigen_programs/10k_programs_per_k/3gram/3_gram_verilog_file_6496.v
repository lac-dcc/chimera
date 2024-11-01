// Seed: 2769272760
module module_0 (
    output uwire id_0,
    output tri0 id_1,
    output supply0 id_2,
    output supply0 id_3,
    input tri1 id_4,
    output wire id_5,
    output tri1 id_6,
    input wand id_7,
    output tri id_8
    , id_12,
    input wand id_9,
    input supply0 id_10
);
  assign id_2 = 1;
  id_13(
      .id_0(1),
      .id_1(1),
      .id_2(id_1),
      .id_3(id_1),
      .id_4(~""),
      .id_5(id_4),
      .id_6(id_4 - 1),
      .id_7(id_2),
      .id_8(id_6),
      .id_9(id_1)
  );
  wire id_14;
endmodule
module module_1 #(
    parameter id_14 = 32'd62,
    parameter id_15 = 32'd12
) (
    input uwire id_0,
    output tri1 id_1,
    input tri1 id_2,
    output wand id_3,
    input wand id_4,
    output wor id_5,
    input tri1 id_6,
    output wire id_7,
    output tri1 id_8,
    input supply1 id_9,
    input tri id_10,
    output wor id_11,
    input tri1 id_12
);
  defparam id_14.id_15 = 1'b0; module_0(
      id_8, id_11, id_11, id_11, id_9, id_11, id_7, id_4, id_1, id_12, id_9
  );
endmodule
