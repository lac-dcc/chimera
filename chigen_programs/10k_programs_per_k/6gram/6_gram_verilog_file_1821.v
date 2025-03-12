// Seed: 3764001313
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input wor id_2,
    output uwire id_3,
    output tri1 id_4,
    output supply1 id_5,
    input wand id_6,
    output wor id_7
);
  always @(posedge id_2) $signed(5);
  ;
endmodule
module module_1 (
    output uwire id_0,
    output tri0  id_1,
    output tri   id_2,
    output wor   id_3,
    input  wor   id_4,
    inout  uwire id_5
);
  reg id_7 = id_5 ? 1'h0 : -1;
  assign id_1 = -1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_5,
      id_1
  );
  assign modCall_1.id_1 = 0;
  initial id_7 = id_7;
endmodule
