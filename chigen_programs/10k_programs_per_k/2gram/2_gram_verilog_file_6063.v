// Seed: 4197531529
module module_0 (
    output supply1 id_0,
    input tri id_1,
    output wire id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input tri id_7,
    output wand id_8,
    output wor id_9,
    output wire id_10,
    input supply0 id_11
);
endmodule
module module_1 (
    input wire id_0,
    output uwire id_1,
    output uwire id_2,
    input tri1 id_3
    , id_12,
    input supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    input wire id_7
    , id_13,
    input uwire id_8,
    input supply0 id_9,
    input supply0 id_10
);
  id_14(
      .id_0((1)), .id_1('b0), .id_2(1), .id_3(1), .id_4({id_12, id_6, id_10})
  );
  module_0 modCall_1 (
      id_2,
      id_10,
      id_13,
      id_9,
      id_2,
      id_9,
      id_6,
      id_5,
      id_12,
      id_2,
      id_13,
      id_3
  );
  assign modCall_1.type_1 = 0;
  wire id_15;
  assign id_12 = {id_4 | 1, id_6};
  wire id_16;
  wire id_17;
  id_18(
      .id_0(1),
      .id_1(1),
      .id_2(id_16),
      .id_3(1),
      .id_4((1)),
      .id_5((id_2) && 1),
      .id_6(1 - 1),
      .id_7(1),
      .id_8(1'b0)
  );
  wire id_19;
  wand id_20;
  assign id_20 = 1;
  wire id_21;
  assign id_16 = id_15;
  wire id_22;
endmodule
