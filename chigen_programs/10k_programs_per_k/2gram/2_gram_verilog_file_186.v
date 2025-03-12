// Seed: 1721937530
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input tri id_2,
    input wor id_3,
    output wor id_4,
    output supply1 id_5,
    output tri id_6,
    output supply0 id_7,
    input tri0 id_8,
    output tri1 id_9,
    input uwire id_10,
    input tri1 id_11,
    input supply0 id_12,
    input tri id_13,
    input wand id_14,
    output uwire id_15
);
  wire  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ;
  wire [-1 : -1] id_31;
  assign id_9 = id_17;
  assign id_5 = id_11;
  assign id_29 = id_31;
  assign module_1.id_9 = 0;
  wire id_32;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    output supply0 id_2,
    input wor id_3,
    input wire id_4,
    input tri0 id_5,
    output wire id_6,
    input wand id_7,
    input wand id_8,
    output supply1 id_9,
    input tri0 id_10
);
  rtran (-1, id_10, id_2, id_6);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_7,
      id_9,
      id_2,
      id_6,
      id_6,
      id_3,
      id_6,
      id_10,
      id_8,
      id_4,
      id_3,
      id_4,
      id_9
  );
endmodule
