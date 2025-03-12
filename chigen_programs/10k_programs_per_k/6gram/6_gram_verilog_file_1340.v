// Seed: 361871432
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input wire id_2,
    input tri1 id_3,
    input uwire id_4,
    input wire id_5,
    input wand id_6,
    input supply1 id_7,
    output supply1 id_8,
    input supply0 id_9,
    input wor id_10,
    output tri1 id_11,
    output supply0 id_12,
    output wand id_13
);
  wire id_15;
  wire id_16 = id_7, id_17;
endmodule
module module_1 #(
    parameter id_11 = 32'd48,
    parameter id_3  = 32'd47,
    parameter id_4  = 32'd72,
    parameter id_7  = 32'd16
) (
    output wor   id_0,
    output tri0  id_1,
    input  uwire id_2,
    input  uwire _id_3,
    input  wire  _id_4,
    output tri1  id_5,
    output wire  id_6,
    output tri0  _id_7
);
  logic [1 : ""] id_9 = 1 - id_3;
  logic [id_7 : id_4] id_10[1 : id_3  >  -1];
  ;
  localparam id_11 = -1;
  wire id_12 = id_12;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_6,
      id_1
  );
  wire id_13 = id_12;
  and primCall (id_1, id_12, id_2, id_10, id_11, id_9);
  assign id_13 = id_11;
  logic [-1 : -1  -  ~  id_11] id_14;
  ;
  wire [{  -1  {  ~  id_11  }  } : -1] id_15 = id_2;
endmodule
