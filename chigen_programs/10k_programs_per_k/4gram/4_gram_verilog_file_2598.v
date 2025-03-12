// Seed: 2543348034
module module_0 (
    input wire id_0,
    input tri id_1,
    output tri0 id_2,
    input supply0 id_3,
    output wire id_4,
    input wor id_5,
    input wor id_6,
    input wire id_7,
    input tri id_8,
    input tri0 id_9,
    input tri id_10,
    output wor id_11,
    output tri1 id_12,
    input tri0 id_13,
    input tri id_14
    , id_20,
    output wand id_15,
    output supply0 id_16,
    input supply0 id_17,
    output supply1 id_18
);
  assign id_4 = id_10;
  always force id_15 = -1'b0;
  assign module_1.id_2 = 0;
  assign id_20[-1] = id_10;
  assign id_15 = 'b0;
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    input wor id_2,
    input supply0 id_3,
    input wire id_4
);
  specify
    (posedge id_6 => (id_7 +: 1)) = ((id_1): 1 != 1  : id_3, -1);
    (negedge id_8 => (id_9 +: 1)) = (-1, id_3);
    (id_10 => id_11) = 1;
  endspecify
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_3,
      id_3,
      id_2,
      id_4,
      id_2,
      id_0,
      id_0,
      id_2,
      id_3,
      id_0,
      id_0,
      id_2,
      id_0
  );
endmodule
