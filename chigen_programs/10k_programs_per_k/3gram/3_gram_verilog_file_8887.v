// Seed: 1638198091
module module_0 (
    output wire id_0,
    output wand id_1,
    input tri0 id_2,
    input uwire id_3,
    input wor id_4,
    output uwire id_5,
    output wand id_6,
    input supply1 id_7
);
  wire id_9;
  ;
  wire id_10;
  integer id_11;
  ;
  logic id_12 = id_2 & id_3;
endmodule
module module_1 #(
    parameter id_2 = 32'd59
) (
    input supply0 id_0,
    output wor id_1,
    inout wand _id_2,
    input tri0 id_3
);
  reg id_5;
  logic [1 : id_2] id_6;
  logic [7:0] id_7;
  logic id_8;
  logic id_9;
  ;
  wire [id_2 : 1] id_10;
  wire id_11;
  wire [1 : -1] id_12;
  logic [~ "" : -1] id_13;
  always @(posedge 1) id_5 = -1;
  wire id_14;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1,
      id_0
  );
  wire id_15, id_16;
  assign id_7  = id_0;
  assign id_15 = id_7[-1];
  xnor primCall (id_1, id_5, id_8, id_13, id_11, id_14, id_0, id_3);
endmodule
