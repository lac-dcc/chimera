// Seed: 1999697155
module module_0 (
    input wor id_0,
    input tri id_1,
    output supply0 id_2,
    input tri1 id_3,
    input tri id_4,
    output tri0 id_5,
    input supply0 id_6,
    output tri0 id_7,
    output supply1 id_8,
    output wor id_9
);
  wire id_11;
  logic [7:0] id_12;
  always @({id_1, id_12[1]}) id_11 = 1;
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    input supply1 id_2,
    input wor id_3,
    output wire id_4,
    input wand id_5,
    input wand id_6,
    input tri0 id_7
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_6,
      id_4,
      id_5,
      id_4,
      id_4,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
