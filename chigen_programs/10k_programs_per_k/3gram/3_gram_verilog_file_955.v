// Seed: 1614674496
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    input tri id_3,
    input wand id_4,
    output supply1 id_5
);
  logic [-1 'd0 ^  1 : 1] id_7;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    output tri id_2,
    output tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input wor id_6,
    input wire id_7
);
  id_9 :
  assert property (@(posedge id_1) id_1)
  else disable id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_1,
      id_4,
      id_5
  );
endmodule
