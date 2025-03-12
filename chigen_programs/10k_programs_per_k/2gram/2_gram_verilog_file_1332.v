// Seed: 3508596585
module module_0 (
    input wire id_0,
    input wand id_1,
    input tri id_2,
    input wor id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    input uwire id_8
    , id_19,
    input uwire id_9,
    input wor id_10,
    output wor id_11,
    input uwire id_12
    , id_20,
    input uwire id_13,
    input uwire id_14,
    input supply0 id_15,
    output tri id_16,
    output supply0 id_17
);
  wire id_21;
  assign id_11 = {id_20, id_1};
endmodule
module module_1 #(
    parameter id_0  = 32'd29,
    parameter id_13 = 32'd36,
    parameter id_14 = 32'd60,
    parameter id_15 = 32'd14,
    parameter id_3  = 32'd21,
    parameter id_6  = 32'd60
) (
    input uwire _id_0,
    output uwire id_1,
    input wand id_2,
    input tri _id_3,
    output wire id_4,
    input uwire id_5,
    input uwire _id_6,
    input tri1 id_7,
    output wor id_8,
    output tri0 id_9,
    input uwire id_10,
    input uwire id_11,
    output wire id_12,
    input wand _id_13,
    input supply1 _id_14,
    inout supply1 _id_15,
    input tri id_16,
    input uwire id_17,
    input tri0 id_18
);
  logic id_20;
  logic  [  -1 'b0 &  id_13  ?  1  :  id_3  +  id_14  ?  -1  :  -1 'b0 ?  id_0  :  -1 'b0 ?  id_6  :  {  1  ,  1 'h0 +  -1  }  :  (  id_15  )  ]  id_21  ;
  ;
  wire id_22;
  ;
  wire id_23;
  wire id_24;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_18,
      id_17,
      id_17,
      id_5,
      id_11,
      id_5,
      id_11,
      id_11,
      id_4,
      id_2,
      id_16,
      id_11,
      id_10,
      id_9,
      id_8
  );
  localparam integer id_25 = 1;
  wire [1 'b0 : 1] id_26;
endmodule
