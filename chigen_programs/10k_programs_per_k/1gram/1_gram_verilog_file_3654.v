// Seed: 2132207608
module module_0 (
    output wor   id_0,
    output uwire id_1,
    input  wor   id_2,
    input  tri   id_3,
    output uwire id_4,
    input  tri0  id_5,
    input  wor   id_6,
    input  wire  id_7,
    input  tri   id_8,
    input  tri   id_9,
    output wand  id_10,
    input  wire  id_11,
    output tri1  id_12,
    input  tri0  id_13
);
  assign id_10 = id_2;
  struct packed {
    logic   id_15;
    logic   id_16;
    logic   id_17;
    integer id_18;
  } id_19;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd54,
    parameter id_9  = 32'd86
) (
    output wire id_0,
    input wand id_1,
    output uwire id_2,
    input wor id_3[id_9 : -1 'b0 ?  1  <<  1 'h0 : id_13],
    input tri0 id_4,
    output tri1 id_5,
    inout supply0 id_6,
    input tri0 id_7,
    output supply1 id_8,
    input uwire _id_9,
    input tri1 id_10,
    inout supply1 id_11,
    output tri1 id_12,
    input tri1 _id_13,
    input supply0 id_14
);
  assign id_0 = 1;
  assign id_5 = id_14;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_7,
      id_4,
      id_11,
      id_7,
      id_6,
      id_10,
      id_10,
      id_7,
      id_11,
      id_10,
      id_5,
      id_7
  );
  assign modCall_1.id_3 = 0;
  wire id_16;
  wire [-1 : 1] id_17;
  wire id_18;
  ;
endmodule
