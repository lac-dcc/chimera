// Seed: 2179919232
module module_0 (
    input tri id_0,
    input tri id_1,
    input supply1 id_2,
    input uwire id_3,
    input supply0 id_4,
    output uwire id_5,
    input uwire id_6,
    input wor id_7,
    input wire id_8,
    input wire id_9,
    output tri1 id_10,
    output supply1 id_11,
    input tri1 id_12
);
  assign id_5 = id_2;
  tri id_14 = 1;
  wire  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ;
  wire id_33;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    output tri1 id_2,
    output tri0 id_3,
    input wand id_4,
    output wor id_5,
    output tri id_6,
    input wand id_7,
    input supply0 id_8,
    input tri0 id_9,
    output tri1 id_10,
    output wire id_11,
    input tri1 id_12,
    input tri0 id_13
);
  wire id_15;
  assign id_3 = id_1;
  nor (id_10, id_8, id_15, id_12, id_13, id_0, id_1, id_4, id_9);
  module_0(
      id_8, id_9, id_4, id_4, id_9, id_2, id_7, id_4, id_1, id_12, id_3, id_10, id_7
  );
endmodule
