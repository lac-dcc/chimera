// Seed: 4273247582
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output wor id_2,
    input wand id_3,
    input wor id_4,
    input supply0 id_5,
    input uwire id_6,
    input supply0 id_7
);
  assign id_2 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    output uwire id_2,
    input  wire  id_3,
    output uwire id_4,
    input  uwire id_5,
    input  wor   id_6,
    input  tri0  id_7,
    input  uwire id_8,
    output wire  id_9,
    input  tri0  id_10,
    input  uwire id_11,
    output tri0  id_12,
    input  tri   id_13,
    inout  wire  id_14,
    input  tri   id_15
);
  assign id_12 = id_0;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14,
      id_5,
      id_1,
      id_3,
      id_11,
      id_5
  );
  assign modCall_1.id_0 = 0;
  tri0 id_17 = 1;
  wire id_18;
  if (id_5) begin : LABEL_0
    wire id_19;
  end else if (1'h0) wire id_20, id_21, id_22;
  else begin : LABEL_0
    assign id_17 = 1;
  end
endmodule
