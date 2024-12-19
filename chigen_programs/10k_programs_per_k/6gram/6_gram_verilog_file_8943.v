// Seed: 780113265
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input tri id_3,
    input tri id_4,
    input uwire id_5,
    input wire id_6
);
  assign id_1 = id_4;
  supply1 id_8 = id_6;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    input wand id_3,
    input tri1 id_4,
    output wor id_5,
    input uwire id_6,
    output wor id_7
);
  always @(posedge id_3 or negedge 1) #1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_6,
      id_4,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
