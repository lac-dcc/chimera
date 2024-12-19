// Seed: 3146719721
module module_0 (
    output supply0 id_0,
    input uwire id_1
    , id_8,
    input tri id_2,
    output supply0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri1 id_6
);
  integer id_9;
endmodule
module module_1 (
    output wor id_0,
    output wire id_1,
    input uwire id_2,
    output supply0 id_3
    , id_14,
    input wire id_4,
    output wand id_5,
    input supply0 id_6,
    input uwire id_7,
    output supply1 id_8,
    output wand id_9,
    output wor id_10,
    input supply0 id_11,
    output uwire id_12
);
  supply0 id_15 = id_15 && 1;
  wire id_16;
  wire id_17;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_2,
      id_5,
      id_1,
      id_5,
      id_11
  );
  assign modCall_1.id_5 = 0;
  id_18 :
  assert property (@(posedge 1) id_18)
  else $display(1, id_15);
endmodule
