// Seed: 1603209715
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input tri0 id_2
    , id_19,
    input tri id_3,
    output tri id_4,
    output uwire id_5,
    output uwire id_6,
    input wire id_7,
    input tri0 id_8,
    output supply1 id_9,
    input supply0 id_10,
    output supply1 id_11,
    output tri0 id_12,
    output wire id_13,
    input wire id_14,
    output wor id_15,
    input wand id_16,
    input supply0 id_17
);
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    input wire id_2,
    input wire id_3,
    output supply1 id_4,
    input supply1 id_5
);
  tri  id_7  =  id_0  ,  id_8  =  id_3  ,  id_9  =  -1 'd0 ?  id_7  :  id_0  ,  id_10  =  id_10  ,  id_11  =  id_2  .  id_2  ,  id_12  =  id_10  ,  id_13  =  id_7  ,  id_14  =  id_12  ,  id_15  =  1 'b0 ;
  wand id_16 = {1, 1'b0, 1, -1'b0 == -1} - id_5, id_17 = id_10;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_2,
      id_0,
      id_1,
      id_4,
      id_4,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_4,
      id_4,
      id_0,
      id_1,
      id_2,
      id_3
  );
  assign modCall_1.id_17 = 0;
  wire  id_18 = id_5;
  logic id_19;
  ;
endmodule
