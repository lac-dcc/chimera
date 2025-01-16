// Seed: 698079399
module module_0 (
    output wor id_0,
    input uwire id_1,
    input supply1 id_2,
    input wire id_3,
    input uwire id_4,
    input supply0 id_5,
    id_13,
    input wire id_6,
    input wand id_7,
    id_14,
    input wand id_8,
    input wor id_9,
    input supply0 id_10,
    input uwire id_11
);
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    input  tri0  id_2,
    output logic id_3,
    input  tri   id_4,
    input  tri   id_5,
    output tri1  id_6,
    input  uwire id_7,
    input  logic id_8
);
  always $display;
  always_latch begin : LABEL_0
    #1 id_1 = -1;
    if (-1) @(posedge id_4 - id_7) id_3 <= 1;
    else id_3 <= id_8;
  end
  id_10(
      id_4
  );
  wire id_11, id_12;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_7,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_5,
      id_7,
      id_2,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
