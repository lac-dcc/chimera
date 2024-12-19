// Seed: 1909841461
module module_0 (
    input tri1 id_0,
    output supply1 id_1
    , id_9,
    output wor id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri id_5,
    input uwire id_6,
    input wor id_7
);
  wire id_11;
  wire id_12, id_13;
  wor  id_14;
  wire id_15;
  assign id_9 = $display(id_14, 1);
  wire id_16;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wire id_3,
    input uwire id_4,
    output uwire id_5,
    output tri id_6,
    output supply0 id_7,
    input wor id_8,
    input wire id_9,
    output supply1 id_10,
    input wor id_11,
    output tri0 id_12,
    output uwire id_13
    , id_16,
    output wand id_14
);
  wire id_17;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_13,
      id_0,
      id_1,
      id_4,
      id_8,
      id_1
  );
  assign modCall_1.id_6 = 0;
  id_18(
      .id_0(1), .id_1(id_6), .id_2(1)
  );
endmodule
