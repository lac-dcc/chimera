// Seed: 2027254914
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    output supply1 id_4,
    output tri1 id_5,
    output wor id_6,
    input tri id_7,
    output tri1 id_8,
    input tri id_9,
    input supply0 id_10,
    input tri0 id_11
);
  assign id_6 = id_1 - 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    input wire id_2,
    output wire id_3,
    input wor id_4,
    output logic id_5,
    input wand id_6
);
  always #1 id_5 <= 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_0,
      id_2
  );
endmodule
