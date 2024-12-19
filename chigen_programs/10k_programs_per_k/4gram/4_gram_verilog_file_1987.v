// Seed: 2886151187
module module_0 (
    input uwire id_0,
    output wand id_1,
    output tri1 id_2,
    input tri1 id_3
    , id_9,
    input supply0 id_4,
    input uwire id_5,
    input wand id_6,
    output supply1 id_7
);
  uwire id_10 = id_9 & id_0;
  assign id_1 = id_10 + id_4 - 1;
endmodule
module module_1 (
    input  tri1  id_0,
    output logic id_1
);
  supply0 id_3 = id_0.id_0;
  always @(posedge $display or posedge id_3) id_1 <= 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
