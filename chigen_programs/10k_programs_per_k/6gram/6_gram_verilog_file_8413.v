// Seed: 827149016
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri1 id_6,
    output supply0 id_7,
    output wand id_8,
    output tri id_9,
    output tri0 id_10,
    output wire id_11,
    output supply0 id_12,
    output uwire id_13
    , id_16,
    output wand id_14
);
  wire id_17;
  always id_16 = #1 1;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output tri1 id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wor id_8,
    input tri0 id_9,
    output uwire id_10,
    output tri0 id_11,
    input uwire id_12,
    input tri1 id_13,
    input tri0 id_14,
    input tri id_15,
    output tri1 id_16
);
  assign id_5 = 1;
  id_18(
      .id_0(1), .id_1(1), .id_2(1), .id_3(id_1 != id_12), .id_4(1'h0 << id_0), .id_5(id_0)
  );
  xor (id_10, id_4, id_8, id_7, id_9, id_15, id_3, id_14, id_18, id_6, id_12, id_1, id_13);
  module_0(
      id_4,
      id_16,
      id_6,
      id_4,
      id_13,
      id_13,
      id_5,
      id_10,
      id_11,
      id_10,
      id_5,
      id_16,
      id_16,
      id_2,
      id_10
  );
endmodule
