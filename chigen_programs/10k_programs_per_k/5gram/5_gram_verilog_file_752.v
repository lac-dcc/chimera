// Seed: 3278431940
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    input supply0 id_2,
    input tri id_3,
    input wor id_4,
    output wand id_5,
    input supply0 id_6,
    input wor id_7,
    input supply1 id_8
);
  assign id_5 = id_2;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input tri0 id_2,
    output supply0 id_3,
    output logic id_4
);
  always @(id_1 or posedge id_0) id_4 <= 1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.type_2 = 0;
endmodule
