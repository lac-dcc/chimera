// Seed: 1273545819
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input wor id_2,
    input wor id_3,
    input tri1 id_4,
    output tri0 id_5,
    output tri id_6,
    output wand id_7,
    input wand id_8,
    output uwire id_9
    , id_35,
    input tri0 id_10,
    input supply1 id_11,
    input wand id_12,
    output wand id_13,
    input supply0 id_14,
    input tri1 id_15,
    input supply1 id_16,
    output wand id_17,
    input tri1 id_18,
    input tri id_19,
    input uwire id_20,
    output wand id_21,
    output uwire id_22,
    output wand id_23,
    input tri1 id_24,
    output tri0 id_25,
    input supply1 id_26,
    input tri id_27,
    input uwire id_28,
    output tri0 id_29,
    output supply0 id_30,
    input wand id_31,
    input wire id_32,
    input supply0 id_33
);
  id_36(
      .id_0(1), .id_1(1'h0), .id_2(id_8), .id_3(id_33), .id_4(1), .id_5(1'b0), .id_6()
  );
endmodule
module module_1 (
    output wire id_0,
    input wor id_1,
    input supply0 id_2
);
  supply0 id_4 = id_1;
  module_0(
      id_2,
      id_0,
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_4,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_2,
      id_4,
      id_0,
      id_2,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_2,
      id_4,
      id_4,
      id_1,
      id_1,
      id_0,
      id_0,
      id_4,
      id_4,
      id_2
  );
  assign id_4 = id_2;
  always
    if (id_4) id_4 = 1;
    else assert (id_2);
endmodule
