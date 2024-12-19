// Seed: 101375362
module module_0 (
    output wand id_0
);
  assign module_1.type_12 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    input tri id_2,
    input supply1 id_3,
    input wand id_4,
    input supply0 id_5,
    output supply0 id_6,
    input wor id_7,
    input supply0 id_8,
    input wand id_9,
    output uwire id_10
);
  module_0 modCall_1 (id_10);
endmodule
module module_2 (
    output tri0 id_0,
    output tri1 id_1,
    input supply1 id_2
    , id_18,
    input tri0 id_3,
    input wand id_4
    , id_19,
    output logic id_5,
    input supply1 id_6,
    input logic id_7,
    input logic id_8,
    input tri1 id_9,
    input wire id_10,
    input wand id_11,
    input wor id_12,
    output tri0 id_13,
    input supply0 id_14,
    output wire id_15,
    input supply1 id_16
);
  assign id_15 = 1;
  always_ff begin : LABEL_0
    if (id_10 != "") @(posedge id_2 or(1)) #1 id_19 = 1;
    else #0 if (1) id_5 <= id_8;
  end
  module_0 modCall_1 (id_0);
  assign modCall_1.type_0 = 0;
  wire id_20;
  assign id_5 = id_7;
endmodule
