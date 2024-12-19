// Seed: 3763529479
module module_0 (
    input tri0 id_0,
    output tri id_1,
    input tri0 id_2,
    output wand id_3,
    output uwire id_4,
    input wand id_5,
    input supply0 id_6,
    input wire id_7
);
  wire id_9;
  assign id_1 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    output tri id_2,
    input uwire id_3,
    output tri0 id_4,
    input supply0 id_5
);
  id_7 :
  assert property (@(posedge id_5) 1)
  else;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_2,
      id_7,
      id_3,
      id_5,
      id_5
  );
  assign modCall_1.type_3 = 0;
  initial id_7 = 1;
  assign id_4 = 1 + id_3;
endmodule
