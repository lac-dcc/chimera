// Seed: 2837006202
module module_0 (
    output wand id_0,
    output wor id_1,
    input wor id_2,
    output uwire id_3,
    input supply1 id_4
);
  wire id_6;
  always @(posedge id_4) id_0 = 1;
  supply1 id_7;
  wor id_8;
  assign id_0 = id_7;
  assign id_3 = id_7;
  assign module_1.id_7 = 0;
  assign module_0 = id_4;
  logic [7:0] id_9;
  wire id_11;
  assign id_11 = id_10;
  always_ff @(posedge id_2) begin : LABEL_0
    if (1) assign id_0 = ((id_9[1'b0]));
  end
  wire id_12;
  assign id_8 = 1'b0;
endmodule
module module_1 (
    output wand  id_0
    , id_14,
    input  tri   id_1,
    input  tri0  id_2,
    input  wand  id_3,
    input  tri1  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  wire  id_7,
    input  uwire id_8,
    output wor   id_9,
    output uwire id_10,
    input  tri0  id_11,
    input  tri   id_12
);
  assign id_14[1] = id_8 ? id_5 : 1;
  wire id_15;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_4,
      id_0,
      id_4
  );
endmodule
