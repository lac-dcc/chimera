// Seed: 3314096141
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input tri id_2,
    input tri1 id_3,
    input tri id_4,
    output wire id_5,
    output wor id_6,
    output tri id_7,
    output wand id_8,
    output uwire id_9,
    output wor id_10,
    input supply0 id_11,
    input wor id_12,
    input wand id_13,
    input wor id_14,
    output supply0 id_15,
    output supply0 id_16,
    input supply1 id_17,
    input supply0 id_18,
    input tri id_19
);
  logic [-1 : 1  *  1] id_21, id_22;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    input supply0 id_2,
    output uwire id_3,
    input uwire id_4,
    output uwire id_5
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_3,
      id_5,
      id_3,
      id_5,
      id_5,
      id_1,
      id_1,
      id_1,
      id_4,
      id_5,
      id_5,
      id_4,
      id_2,
      id_0
  );
  assign modCall_1.id_15 = 0;
  id_7 :
  assert property (@(negedge id_2) -1)
  else $clog2(63);
  ;
  wire id_8;
endmodule
