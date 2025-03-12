// Seed: 1146162812
module module_0 (
    output tri1 id_0,
    input wor id_1,
    output supply0 id_2,
    input tri0 id_3,
    output tri0 id_4
);
  assign id_2 = 1;
  assign id_0 = id_3;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    input uwire id_2,
    output tri0 id_3
    , id_9,
    inout wire id_4,
    output wand id_5,
    input wire id_6
    , id_10,
    input tri0 id_7
);
  nand primCall (id_4, id_9, id_1, id_7, id_10, id_6, id_2);
  module_0 modCall_1 (
      id_5,
      id_7,
      id_4,
      id_1,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input uwire id_0,
    output uwire id_1,
    input wire id_2,
    input tri id_3,
    output supply1 id_4
    , id_6
);
  id_7 :
  assert property (@(negedge -1'b0 or(1'b0)) 1)
  else id_6 <= -1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_1
  );
endmodule
