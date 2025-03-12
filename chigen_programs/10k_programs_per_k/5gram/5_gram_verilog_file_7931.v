// Seed: 3769348203
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input wor id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wor id_5,
    output tri id_6,
    input uwire id_7
);
  parameter id_9 = 1 + 1;
  logic id_10 = id_3 != id_7 - (id_5);
  assign id_6 = ~id_10 == id_7 > -1;
  wire id_11;
  assign id_6 = 1;
  wire id_12;
  wire id_13;
  timeunit 1ps;
  wire id_14;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output wand id_0,
    input wire id_1,
    input uwire id_2,
    input supply0 id_3,
    input wire id_4,
    input supply0 id_5
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_2,
      id_1,
      id_0,
      id_3,
      id_0,
      id_4
  );
  wire id_7;
endmodule
