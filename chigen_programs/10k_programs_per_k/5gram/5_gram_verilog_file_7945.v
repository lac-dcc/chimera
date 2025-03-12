// Seed: 3272937133
module module_0 (
    input uwire id_0,
    output wand id_1,
    output wand id_2,
    output wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    output tri1 id_6,
    output tri id_7,
    input wire id_8,
    output uwire id_9,
    input wand id_10
);
  wire [1 : -1] id_12;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input tri0 id_2,
    output supply0 id_3,
    output tri1 id_4,
    input wand id_5,
    input uwire id_6
);
  assign {1'b0} = id_1;
  xnor primCall (id_3, id_0, id_2, id_1, id_6, id_5);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_3,
      id_3,
      id_0,
      id_4,
      id_4,
      id_2,
      id_4,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
