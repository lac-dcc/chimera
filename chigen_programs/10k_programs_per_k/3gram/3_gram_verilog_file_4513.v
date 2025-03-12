// Seed: 1453765429
module module_0 (
    input wand id_0,
    input uwire id_1,
    input wor id_2,
    output supply1 id_3,
    output wire id_4,
    input wire id_5,
    input wand id_6
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output tri id_3,
    output wor id_4,
    input tri1 id_5,
    output tri id_6
);
  wire id_8;
  ;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_2,
      id_6,
      id_1,
      id_5
  );
endmodule
module module_2 (
    input wire id_0,
    input uwire id_1,
    input tri0 id_2,
    input wor id_3,
    input wand id_4,
    output supply0 id_5,
    input wire id_6,
    input tri1 id_7,
    output logic id_8
);
  assign id_5 = id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_5,
      id_5,
      id_3,
      id_6
  );
  assign modCall_1.id_4 = 0;
  always @(id_2 or posedge 1) id_8 <= -1 + ~-1 || id_7 || id_1;
  wire [-1 : 1] id_10;
endmodule
