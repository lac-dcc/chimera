// Seed: 1825768116
module module_0 (
    input wor id_0,
    output wor id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wand id_4,
    output supply0 id_5,
    output uwire id_6,
    output tri1 id_7,
    input wire id_8
);
  wor id_10 = 1;
  assign module_1.id_1 = 0;
  supply0 id_11 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1
);
  reg id_3;
  assign id_3 = id_0;
  not primCall (id_1, id_0);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0
  );
  always @({
    id_0 == {id_0, id_3},
    id_3,
    id_0,
    -1,
    !id_3 & 1'b0 + -1,
    1,
    1'b0,
    id_0,
    -1'd0
  })
    id_3 = 1;
endmodule
