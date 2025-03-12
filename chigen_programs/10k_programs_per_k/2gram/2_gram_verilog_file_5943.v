// Seed: 3811642774
module module_0 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2,
    input  tri1  id_3,
    input  tri0  id_4,
    output uwire id_5,
    output wire  id_6,
    input  tri0  id_7,
    input  tri0  id_8,
    output uwire id_9,
    output wor   id_10,
    input  tri0  id_11,
    output wor   id_12,
    output uwire id_13,
    input  tri1  id_14,
    input  wor   id_15
);
  initial begin : LABEL_0
    disable id_17;
  end
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd45,
    parameter id_7 = 32'd83
) (
    input supply1 _id_0,
    output supply0 id_1,
    inout supply0 id_2,
    input wire id_3,
    output wire id_4,
    input uwire id_5,
    input supply1 id_6 id_9,
    input wand _id_7
);
  assign id_9 = 1'b0 ^ -1;
  struct packed {
    logic [id_0 : (  &  id_7  )] id_10;
    logic id_11;
    logic [-1 'b0 : -1] id_12;
    logic id_13;
  } [-1 : -1  ==  -1] id_14;
  assign id_1 = 1;
  assign id_2 = -1;
  or primCall (id_1, id_2, id_11, id_10, id_3, id_14, id_9, id_6, id_12, id_15);
  assign id_4 = id_0;
  wire id_15;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_4,
      id_3,
      id_6,
      id_9,
      id_9,
      id_9,
      id_2,
      id_9,
      id_2,
      id_3,
      id_4,
      id_9,
      id_6,
      id_5
  );
endmodule
