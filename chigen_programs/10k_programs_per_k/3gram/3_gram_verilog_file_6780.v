// Seed: 52447875
module module_0 (
    input uwire id_0,
    input wand id_1,
    input uwire id_2,
    output wire id_3,
    output wand id_4,
    output tri id_5,
    input uwire id_6,
    output uwire id_7,
    input supply1 id_8,
    input supply1 id_9,
    output tri id_10
);
  logic id_12;
  ;
  always_comb @(posedge 1) id_12 <= id_9() ==? id_1;
endmodule
module module_1 (
    output tri  id_0,
    input  wand id_1
);
  logic id_3, id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
