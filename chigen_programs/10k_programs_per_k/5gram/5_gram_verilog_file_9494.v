// Seed: 3793159351
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output tri id_5,
    input wor id_6,
    output tri1 id_7,
    input supply0 id_8
    , id_19,
    input wor id_9,
    input wire id_10,
    output wand id_11,
    input tri id_12,
    output uwire id_13,
    output uwire id_14,
    input wor id_15,
    output wor id_16,
    output tri id_17
);
  wire id_20;
  assign id_19 = id_8;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1
);
  wand id_3, id_4, id_5, id_6, id_7;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
  id_8 :
  assert property (@(posedge id_1) 1'b0)
  else $display(1 - 1, id_6);
endmodule
