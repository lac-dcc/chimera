// Seed: 720593267
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output wor id_2,
    input tri0 id_3,
    output tri0 id_4,
    input tri id_5,
    output supply1 id_6,
    output tri0 id_7,
    output wand id_8,
    input uwire id_9,
    input supply1 id_10,
    output tri id_11,
    input supply1 id_12,
    input tri id_13,
    output supply0 id_14,
    output uwire id_15
    , id_22,
    input wor id_16,
    output tri1 id_17,
    output supply0 id_18,
    output tri0 id_19,
    output wand id_20
);
  always @(posedge id_13 * -1 - id_10 or negedge 1) $clog2(7);
  ;
  assign id_1 = id_22;
  assign module_1.\id_21 = 0;
endmodule
module module_1 #(
    parameter \id_21 = 32'd26,
    parameter id_0   = 32'd92,
    parameter id_20  = 32'd16,
    parameter id_6   = 32'd29,
    parameter id_9   = 32'd69
) (
    input  tri   _id_0,
    output uwire id_1,
    input  tri1  id_2,
    output tri   id_3
);
  wire  [  -1  :  id_0  ]  id_5  ,  _id_6  ,  id_7  ,  id_8  ,  _id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  _id_20  ;
  and primCall (
      id_3,
      id_8,
      id_17,
      id_11,
      id_14,
      id_22,
      id_24,
      id_19,
      id_18,
      id_15,
      id_7,
      id_2,
      id_13,
      id_5,
      id_12,
      id_16,
      id_25,
      id_23
  );
  wire _ \id_21 ;
  ;
  assign id_16 = 1;
  logic id_22;
  logic [id_0 : id_9] id_23;
  ;
  always @(posedge 1) begin : LABEL_0
    $clog2(34);
    ;
  end
  logic [-1 : id_20  ?  \id_21 : id_6  -  1] id_24 = id_22 == 1, id_25;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_1,
      id_2,
      id_3,
      id_3,
      id_1,
      id_3
  );
  logic [1 : 1] id_26;
  ;
endmodule
