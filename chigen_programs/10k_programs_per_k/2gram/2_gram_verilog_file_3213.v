// Seed: 848160785
module module_0 (
    output wor id_0,
    output wor id_1
    , id_9,
    output supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input tri id_7
);
  specify
    (id_10 => id_11) = (-1  : -1  : id_7);
  endspecify
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    input wand id_2,
    output tri1 id_3,
    input wand id_4,
    output supply1 id_5,
    output tri0 id_6,
    input tri1 id_7,
    input uwire id_8,
    input wand id_9,
    input tri1 id_10
);
  wire id_12;
  id_13 :
  assert property (@(posedge id_4) id_7)
  else;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_7,
      id_2,
      id_5,
      id_7,
      id_10
  );
  assign modCall_1.id_1 = 0;
endmodule
