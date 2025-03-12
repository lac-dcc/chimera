// Seed: 1732347113
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    output wand id_4,
    output uwire id_5,
    output supply0 id_6,
    input tri id_7,
    output supply0 id_8,
    input tri id_9,
    output supply0 id_10,
    output tri0 id_11,
    input wor id_12,
    input wor id_13
);
  wire  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    input  tri1  id_2,
    input  wor   id_3,
    output tri0  id_4,
    input  uwire id_5
);
  bit id_7;
  ;
  assign id_7 = id_1;
  logic id_8, id_9;
  assign id_9 = -1'b0;
  id_10 :
  assert property (@(posedge id_9) id_1)
  else id_7 <= id_3;
  assign id_8 = id_5;
  localparam id_11 = -1;
  not primCall (id_4, id_7);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
