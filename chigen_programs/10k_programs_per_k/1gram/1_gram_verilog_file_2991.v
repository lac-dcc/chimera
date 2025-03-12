// Seed: 3215418680
module module_0 (
    output tri0 id_0[1 : 1  -  -1 'd0],
    input wand id_1,
    input wand id_2,
    output supply0 id_3,
    output tri id_4,
    input tri id_5#(.id_17(1)),
    output supply1 id_6,
    input tri1 id_7,
    output tri0 id_8,
    input tri1 id_9,
    output tri0 id_10,
    output wire id_11,
    input wor id_12,
    input tri0 id_13,
    input uwire id_14,
    input wand id_15
);
  assign id_11 = id_2;
  wire id_18;
  assign id_6 = id_12;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    input  wand  id_2,
    input  wor   id_3,
    output wor   id_4,
    output tri1  id_5,
    input  wire  id_6
);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_4,
      id_5,
      id_0,
      id_5,
      id_0,
      id_5,
      id_2,
      id_4,
      id_4,
      id_6,
      id_0,
      id_2,
      id_6
  );
  assign modCall_1.id_13 = 0;
  always if (1 == 1'b0) id_1 <= id_3;
endmodule
