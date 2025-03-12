// Seed: 10161653
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    output tri0 id_2,
    input wand id_3,
    output wire id_4,
    output tri0 id_5,
    input wor id_6,
    input tri1 id_7,
    output tri1 id_8
);
  logic [1 'b0 : ""] id_10;
  xnor primCall (id_4, id_3, id_7, id_10, id_6);
  module_2 modCall_1 (
      id_6,
      id_7,
      id_7,
      id_8,
      id_4
  );
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output tri0 id_2
);
  wire id_4;
  ;
  logic id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2
  );
endmodule
module module_2 (
    input tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    output wand id_3,
    output supply0 id_4
);
  assign id_3 = id_2;
  wire  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ;
  wire id_25;
  assign module_0.id_2 = 0;
endmodule
