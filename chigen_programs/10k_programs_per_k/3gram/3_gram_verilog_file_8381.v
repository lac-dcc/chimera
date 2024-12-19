// Seed: 1639489766
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output uwire id_2,
    input supply1 id_3,
    input uwire id_4,
    input wor id_5,
    input supply1 id_6,
    output tri id_7,
    input tri id_8,
    input supply1 id_9,
    output supply0 id_10,
    input uwire id_11,
    input tri id_12,
    input supply0 id_13
);
  assign id_2 = id_4;
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    output wand id_2,
    output uwire id_3,
    output tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri1 id_7,
    input wire id_8,
    output supply0 id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_0,
      id_7,
      id_7,
      id_1,
      id_8,
      id_0,
      id_5,
      id_6,
      id_3,
      id_8,
      id_6,
      id_8
  );
  always @(posedge id_6) id_9 = 1;
endmodule
