// Seed: 942951167
module module_0 #(
    parameter id_6 = 32'd36,
    parameter id_8 = 32'd11
) (
    output uwire id_0,
    output wor   id_1,
    output wor   id_2,
    output uwire id_3
);
  wire  id_5;
  logic _id_6[1 : 1];
  ;
  wire [id_6 : -1  -  -1] id_7;
  logic _id_8;
  ;
  localparam  id_9  =  1  ,  id_10  =  id_9  [  1  ]  [  id_8  ]  ,  id_11  =  id_7  ,  id_12  =  id_9  [  id_6  ]  ,  id_13  =  id_7  <->  1  ,  id_14  =  id_8  ,  id_15  =  id_13  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd2
) (
    output tri0 id_0,
    input supply0 _id_1,
    output wand id_2,
    input supply0 id_3,
    output uwire void id_4,
    output tri1 id_5,
    output wire id_6,
    output wor id_7,
    input wor id_8,
    input wire id_9
);
  wor [id_1 : 1] id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_7
  );
  assign modCall_1.id_12 = 0;
  assign id_11 = 1 == ~1'b0 - id_1;
endmodule
