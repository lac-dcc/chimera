// Seed: 3429277746
module module_0 (
    output wand id_0,
    input wire id_1,
    output supply0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output wire id_5,
    output wor id_6,
    output uwire id_7,
    output tri0 id_8,
    input uwire id_9,
    input tri id_10,
    input supply1 id_11,
    input tri0 id_12,
    output tri1 id_13,
    output wand id_14,
    output uwire id_15,
    input wand id_16,
    output uwire id_17,
    input supply1 id_18,
    input wand id_19,
    output wor id_20
    , id_23,
    input supply0 id_21
    , id_24
);
  uwire id_25 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output tri1 id_5
);
  uwire id_7;
  assign id_7 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_2,
      id_3,
      id_0,
      id_5,
      id_0,
      id_0,
      id_4,
      id_3,
      id_2,
      id_4,
      id_0,
      id_0,
      id_5,
      id_1,
      id_5,
      id_2,
      id_3,
      id_5,
      id_3
  );
  wire  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ;
  nor primCall (id_5, id_2, id_7, id_1, id_4);
endmodule
