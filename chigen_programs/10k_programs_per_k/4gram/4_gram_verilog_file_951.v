// Seed: 2580817717
module module_0 (
    input  uwire id_0,
    output tri1  id_1,
    input  wor   id_2,
    input  uwire id_3
);
  assign id_1 = id_2 ^ -1 || 1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output wor id_0,
    output wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    input uwire id_4,
    input supply1 id_5,
    input wire id_6,
    input tri1 id_7,
    output logic id_8,
    input tri1 id_9
);
  always @(id_7)
    id_8 = id_2#(
        .id_7(1),
        .id_6(1),
        .id_4((-1))
    );
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_9
  );
endmodule
