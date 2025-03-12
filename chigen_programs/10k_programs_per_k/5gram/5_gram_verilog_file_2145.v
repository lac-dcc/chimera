// Seed: 2459838549
module module_0 (
    input tri id_0,
    input wire id_1,
    input wire id_2,
    input wand id_3,
    output supply0 id_4,
    input supply1 id_5,
    input uwire id_6,
    input wand id_7,
    input supply1 id_8,
    output supply0 id_9,
    input tri0 id_10,
    input wire id_11,
    input wand id_12,
    input supply1 id_13,
    output wor id_14
);
  assign id_9 = -1;
  specify
    (id_16 => id_17) = 1;
    if (1) (negedge id_18 *> (id_19 +: id_8)) = (id_17, id_13);
    specparam id_20 = -1 == ~id_6;
  endspecify
  wire id_21;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    output wire  id_2,
    output wor   id_3,
    input  uwire id_4,
    input  wire  id_5,
    output wor   id_6,
    input  wor   id_7,
    input  uwire id_8
);
  localparam id_10 = 1 == 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_8,
      id_3,
      id_5,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_4,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
