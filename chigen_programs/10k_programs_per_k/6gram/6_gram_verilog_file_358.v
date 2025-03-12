// Seed: 2880349998
module module_0 (
    output tri id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    output tri1 id_5,
    input supply1 id_6,
    input tri id_7
);
  assign id_0 = id_1 & 1'b0;
  assign id_5 = id_1 > id_4;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input tri id_2,
    input wire id_3,
    input wor id_4,
    input wor id_5,
    input supply0 id_6,
    output wand id_7
);
  assign id_7 = -1;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_0,
      id_6,
      id_7,
      id_5,
      id_6
  );
  assign modCall_1.id_7 = 0;
endmodule
