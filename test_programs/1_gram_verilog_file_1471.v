// Seed: 3734347138
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input tri1 id_2,
    output wor id_3,
    output uwire id_4,
    input wor id_5,
    input wor id_6,
    input supply0 id_7,
    id_21,
    output wor id_8,
    output wire id_9,
    output wand id_10,
    output wand id_11,
    input tri0 id_12,
    output wand id_13,
    output tri1 id_14,
    output tri1 id_15,
    input wor id_16,
    output supply1 id_17,
    output supply0 id_18,
    output supply0 id_19
);
  wire id_22;
  assign id_19 = -1 * 1;
  wire id_23;
  assign id_10 = id_1;
endmodule
module module_1 (
    output wire  id_0,
    output uwire id_1,
    output tri   id_2,
    output wire  id_3,
    input  uwire id_4,
    input  uwire id_5,
    output wand  id_6,
    input  wand  id_7
);
  parameter id_9 = -1;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_4,
      id_9,
      id_3,
      id_5,
      id_5,
      id_9,
      id_3,
      id_2,
      id_9,
      id_0,
      id_5,
      id_1,
      id_3,
      id_0,
      id_7,
      id_9,
      id_9,
      id_6
  );
  assign modCall_1.type_4 = 0;
  uwire id_10 = id_4;
  for (id_11 = -1; id_9; id_9 = id_10) assign id_1 = (1);
  wire id_12;
  wire id_13;
  id_14(
      .id_0(id_7), .id_1(1), .id_2(id_11), .id_3(id_10)
  );
  localparam id_15 = -1;
endmodule
