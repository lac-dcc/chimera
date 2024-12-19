// Seed: 815327310
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input supply0 id_2,
    input wire id_3,
    output wor id_4,
    output tri0 id_5,
    output tri1 id_6,
    output wire id_7,
    input supply0 id_8,
    output tri1 id_9,
    output wand id_10,
    output supply1 id_11,
    input tri1 id_12,
    input wor id_13,
    input supply1 id_14,
    output supply0 id_15,
    input supply1 id_16,
    output tri id_17,
    input supply1 id_18,
    input wor id_19,
    output tri id_20,
    input uwire id_21,
    input tri0 id_22,
    output wand id_23
);
  id_25(
      .id_0(id_12), .id_1(id_1), .id_2(1), .id_3(1)
  ); id_26(
      .id_0(id_1 - 1), .id_1(id_15), .id_2(), .id_3(1'b0)
  );
  wire id_27;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1
    , id_19,
    input  tri   id_2,
    output uwire id_3,
    input  tri0  id_4,
    input  wor   id_5,
    input  wire  id_6,
    input  tri   id_7,
    output tri   id_8,
    output wand  id_9,
    output wire  id_10,
    input  tri1  id_11,
    input  tri0  id_12,
    input  wire  id_13,
    input  tri   id_14,
    output tri0  id_15,
    input  wor   id_16,
    input  tri1  id_17
);
  wire id_20;
  wire id_21;
  assign id_19 = id_17 | id_11;
  module_0 modCall_1 (
      id_2,
      id_13,
      id_7,
      id_5,
      id_3,
      id_3,
      id_15,
      id_0,
      id_14,
      id_10,
      id_9,
      id_15,
      id_13,
      id_4,
      id_11,
      id_8,
      id_11,
      id_10,
      id_1,
      id_1,
      id_8,
      id_6,
      id_7,
      id_3
  );
  assign modCall_1.type_30 = 0;
  wire id_22;
  id_23(
      .id_0({id_1, (1), 1}), .id_1(1)
  );
  supply1 id_24;
  assign id_24 = id_13;
endmodule
