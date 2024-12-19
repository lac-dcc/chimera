// Seed: 236626867
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    output wand id_2,
    input uwire id_3,
    input tri id_4,
    input wor id_5,
    output supply1 id_6,
    input wand id_7,
    input tri1 id_8,
    input uwire id_9,
    output tri0 id_10
    , id_13 = !id_9,
    input tri1 id_11
);
  assign id_2 = 1;
  wire id_14;
  wire id_15, id_16;
  wire id_17 = id_14;
  wire id_18;
  wire id_19;
  integer id_20 (id_1);
  id_21(
      .id_0(id_5.id_1)
  );
  wire id_22;
  assign id_17 = id_15;
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    input supply0 id_2,
    input wand id_3,
    input supply0 id_4,
    output wor id_5,
    input wand id_6,
    output supply1 id_7,
    input wor id_8,
    input supply0 id_9,
    output supply1 id_10,
    input supply0 id_11,
    output tri1 id_12,
    output supply1 id_13
);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_9,
      id_9,
      id_9,
      id_13,
      id_8,
      id_4,
      id_2,
      id_10,
      id_3
  );
endmodule
