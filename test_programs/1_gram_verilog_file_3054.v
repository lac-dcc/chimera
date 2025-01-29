// Seed: 2019540590
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input wand id_2,
    input uwire id_3,
    input supply1 id_4,
    output tri id_5,
    output supply1 id_6,
    input tri id_7,
    input supply0 id_8,
    input wor id_9,
    output tri0 id_10
);
  assign id_6 = -1'b0;
  assign id_5 = -1'd0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    output uwire id_3,
    input wire id_4
);
  supply0 id_6;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_0,
      id_1,
      id_0,
      id_3,
      id_3,
      id_4,
      id_1,
      id_6,
      id_6
  );
  assign modCall_1.id_9 = 0;
  id_7 :
  assert property (@* id_6) id_2 = -1;
  assign id_3 = id_7;
  parameter id_8 = 1;
endmodule
