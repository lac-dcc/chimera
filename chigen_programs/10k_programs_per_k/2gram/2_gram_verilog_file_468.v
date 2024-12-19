// Seed: 1604613590
module module_0 (
    input supply0 id_0,
    output tri1 id_1,
    output tri1 id_2,
    input tri1 id_3,
    output wor id_4
);
  always begin : LABEL_0
    id_4 = 1;
  end
  assign module_1.id_5 = 0;
  wire id_6;
endmodule
module module_1 (
    input tri1 id_0,
    output supply0 id_1,
    output wand id_2,
    input wire id_3,
    input wor id_4,
    input wire id_5,
    input tri0 id_6,
    input wire id_7,
    input wand id_8
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_2
  );
endmodule
