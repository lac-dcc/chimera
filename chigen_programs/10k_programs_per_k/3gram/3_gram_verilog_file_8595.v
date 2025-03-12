// Seed: 3968247791
module module_0 (
    input  wire id_0,
    output tri  id_1,
    input  wand id_2
);
  localparam id_4 = 1;
  wire id_5;
  wire id_6;
  logic [1 : 1 'h0] id_7, id_8;
endmodule
module module_1 #(
    parameter id_0 = 32'd24
) (
    input  wand  _id_0,
    input  wor   id_1,
    output logic id_2,
    output wire  id_3,
    output uwire id_4,
    input  tri   id_5,
    output wand  id_6,
    input  tri0  id_7,
    input  tri0  id_8,
    input  wor   id_9,
    input  tri   id_10,
    input  wand  id_11
);
  reg [-1 : 1  &&  id_0] id_13 = id_1;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8
  );
  always @(negedge 1)
    if (-1) id_13 = 1;
    else begin : LABEL_0
      id_2 = ~id_10;
    end
  xor primCall (id_4, id_5, id_11, id_1, id_13, id_7, id_10);
endmodule
