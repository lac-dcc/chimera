// Seed: 2272427197
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    output wand id_5,
    input wire id_6,
    input uwire id_7,
    output wand id_8,
    input wand id_9,
    input wire id_10
);
  assign module_1.type_2 = 0;
  assign id_8 = id_9;
  supply0 id_12, id_13, id_14 = id_10;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input wor id_2,
    input logic id_3,
    input wor id_4,
    output logic id_5,
    input wire id_6
);
  wire id_8;
  tri  id_9;
  assign id_5 = 1;
  id_10 :
  assert property (@(id_9 * id_9) id_2) id_5 <= id_3;
  wor id_11, id_12;
  assign id_9 = 1;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_6,
      id_4,
      id_10,
      id_10,
      id_4,
      id_10,
      id_2,
      id_10
  );
  localparam id_15 = id_11;
  wire id_16 = ~-1;
endmodule
