// Seed: 889436954
module module_0 (
    output uwire id_0,
    input wire void id_1,
    input tri0 id_2
);
  wire id_4;
  module_2 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.type_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    output tri0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input wire id_8
);
  wire id_10;
  always_comb @(posedge id_6);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_7
  );
  assign modCall_1.type_5 = 0;
endmodule
module module_2 (
    input  tri  id_0,
    input  wire id_1,
    input  tri0 id_2,
    input  wand id_3,
    output wand id_4
);
  always @(negedge id_2 or negedge -1 or posedge -1 or -1'b0) $display(id_0, id_2);
endmodule
