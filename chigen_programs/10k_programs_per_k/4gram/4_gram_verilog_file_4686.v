// Seed: 470782253
module module_0 (
    input tri1 id_0,
    input wor  id_1,
    input tri  id_2,
    input tri  id_3,
    input wand id_4
);
  logic [7:0] id_6;
  assign id_6[1'b0] = id_2 & id_0 ? 1 : id_4;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    output tri1 id_2,
    output wire id_3,
    output uwire id_4,
    input tri id_5,
    input tri id_6,
    input supply1 id_7,
    output supply1 id_8,
    input wor id_9,
    input wor id_10
);
  wire id_12;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_6,
      id_9,
      id_5
  );
endmodule
