// Seed: 2003473577
module module_0;
  assign module_1.id_5 = 0;
  wire id_2, id_3;
  wire id_4, id_5;
  wire id_6;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5,
    output tri0 id_6,
    output supply1 id_7,
    input tri1 id_8,
    output wand id_9,
    input supply1 id_10,
    input tri0 id_11,
    input tri1 id_12,
    output wor id_13,
    input wor id_14,
    output wire id_15,
    input tri0 id_16,
    input tri id_17,
    input tri id_18,
    input uwire id_19,
    input tri0 id_20,
    input supply0 id_21,
    input wand id_22,
    output wire id_23
);
  always $display;
  id_25 :
  assert property (@(negedge id_3) 1) id_7 = id_0;
  xor primCall (
      id_13, id_14, id_16, id_17, id_18, id_19, id_2, id_20, id_21, id_22, id_25, id_3, id_4, id_8
  );
  module_0 modCall_1 ();
endmodule
