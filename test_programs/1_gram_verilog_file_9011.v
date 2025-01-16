// Seed: 1205705704
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  tri1  id_1,
    output tri   id_2,
    input  uwire id_3,
    input  tri0  id_4,
    input  tri   id_5
);
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_8,
      id_7,
      id_7
  );
endmodule
module module_2 (
    output logic id_0,
    input supply0 id_1,
    input wor id_2,
    input supply0 id_3,
    output supply1 id_4,
    id_12,
    input supply0 id_5,
    input wor id_6,
    output wor id_7,
    inout wand id_8,
    output wor id_9,
    id_13,
    input logic id_10
);
  always id_0 <= #1 id_10;
  supply0 id_14;
  and primCall (id_9, id_8, id_12, id_2, id_14, id_6, id_10, id_5, id_13, id_3, id_1);
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_14,
      id_12
  );
  wire id_15 = ~id_14;
endmodule
