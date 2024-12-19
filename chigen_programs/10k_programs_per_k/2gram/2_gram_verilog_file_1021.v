// Seed: 3009162433
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    output wor id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wand id_5,
    output tri1 id_6,
    input wand id_7
);
  module_2 modCall_1 (id_2);
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wire  id_1,
    input  tri   id_2,
    input  wor   id_3,
    output uwire id_4
);
  assign id_1 = id_2;
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_3,
      id_2,
      id_1,
      id_4,
      id_3
  );
  wire id_7;
endmodule
module module_2 (
    output tri id_0
);
  assign id_0 = id_2[1];
  always @(posedge id_2) $display(1);
  wire id_3, id_4;
endmodule
