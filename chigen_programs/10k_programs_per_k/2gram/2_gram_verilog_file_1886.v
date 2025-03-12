// Seed: 1841872943
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    output tri1 id_3,
    output tri0 id_4,
    input tri id_5,
    input tri id_6,
    output uwire id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri0 id_10,
    output wire id_11,
    input wire id_12,
    output wor id_13
);
  assign id_3 = -1;
  wire id_15;
  ;
  pullup (1, 1, id_11 <-> 1'b0 & id_7);
endmodule
module module_1 (
    input tri1 id_0,
    output uwire id_1,
    output wor id_2,
    input tri1 id_3,
    output wor id_4,
    output tri1 id_5,
    input supply1 id_6,
    input wire id_7
);
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_6,
      id_1,
      id_4,
      id_6,
      id_7,
      id_5,
      id_3,
      id_3,
      id_0,
      id_5,
      id_6,
      id_1
  );
  assign modCall_1.id_0 = 0;
  assign id_2 = 1;
  assign id_4 = -1;
  assign id_1 = id_3;
  assign id_4 = 'b0;
  assign id_2 = 1;
endmodule
