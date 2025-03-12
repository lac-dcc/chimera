// Seed: 3786605350
module module_0;
  wire [1 : -1] id_1;
  wire id_2, id_3, id_4, id_5;
endmodule
module module_1 #(
    parameter id_0 = 32'd86,
    parameter id_1 = 32'd42,
    parameter id_2 = 32'd32,
    parameter id_3 = 32'd34,
    parameter id_4 = 32'd7,
    parameter id_7 = 32'd10
) (
    input  tri0  _id_0,
    output tri0  _id_1[1 : 1 'h0],
    input  tri   _id_2,
    input  uwire _id_3
    , _id_7,
    input  wand  _id_4,
    output wor   id_5
);
  logic [7:0] id_8;
  parameter id_9[id_1 : id_0  .  id_3] = -1;
  generate
    begin : LABEL_0
      wire id_10;
    end
  endgenerate
  wire [id_7 : 1 'd0] id_11;
  tri [-1 : 1] id_12, id_13, id_14, id_15, id_16;
  localparam id_17[1 : id_2] = id_9[id_0&id_4 : id_7] == -1;
  assign id_16 = 1;
  module_0 modCall_1 ();
  wire id_18;
  ;
  wire id_19 = id_0;
  localparam id_20 = id_9 | id_17;
  wire  id_21;
  logic id_22 = id_9;
  assign id_16 = ~id_13;
  always id_22 <= #id_17 1;
  assign {id_15, id_22} = id_21;
  wire id_23;
  wire [-1 : 1] id_24;
  wand id_25 = 1 + 1;
endmodule : SymbolIdentifier
