// Seed: 4174438015
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    input wor id_3,
    input tri1 id_4,
    input supply1 id_5,
    output wand id_6,
    output supply1 id_7,
    output supply0 id_8,
    output wor id_9,
    input wire id_10,
    output wand id_11
);
  logic [7:0] id_13;
  assign module_1.type_27 = 0;
  id_14(
      .id_0(1),
      .id_1(id_13),
      .id_2(id_2),
      .id_3(id_8 ? 1'b0 : id_3),
      .id_4(1),
      .id_5(1),
      .id_6(id_13[1==1]),
      .id_7(1)
  );
  assign id_11 = id_1;
  wire id_15;
endmodule
module module_1 (
    input wand id_0,
    output wor id_1,
    output tri id_2,
    input supply1 id_3,
    input wire id_4,
    output wor id_5,
    output supply1 id_6,
    input wand id_7,
    input supply1 id_8,
    output tri0 id_9,
    input tri id_10
);
  wire  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_3,
      id_8,
      id_10,
      id_0,
      id_2,
      id_9,
      id_9,
      id_9,
      id_3,
      id_5
  );
endmodule
