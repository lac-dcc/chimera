// Seed: 1714995756
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    output tri0 id_3
    , id_11,
    output wor id_4,
    input wor id_5,
    input wire id_6,
    output uwire id_7,
    output supply1 id_8,
    input supply0 id_9
);
  assign id_11 = -1 !=? id_0;
  assign id_1 = 1;
  assign id_7 = -1'd0;
  assign module_1.id_16 = 0;
endmodule
module module_0 #(
    parameter id_3 = 32'd85,
    parameter id_4 = 32'd86,
    parameter id_5 = 32'd85
) (
    input tri1 id_0,
    output tri1 id_1,
    output wor module_1,
    input supply0 _id_3,
    output supply0 _id_4,
    input supply0 _id_5,
    input wor id_6,
    input wire id_7
);
  wire id_9;
  logic [id_4 : id_3] id_10;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_0,
      id_1,
      id_1,
      id_6,
      id_7,
      id_1,
      id_1,
      id_6
  );
  wire id_11;
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
  wire id_12;
  wire [id_5 : 1] id_13;
  assign id_9 = !id_11;
  logic id_14;
  ;
  always @(-1'b0 or id_7) begin : LABEL_0
    if (-1'b0) id_11 += 1;
  end
  xnor primCall (id_1, id_6, id_0, id_10, id_7);
  wire id_15;
  wand id_16 = id_10 + id_3 / -1;
  assign id_2 = id_5;
  always
    if (1)
      assume (1 !=? "");
      else disable id_17;
endmodule
