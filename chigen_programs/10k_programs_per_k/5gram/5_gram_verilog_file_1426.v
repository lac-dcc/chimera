// Seed: 981144376
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input uwire id_2
    , id_14,
    input tri1 id_3,
    output tri0 id_4,
    input wire id_5,
    input wire id_6,
    output tri id_7,
    output tri0 id_8,
    input supply1 id_9,
    output tri0 id_10,
    input supply0 id_11,
    input supply1 id_12
);
  wor id_15 = {1'b0, 1};
  assign id_14 = 1;
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    input supply0 id_2,
    input uwire id_3,
    output tri0 id_4,
    input wor id_5,
    output wire id_6,
    input tri1 id_7,
    input uwire id_8,
    input tri1 id_9,
    input wire id_10,
    input tri0 id_11,
    input uwire id_12,
    output tri id_13,
    input wire id_14,
    input wire id_15,
    output supply0 id_16
);
  assign id_6 = id_2 !=? "";
  module_0(
      id_6, id_16, id_3, id_5, id_1, id_5, id_8, id_1, id_16, id_7, id_16, id_9, id_10
  );
  assign id_16 = id_2;
  wire id_18;
  id_19(
      .id_0(id_14),
      .id_1(id_16),
      .id_2(1 == id_14),
      .id_3(id_13),
      .id_4(id_10 && id_0),
      .id_5(id_8),
      .id_6(1 - 1),
      .id_7(1),
      .id_8(id_15),
      .id_9(id_3)
  );
endmodule
