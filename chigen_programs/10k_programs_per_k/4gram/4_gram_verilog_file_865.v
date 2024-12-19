// Seed: 3671763326
module module_0 (
    input supply1 id_0
    , id_22,
    input wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    input wor id_6,
    input tri1 id_7,
    output supply0 id_8,
    input wor id_9,
    input wire id_10,
    input wand id_11,
    input tri id_12,
    input uwire id_13,
    output uwire id_14,
    input wor id_15,
    output wor id_16,
    output uwire id_17,
    output tri id_18,
    input wand id_19,
    output supply1 id_20
);
  always @(negedge id_0 or posedge id_11) begin : LABEL_0
    id_8 = id_4;
  end
  wire id_23;
  wire id_24;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    output tri   id_1,
    input  tri0  id_2,
    output tri1  id_3,
    input  wire  id_4,
    input  uwire id_5,
    input  wor   id_6,
    output wire  id_7,
    input  tri1  id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_8,
      id_4,
      id_5,
      id_6,
      id_4,
      id_1,
      id_8,
      id_6,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_7,
      id_3,
      id_3,
      id_6,
      id_3
  );
endmodule
