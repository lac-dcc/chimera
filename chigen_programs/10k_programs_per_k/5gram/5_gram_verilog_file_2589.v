// Seed: 3244847374
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    output wand id_2,
    input wor id_3,
    input uwire id_4,
    input wire id_5,
    input tri id_6,
    input wire id_7,
    output tri1 id_8,
    input wand id_9,
    input wand id_10,
    input tri0 id_11,
    output wand id_12
);
  id_14 :
  assert property (@(posedge id_5) id_5)
  else $clog2(72);
  ;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    input wor id_2,
    input tri0 id_3
);
  always @(1 or posedge 1 - 1'b0) id_1 = id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule
