// Seed: 3475140056
macromodule module_0 (
    input  wor   id_0,
    input  wire  id_1,
    input  uwire id_2,
    output uwire id_3,
    output tri1  id_4,
    input  wire  id_5,
    output tri0  id_6,
    input  tri0  id_7,
    input  wire  id_8,
    input  uwire id_9
);
  id_11(
      1, id_4, 1, 1
  );
  supply0 id_12 = id_8;
  assign module_1.id_0 = 0;
  wire id_13, id_14;
endmodule
module module_1 (
    input logic id_0,
    input wire id_1,
    input tri id_2,
    input supply1 id_3,
    output wire id_4,
    input tri1 id_5,
    input uwire id_6,
    output logic id_7,
    input logic id_8,
    output wor id_9,
    input supply0 id_10,
    input supply0 id_11,
    input supply0 id_12
);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_4,
      id_9,
      id_12,
      id_9,
      id_12,
      id_10,
      id_5
  );
  assign id_7 = id_8;
  always wait (id_6) id_7 <= id_0;
  parameter id_14 = {-1, id_6} == -1;
  wire id_15, id_16;
endmodule
