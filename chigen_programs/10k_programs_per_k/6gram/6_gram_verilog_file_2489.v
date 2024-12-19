// Seed: 4079712191
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    input wor id_2,
    input wor id_3,
    input wire id_4,
    input tri0 id_5,
    output tri id_6,
    output supply1 id_7,
    input wand id_8,
    input tri1 id_9,
    output tri id_10,
    output uwire id_11
);
  id_13(
      .id_0(id_9), .id_1()
  );
  wire id_14;
  assign module_1.type_8 = 0;
  wand id_15 = id_8;
  wire id_16;
  assign id_10 = 1 == ~id_8;
endmodule
module module_1 (
    output uwire id_0,
    output supply1 id_1,
    input tri1 id_2,
    output supply1 id_3,
    output tri1 id_4,
    output supply0 id_5
    , id_13,
    output supply1 id_6,
    input tri0 id_7,
    input supply0 id_8,
    input wire id_9,
    input tri1 id_10,
    output wand id_11
);
  assign id_1 = 1 == id_7;
  uwire id_14, id_15;
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_15,
      id_10,
      id_14,
      id_2,
      id_11,
      id_4,
      id_15,
      id_15,
      id_3,
      id_6
  );
endmodule
