// Seed: 402797289
module module_0 (
    output tri0 id_0,
    output wand id_1,
    output wor id_2,
    input wand id_3,
    output uwire id_4,
    input supply1 id_5,
    output supply0 id_6
);
  assign id_4 = 1;
  assign id_0 = id_3;
endmodule
module module_1 (
    output tri0 id_0,
    inout supply1 id_1,
    output tri id_2,
    output wor id_3,
    input uwire id_4,
    output wor id_5,
    output wor id_6,
    input supply1 id_7,
    input tri1 id_8,
    output wor id_9,
    input tri1 id_10,
    input wand id_11,
    output supply1 id_12,
    input supply0 id_13,
    input tri0 id_14,
    output supply1 id_15
    , id_30,
    output wire id_16,
    input supply1 id_17,
    input supply1 id_18,
    output tri id_19,
    input supply1 id_20,
    input uwire id_21,
    output wire id_22,
    input wand id_23,
    input tri id_24,
    input tri0 id_25,
    input supply0 id_26,
    output tri id_27,
    input uwire id_28
);
  id_31 :
  assert property (@(posedge id_1) id_14)
  else $display(id_4);
  xor (
      id_2,
      id_24,
      id_21,
      id_14,
      id_26,
      id_17,
      id_11,
      id_1,
      id_20,
      id_31,
      id_13,
      id_18,
      id_4,
      id_7,
      id_28,
      id_30,
      id_23
  );
  module_0(
      id_6, id_1, id_5, id_11, id_19, id_4, id_2
  );
endmodule
