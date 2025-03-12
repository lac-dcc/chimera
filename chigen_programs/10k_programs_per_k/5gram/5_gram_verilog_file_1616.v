// Seed: 2335015228
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wand id_3
    , id_8,
    input supply0 id_4,
    output tri0 id_5,
    input supply1 id_6
);
  assign id_8 = -1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd2
) (
    input  wor   id_0,
    input  tri1  id_1,
    output wor   id_2,
    input  wor   id_3,
    input  tri0  id_4,
    output tri0  id_5,
    output logic id_6,
    input  uwire id_7,
    input  tri   id_8,
    output wire  id_9,
    input  wire  id_10,
    output wor   id_11,
    input  wand  _id_12
);
  assign id_11 = id_3;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_8,
      id_1,
      id_5,
      id_4
  );
  always_ff @(posedge id_7) begin : LABEL_0
    id_6 = id_10;
  end
  wire [id_12  ^  -1 'h0 : -1 'b0] id_14;
  assign id_9  = -1;
  assign id_11 = 1;
  integer id_15;
  ;
endmodule
