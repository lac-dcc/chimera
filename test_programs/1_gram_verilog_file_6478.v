// Seed: 2571477222
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    input tri id_6
);
  wire id_8, id_9, id_10;
  wire id_11;
  assign module_1.type_11 = 0;
  wire id_12;
  supply1 id_13 = id_2;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    input supply0 id_2,
    input logic id_3,
    output logic id_4
);
  logic id_6 = id_3, id_7, id_8 = -1, id_9;
  assign id_0 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2
  );
  always @(posedge (1)) id_4 <= id_7;
  wire id_10;
endmodule
