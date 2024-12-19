// Seed: 1249332603
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wor id_3,
    input wor id_4,
    input uwire id_5,
    input tri1 id_6,
    output supply1 id_7
);
  always repeat (id_6) #1 id_7 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    output wire id_2,
    input wor id_3,
    output wire id_4,
    input tri id_5,
    output supply1 id_6,
    input wand id_7,
    input wire id_8,
    input supply0 id_9,
    input supply0 id_10,
    output wire id_11
);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_5,
      id_1,
      id_5,
      id_5,
      id_2
  );
  assign modCall_1.type_4 = 0;
endmodule
