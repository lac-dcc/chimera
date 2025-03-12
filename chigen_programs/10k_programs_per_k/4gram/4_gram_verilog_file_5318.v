// Seed: 4123720929
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    input wor id_5,
    output wor id_6
);
  parameter id_8 = 1;
endmodule
module module_1 (
    output logic id_0,
    output tri1  id_1,
    input  wire  id_2,
    output tri1  id_3,
    input  tri   id_4,
    output tri0  id_5,
    input  wor   id_6,
    input  wor   id_7
);
  always @(id_0++or posedge id_4) id_0 <= id_2;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_4,
      id_2,
      id_6,
      id_4,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
