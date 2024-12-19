// Seed: 4166602639
module module_0 (
    input  wor   id_0,
    output wor   id_1,
    input  tri   id_2,
    output uwire id_3,
    output wire  id_4,
    output tri   id_5,
    input  tri   id_6,
    output wand  id_7
);
  wire id_9;
  wire id_10;
  assign id_1 = id_6;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1
    , id_12,
    output wand id_2,
    input tri0 id_3,
    output wand id_4,
    input tri0 id_5,
    input uwire id_6,
    output tri0 id_7,
    output supply1 id_8,
    output tri1 id_9,
    input uwire id_10
);
  if (1) begin : LABEL_0
    wire id_13;
    integer id_14;
    tri id_15 = 1;
  end else begin : LABEL_0
    assign id_7 = id_3;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_4,
      id_9,
      id_4,
      id_0,
      id_4
  );
endmodule
