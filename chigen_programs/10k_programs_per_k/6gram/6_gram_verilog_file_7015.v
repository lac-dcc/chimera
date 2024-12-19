// Seed: 1594481561
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3,
    input uwire id_4,
    output wire id_5,
    input wand id_6,
    input tri id_7,
    output wand id_8
);
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    input uwire id_6,
    output logic id_7
);
  always @(1) id_7 = #1 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_0,
      id_5,
      id_6,
      id_0
  );
  assign modCall_1.type_11 = 0;
endmodule
