// Seed: 111876596
module module_0 (
    input wire id_0,
    output wor id_1,
    input tri id_2,
    output uwire id_3,
    output uwire id_4,
    input wor id_5,
    output wor id_6,
    output wand id_7,
    input supply0 id_8
    , id_17,
    input supply1 id_9,
    input wand id_10,
    output supply1 id_11,
    output supply0 id_12,
    input supply1 id_13,
    input tri id_14,
    input wor id_15
);
  id_18 :
  assert property (@(negedge 1) 1'b0)
  else $display(id_18, id_5, 1);
  wire id_19;
endmodule
module module_1 (
    output wand id_0,
    input  wire id_1,
    input  wand id_2,
    input  tri  id_3
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_0,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_11 = 0;
endmodule
