// Seed: 2067073333
module module_0 (
    output tri0 id_0,
    input tri1 id_1
    , id_16,
    input supply1 id_2,
    input wand id_3,
    output tri1 id_4,
    input tri id_5,
    input uwire id_6,
    input wor id_7,
    input wor id_8,
    input wire id_9,
    input tri0 id_10,
    output tri id_11,
    output wand id_12,
    input wand id_13,
    output uwire id_14
);
  assign module_1.id_6 = 0;
  wire id_17;
  id_18 :
  assert property (@(1, posedge 1'b0) id_3) $display(1);
  wire id_19;
  wire id_20;
  assign id_0 = id_6 + 1;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    input  tri1  id_4,
    output wor   id_5,
    input  tri0  id_6,
    input  uwire id_7,
    input  wire  id_8,
    input  wor   id_9
);
  final id_0 <= 1;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_1,
      id_9,
      id_5,
      id_6,
      id_7,
      id_1,
      id_2,
      id_1,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5
  );
  wire id_11;
  wire id_12, id_13, id_14, id_15 = id_11, id_16;
endmodule
