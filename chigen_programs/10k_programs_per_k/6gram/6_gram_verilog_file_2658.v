// Seed: 1584063916
module module_0 (
    output wand id_0,
    input tri id_1,
    input supply0 id_2,
    output wire id_3
    , id_14,
    input tri1 id_4,
    output tri0 id_5,
    input wire id_6,
    input tri1 id_7,
    input tri1 id_8,
    input wand id_9,
    input wand id_10,
    output tri1 id_11,
    output supply1 id_12
);
  assign id_11 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd48,
    parameter id_12 = 32'd5,
    parameter id_3  = 32'd30,
    parameter id_4  = 32'd29,
    parameter id_8  = 32'd59
) (
    output supply0 id_0,
    input supply0 id_1,
    input tri id_2,
    input uwire _id_3,
    output wand _id_4
    , _id_11,
    output wire id_5,
    input uwire id_6,
    input tri1 id_7,
    input tri _id_8,
    input wand id_9
);
  wire [id_8 : 1  <=  id_11] _id_12;
  logic id_13[-1 : id_3];
  ;
  logic [1  -  1 : id_4  &  -1] id_14;
  wire id_15;
  assign (pull1, highz0) id_4 = id_13;
  wire id_16;
  wire [id_12  ==  1 : 1] id_17;
  logic id_18;
  ;
  wire id_19;
  always @(posedge id_18) release id_18;
  xor primCall (id_5, id_17, id_15, id_16, id_14, id_1, id_2, id_18, id_9);
  module_0 modCall_1 (
      id_0,
      id_9,
      id_2,
      id_5,
      id_9,
      id_0,
      id_6,
      id_2,
      id_1,
      id_9,
      id_9,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
