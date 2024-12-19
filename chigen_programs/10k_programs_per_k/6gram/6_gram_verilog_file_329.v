// Seed: 1190215357
module module_0 (
    output tri   id_0,
    input  uwire id_1,
    output uwire id_2,
    output wand  id_3,
    output wire  id_4
);
  assign id_3 = id_1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output wand id_0,
    output wand id_1,
    input wor id_2,
    input supply0 id_3,
    input wire id_4,
    input wire id_5,
    output tri id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri1 id_9,
    output wire id_10,
    input wire id_11
);
  assign id_6 = 1;
  xnor primCall (id_6, id_2, id_9, id_11, id_5, id_7, id_3, id_4, id_8);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_6,
      id_1,
      id_6
  );
  id_13(
      .id_0(id_1), .id_1(id_2), .id_2(id_9), .id_3((1'b0)), .id_4(1), .id_5(id_3), .id_6(id_7)
  );
endmodule
