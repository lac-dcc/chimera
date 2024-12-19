// Seed: 3854114533
macromodule module_0 (
    input tri0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input supply0 id_3
    , id_20,
    input supply1 id_4,
    input wor id_5,
    output tri id_6,
    output tri1 id_7,
    input tri0 id_8,
    output uwire id_9,
    input tri1 id_10,
    output tri0 id_11,
    input wire id_12,
    output wire id_13,
    input wand id_14,
    input tri0 id_15
    , id_21, id_22,
    input tri1 id_16,
    output supply1 id_17,
    input wand id_18
);
  pullup (.id_0(id_11), .id_1(1), .id_2(1));
  id_23(
      1'h0
  );
endmodule
module module_1 (
    input supply1 id_0,
    input wor void id_1,
    output supply1 id_2,
    input wor id_3
    , id_9 = 1,
    input wand id_4,
    output wor id_5,
    output uwire id_6,
    output supply1 id_7
);
  notif1 primCall (id_5, id_0, id_3);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_0,
      id_3,
      id_3,
      id_6,
      id_6,
      id_3,
      id_2,
      id_4,
      id_5,
      id_0,
      id_6,
      id_3,
      id_0,
      id_1,
      id_6,
      id_1
  );
endmodule
