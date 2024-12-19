// Seed: 2686178748
module module_0 (
    output tri1 id_0,
    output wor  id_1
);
  wire id_3;
  integer id_4 = 1;
  wire id_5, id_6;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    output supply0 id_4,
    input tri id_5,
    output tri id_6,
    input wire id_7,
    output wire id_8,
    input uwire id_9,
    input supply0 id_10,
    input wand id_11,
    input tri0 id_12,
    input wor id_13,
    input wire id_14,
    output supply0 id_15,
    input tri1 id_16,
    input tri0 id_17,
    input uwire id_18
    , id_21,
    input tri1 id_19
);
  tri1 id_22;
  module_0 modCall_1 (
      id_8,
      id_6
  );
  id_23 :
  assert property (@(posedge id_9 !=? 1) id_3 - 1 || id_10 == 1'b0 - id_22 >= 1)
  else $display(id_3, id_9);
  assign id_22 = id_0;
  nand primCall (
      id_6,
      id_9,
      id_19,
      id_11,
      id_2,
      id_5,
      id_7,
      id_0,
      id_21,
      id_12,
      id_13,
      id_17,
      id_18,
      id_22,
      id_14,
      id_3
  );
endmodule
