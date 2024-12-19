// Seed: 88474783
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    input tri0 id_3,
    output wor id_4,
    input tri0 id_5,
    output wire id_6,
    output wire id_7
);
  assign id_4 = id_0;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input wor id_2,
    input tri1 id_3,
    output supply0 id_4,
    input wire id_5,
    output wor id_6,
    output supply0 id_7
);
  logic [7:0] id_9;
  assign id_9[1'b0] = 1'b0;
  wire id_10;
  or primCall (id_4, id_5, id_9, id_0, id_3, id_2);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_4,
      id_5,
      id_6,
      id_4
  );
  assign modCall_1.type_2 = 0;
  wire id_11;
endmodule
