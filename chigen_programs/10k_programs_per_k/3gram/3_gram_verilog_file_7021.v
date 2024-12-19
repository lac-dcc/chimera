// Seed: 3868242586
module module_0 (
    input wand id_0,
    output tri1 id_1,
    output supply0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wire id_5,
    output wor id_6,
    input tri id_7
    , id_14,
    input tri1 id_8,
    input supply1 id_9,
    output tri1 id_10,
    input wire id_11,
    input tri1 id_12
);
  integer id_15;
  wire id_16;
  id_17(
      .id_0(id_15), .id_1(id_10)
  );
  wire id_18;
  supply0 id_19;
  wire id_20;
  assign id_14 = 1'b0;
  assign id_16 = 1;
  wire id_21;
  assign id_2 = 1'b0;
endmodule
module module_1 (
    output wand  id_0,
    output wor   id_1,
    output tri1  id_2,
    output tri1  id_3,
    input  wand  id_4,
    input  uwire id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_4,
      id_5,
      id_0,
      id_1,
      id_4,
      id_5,
      id_5,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_9 = 0;
endmodule
