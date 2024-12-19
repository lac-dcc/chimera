// Seed: 2842543943
module module_0 (
    input logic id_0,
    input uwire id_1,
    input wire id_2,
    output uwire id_3,
    input tri1 id_4,
    input wand id_5,
    input supply1 id_6,
    output logic id_7
);
  final begin : LABEL_0
    id_7 <= id_0;
  end
  wand id_9;
  real id_10;
  assign module_1.id_10 = 0;
  assign id_9 = id_4 > ~1;
endmodule
module module_1 (
    output wor id_0,
    output wire id_1,
    input wand id_2,
    output logic id_3,
    input wand id_4,
    input tri id_5,
    input wand id_6,
    output supply1 id_7,
    output tri0 id_8,
    input logic id_9,
    input tri0 id_10
);
  always #id_12 if ("") id_3 <= id_9;
  assign id_0 = id_5;
  wire id_13;
  or primCall (id_7, id_5, id_2, id_12, id_4);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_6,
      id_7,
      id_2,
      id_4,
      id_10,
      id_3
  );
endmodule
