// Seed: 1442305151
module module_0 (
    output wire id_0,
    output tri1 id_1,
    output wand id_2,
    input supply0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input uwire id_6,
    input tri1 id_7,
    output uwire id_8,
    input wor id_9,
    input tri0 id_10,
    input tri1 id_11,
    output wand id_12
);
  assign id_12 = id_5;
endmodule
module module_1 (
    input wor id_0,
    output wor id_1,
    input wire id_2,
    output supply0 id_3,
    output wor id_4,
    input wor id_5,
    input supply0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    output wand id_9,
    input wor id_10
);
  assign id_4 = id_5;
  wire [-1 : ( 'd0 )] id_12;
  logic id_13;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_1,
      id_5,
      id_2,
      id_8,
      id_7,
      id_10,
      id_4,
      id_8,
      id_5,
      id_0,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
