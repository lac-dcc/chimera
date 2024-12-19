// Seed: 2722987480
module module_0 (
    output supply0 id_0,
    output logic id_1,
    output supply1 id_2,
    output supply0 id_3,
    input wor id_4,
    input wire id_5,
    input supply1 id_6,
    input wor id_7,
    input supply1 id_8
);
  always @(posedge id_5) id_1 <= 1;
endmodule
module module_1 (
    output logic id_0,
    output tri   id_1,
    input  tri0  id_2,
    input  tri1  id_3,
    output tri0  id_4
);
  tri0 id_6;
  always @(id_2 or negedge (1 == 1))
    if (id_2 || 1 && id_6 != id_6) id_0 <= 1;
    else id_4 = (id_3 & id_2);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
