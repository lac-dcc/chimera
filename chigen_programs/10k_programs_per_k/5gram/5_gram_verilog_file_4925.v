// Seed: 1756646508
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input tri1 id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5,
    output supply1 id_6,
    output wor id_7,
    input tri id_8,
    input tri id_9
);
  final $signed(0);
  ;
  id_11 :
  assert property (@(posedge id_3) id_5)
  else $signed(50);
  ;
  assign module_1.id_10 = 0;
  wire id_12;
  ;
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    input tri id_2,
    output supply0 id_3,
    output supply0 id_4,
    output tri1 id_5,
    output wor id_6,
    output wand id_7
    , id_12,
    inout wor id_8,
    input supply0 id_9,
    output wand id_10
);
  wire [1  !=  -1 : 1] id_13;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_1,
      id_2,
      id_9,
      id_7,
      id_10,
      id_9,
      id_8
  );
endmodule
