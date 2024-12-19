// Seed: 514490608
module module_0 (
    output tri id_0,
    input tri1 id_1,
    output wire id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output supply1 id_6,
    output supply1 id_7,
    input wand id_8,
    input tri id_9,
    output tri0 id_10,
    input uwire id_11,
    output wor id_12,
    input tri1 id_13
);
  wire id_15;
  wire id_16;
  assign id_2 = id_11;
  wire id_17;
  wire id_18;
  assign id_0 = id_4;
endmodule
module module_1 (
    output uwire   id_0,
    input  supply0 id_1#(.id_7(1)),
    output supply0 id_2,
    input  supply1 id_3
    , id_8,
    input  supply1 id_4,
    input  supply0 id_5
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_3,
      id_5,
      id_3,
      id_0,
      id_0,
      id_3,
      id_4,
      id_2,
      id_5,
      id_0,
      id_1
  );
  assign modCall_1.type_6 = 0;
  wire id_10;
  id_11(
      .id_0(1),
      .id_1(1),
      .id_2(id_2),
      .id_3(id_9),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(id_0),
      .id_9(id_10),
      .id_10(id_10),
      .id_11(1),
      .id_12(id_8)
  );
  assign id_2 = 1;
endmodule
