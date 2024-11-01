// Seed: 2793030897
module module_0 (
    input supply0 id_0,
    output wire id_1,
    input uwire id_2,
    input uwire id_3,
    input wire id_4,
    input wand id_5,
    input tri0 id_6,
    input wor id_7,
    input tri0 id_8,
    input wand id_9,
    input wand id_10,
    input tri0 id_11,
    output tri0 id_12,
    output supply1 id_13,
    input tri0 id_14,
    input tri0 id_15,
    input tri1 id_16,
    input tri0 id_17
    , id_22,
    output wand id_18,
    output uwire id_19,
    output supply1 id_20
);
  assign id_20 = id_4 != 1;
  specify
    (posedge id_23 => (id_24 +: 1)) = (1, id_10);
    (id_25 => id_26) = 1;
  endspecify
  wire id_27;
endmodule
module module_1 (
    output wand  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  tri1  id_3,
    input  wire  id_4,
    input  wor   id_5,
    input  wor   id_6,
    output tri0  id_7
);
  assign id_0 = id_3;
  module_0(
      id_2,
      id_0,
      id_5,
      id_1,
      id_6,
      id_4,
      id_5,
      id_6,
      id_3,
      id_3,
      id_3,
      id_5,
      id_0,
      id_7,
      id_2,
      id_2,
      id_3,
      id_3,
      id_7,
      id_7,
      id_0
  );
endmodule
