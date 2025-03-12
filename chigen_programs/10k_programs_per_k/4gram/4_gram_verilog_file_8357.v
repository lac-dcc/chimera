// Seed: 3181304626
module module_0 (
    output tri1 id_0,
    input wire id_1,
    input wor id_2,
    output uwire id_3,
    input tri0 id_4
    , id_13,
    input wire id_5,
    input wor id_6,
    output wand id_7,
    input uwire id_8,
    output supply1 id_9,
    output uwire id_10,
    input wor id_11
);
  wire id_14;
  ;
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input tri id_6,
    output wire id_7
);
  assign id_7 = id_3;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_4,
      id_0,
      id_6,
      id_4,
      id_1,
      id_5,
      id_3,
      id_0,
      id_0,
      id_6
  );
  assign modCall_1.id_8 = 0;
  id_9 :
  assert property (@(posedge id_3) id_1)
  else $signed(92);
  ;
  assign id_0 = id_4 && id_3 && -1 || id_3;
endmodule
