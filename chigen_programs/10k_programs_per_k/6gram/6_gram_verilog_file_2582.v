// Seed: 1513915653
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input uwire id_2,
    output tri id_3,
    output tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    output supply1 id_8,
    output wand id_9,
    input wire id_10
);
endmodule
module module_1 (
    output wor id_0,
    output wand id_1,
    inout supply0 id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    input tri id_1,
    output supply1 id_2
);
  logic id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_0 = 0;
  always @(negedge -1) release id_2;
endmodule
