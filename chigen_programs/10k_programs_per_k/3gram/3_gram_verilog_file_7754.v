// Seed: 2750797554
module module_0 (
    output wire id_0,
    output tri1 id_1,
    output uwire id_2,
    input uwire id_3,
    input wire id_4,
    input supply1 id_5,
    input uwire id_6,
    input tri id_7,
    input supply1 id_8,
    input tri0 id_9,
    output wire id_10,
    output tri0 id_11
    , id_17,
    input wire id_12,
    input wor id_13,
    output supply1 id_14,
    output tri0 id_15
    , id_18
);
  always @(posedge id_17 or posedge id_6);
  id_19 :
  assert property (@(posedge id_8 <= -1'b0) id_9)
  else id_17 = #id_20 1;
endmodule
module module_1 #(
    parameter id_0 = 32'd26
) (
    input wire _id_0,
    input supply1 id_1,
    output tri id_2,
    input uwire id_3
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_20 = 0;
  wire [(  1  )  ==  -1 : 1  ?  id_0 : (  1 'b0 )] id_5;
endmodule
