// Seed: 911893117
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input uwire id_2,
    input tri1 id_3,
    output supply0 id_4,
    input wire id_5,
    input wor id_6,
    input tri0 id_7,
    input tri0 id_8,
    output wand id_9,
    input tri id_10,
    output tri0 id_11,
    input wire id_12,
    input supply0 id_13,
    output uwire id_14
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output tri0 id_4,
    output tri0 id_5,
    input tri1 id_6,
    input tri0 id_7
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_6,
      id_3,
      id_0,
      id_6,
      id_7,
      id_6,
      id_3,
      id_0,
      id_3,
      id_5,
      id_6,
      id_3,
      id_2
  );
  assign id_1 = 1;
endmodule
