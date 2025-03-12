// Seed: 324996359
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    output wire id_2,
    output wor id_3,
    input wire id_4,
    input wand id_5,
    input tri0 id_6,
    output tri id_7,
    output supply1 id_8,
    output tri0 id_9,
    input tri1 id_10,
    output tri1 id_11,
    input supply1 id_12
);
  assign id_2 = id_4 - 'b0;
  assign id_3 = 1;
  assign id_9 = id_4;
  assign id_8 = 1'h0;
  parameter id_14 = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd33,
    parameter id_3  = 32'd43,
    parameter id_5  = 32'd4,
    parameter id_9  = 32'd56
) (
    input supply1 id_0,
    output tri1 id_1,
    input wor id_2,
    input wand _id_3,
    output uwire id_4,
    input wand _id_5
    , _id_11,
    input tri0 id_6,
    input uwire id_7,
    input wire id_8,
    input tri0 _id_9
);
  logic [-1 'b0 : 1] id_12;
  wand [id_9  #  (  .  id_9  (  {  (  1  )  &  1 'b0 {  -1  *  1 'b0 }  }  )  ) : -1] id_13;
  always_comb @(id_6 or posedge -1, -id_11);
  logic [id_11 : id_3] id_14;
  ;
  logic id_15 = -1'b0 ^ {1, -1, id_2 !=? id_12};
  wire [-1 'b0 : id_5] id_16;
  or primCall (id_1, id_15, id_14, id_13, id_8, id_7, id_6, id_0, id_12, id_16);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_1,
      id_0,
      id_2,
      id_2,
      id_4,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_11 = 0;
  assign id_13 = -1;
endmodule
