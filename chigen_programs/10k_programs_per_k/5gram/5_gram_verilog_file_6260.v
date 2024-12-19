// Seed: 774504514
module module_0 (
    output wand id_0,
    output tri1 id_1,
    input wand id_2,
    input tri1 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input wand id_7,
    input wor id_8
);
  wire  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ;
  wire id_24;
  assign module_1.type_6 = 0;
  wire id_25;
  wire id_26;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    output uwire id_3
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_2,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2
  );
  wire id_5;
  assign id_3 = id_5;
endmodule
