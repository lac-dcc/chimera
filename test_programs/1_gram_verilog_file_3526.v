// Seed: 988360552
module module_0 (
    output tri id_0,
    output tri0 id_1,
    input uwire id_2,
    input tri id_3,
    output tri1 id_4,
    input wire id_5,
    input wire id_6,
    output tri id_7,
    input uwire id_8,
    input tri0 id_9,
    output supply0 id_10,
    input tri0 id_11,
    output tri id_12
);
  timeunit 1ps;
  assign id_0 = id_5;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    output tri id_2,
    output wor id_3,
    output wand id_4,
    output supply1 id_5,
    output tri0 id_6,
    output uwire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_5,
      id_0,
      id_0,
      id_6,
      id_0,
      id_0,
      id_4,
      id_0,
      id_5
  );
  assign modCall_1.type_0 = 0;
  always_latch id_1 <= id_9 == -1;
endmodule
