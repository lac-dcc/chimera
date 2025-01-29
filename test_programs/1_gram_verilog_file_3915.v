// Seed: 1780511879
module module_0 (
    output wor id_0,
    input wand id_1,
    output uwire id_2,
    output wire id_3,
    input wand id_4,
    output wire id_5,
    input tri0 id_6,
    output wand id_7,
    output wand id_8,
    output tri0 id_9,
    output tri0 id_10,
    input uwire id_11,
    input supply0 id_12,
    output uwire id_13,
    input supply1 void id_14,
    input supply0 id_15,
    input wand id_16,
    input wire id_17,
    input supply0 id_18,
    output tri1 id_19,
    output uwire id_20
);
  assign id_8 = -1;
  wire id_22;
  assign id_7 = id_12;
  assign id_9 = 1;
  assign id_2 = -1;
  id_23 :
  assert property (@(-1'h0) -1) $display(1 == id_1 ^ id_15, 1);
  wire id_24;
  assign id_2 = id_15;
  id_25(
      .id_0(-1'b0),
      .id_1(-1),
      .id_2(id_7),
      .id_3(-1),
      .id_4(id_4 ^ id_20),
      .id_5(1),
      .id_6(id_12),
      .id_7(-1),
      .id_8(id_22),
      .id_9(id_23),
      .id_10(1)
  );
endmodule
module module_1 (
    output tri id_0,
    output tri0 id_1,
    input tri id_2,
    output supply1 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_1,
      id_2,
      id_0,
      id_3,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.type_1 = 0;
endmodule
