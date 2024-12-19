// Seed: 1851438651
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input wire id_3,
    input tri1 id_4,
    output wor id_5,
    input wire id_6,
    input tri id_7,
    output tri0 id_8,
    input supply0 id_9,
    input wand id_10
);
  uwire id_12;
  assign id_8 = id_1;
  always @(negedge (1)) begin : LABEL_0
    id_12 = 1 ? 1 : 1;
  end
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    output supply0 id_2
);
  assign id_0 = id_1 - id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1
  );
endmodule
