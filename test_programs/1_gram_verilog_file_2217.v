// Seed: 1012071695
module module_0 (
    output uwire id_0,
    output tri id_1,
    output supply0 id_2 id_7,
    input tri1 id_3,
    output uwire id_4,
    output tri1 id_5,
    id_8
);
  wire id_9;
  wire id_10;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output wire id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri0 id_5,
    output tri0 id_6,
    input tri1 id_7,
    input wire id_8
);
  wor id_10, id_11, id_12, id_13, id_14;
  nand primCall (id_5, id_10, id_4, id_12, id_3, id_1);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_8,
      id_2,
      id_5
  );
  assign id_13 = ~id_12;
  assign id_11 = 1;
endmodule
