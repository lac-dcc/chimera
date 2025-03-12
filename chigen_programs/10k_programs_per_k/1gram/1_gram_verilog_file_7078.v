// Seed: 207147113
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  tri   id_3,
    output wire  id_4,
    input  tri   id_5,
    input  tri0  id_6,
    input  wand  id_7,
    input  wire  id_8,
    input  uwire id_9,
    input  tri0  id_10,
    input  tri1  id_11,
    input  tri0  id_12,
    input  uwire id_13,
    input  wire  id_14,
    input  uwire id_15
);
  assign id_2 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd58
) (
    output logic id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    output wand id_4,
    input tri id_5,
    output tri id_6,
    input supply0 id_7[id_12 : ""],
    input wor id_8,
    output tri id_9,
    input wor id_10,
    output logic id_11,
    input uwire _id_12[-1 : -1],
    output logic id_13,
    input wand id_14,
    output wand id_15
);
  reg id_17;
  ;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_15,
      id_5,
      id_9,
      id_3,
      id_8,
      id_5,
      id_5,
      id_3,
      id_3,
      id_8,
      id_7,
      id_10,
      id_1,
      id_1
  );
  logic id_18;
  always begin : LABEL_0
    id_18 = -1;
    begin : LABEL_1
      id_17 <= (1'h0) - id_1;
      id_0  <= id_3;
    end
    id_13 = id_18;
    id_11 <= id_7;
  end
  assign id_17 = id_12;
endmodule
