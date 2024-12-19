// Seed: 2584694767
module module_0 (
    output wire id_0,
    input tri1 id_1,
    output supply1 id_2,
    output wire id_3,
    input uwire id_4,
    output tri id_5,
    input tri id_6,
    input supply1 id_7,
    input wor id_8
);
endmodule
module module_1 (
    input  tri0  id_0,
    input  logic id_1,
    output tri1  id_2,
    input  tri1  id_3,
    input  tri0  id_4,
    input  wand  id_5,
    input  tri   id_6,
    output tri   id_7,
    output wire  id_8,
    output logic id_9,
    output wire  id_10
);
  always begin : LABEL_0$display
    ;
    if (1'h0) id_7 = 1'h0;
    else if (1) @(id_4) id_9 <= id_1;
  end
  xnor primCall (id_10, id_6, id_12, id_4, id_3, id_1, id_13, id_5, id_0);
  wire id_12;
  wand id_13;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_8,
      id_7,
      id_13,
      id_13,
      id_4,
      id_13,
      id_6
  );
  assign modCall_1.id_8 = 0;
  wand id_14, id_15, id_16, id_17;
  wire id_18;
  assign id_9  = 1;
  assign id_15 = 1;
  assign id_7  = id_13;
  supply1 id_19 = 1;
  assign id_17 = 1'h0;
endmodule
