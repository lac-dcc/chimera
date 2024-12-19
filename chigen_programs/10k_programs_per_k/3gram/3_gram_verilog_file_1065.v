// Seed: 3154140369
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri id_3,
    output tri id_4
    , id_12,
    input uwire id_5,
    input uwire id_6,
    input wire id_7,
    input tri0 id_8,
    input supply1 id_9,
    output supply0 id_10
);
  assign id_10 = 1;
  wire id_13;
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    input  wire id_0,
    output wand id_1
);
  wire id_3;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 (
    output tri0 id_0,
    input wor id_1,
    input uwire id_2,
    output logic id_3,
    input wand id_4,
    output tri1 id_5,
    output supply0 id_6,
    input tri0 id_7,
    input supply1 id_8
);
  always_latch @(posedge 1) id_3 <= 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_5,
      id_8,
      id_7,
      id_1,
      id_7,
      id_2,
      id_6
  );
endmodule
