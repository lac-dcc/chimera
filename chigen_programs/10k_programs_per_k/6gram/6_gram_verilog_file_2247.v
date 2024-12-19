// Seed: 175572671
module module_0 (
    input supply0 id_0,
    output tri id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri id_4,
    output tri1 id_5,
    input tri0 id_6,
    output wor id_7
);
  wor  id_9;
  wire id_10;
  assign id_5 = 1;
  assign id_1 = id_9;
  wire id_11;
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    input supply0 id_2,
    input wire id_3,
    output tri1 id_4,
    input tri id_5,
    output supply1 id_6,
    output wire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_5,
      id_1,
      id_5,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
