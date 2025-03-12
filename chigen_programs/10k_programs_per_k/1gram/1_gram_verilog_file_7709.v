// Seed: 245071628
module module_0 (
    input  wand  id_0,
    input  tri0  id_1,
    output tri0  id_2,
    input  wand  id_3,
    input  wire  id_4,
    input  wor   id_5,
    input  uwire id_6,
    input  tri   id_7,
    input  wor   id_8
);
  assign id_2 = id_5;
  assign module_1._id_1 = 0;
endmodule
module module_1 #(
    parameter id_1  = 32'd37,
    parameter id_11 = 32'd62
) (
    input tri id_0,
    input tri0 _id_1
    , id_16,
    output uwire id_2,
    input tri1 id_3,
    output uwire id_4#(.id_17(1 + 1'h0)),
    input supply0 id_5,
    input tri0 id_6,
    input tri id_7,
    input wand id_8,
    input wire id_9,
    input uwire id_10,
    output supply1 _id_11,
    output tri id_12
    , id_18 = 1,
    input supply1 id_13[-1 'h0 : $realtime],
    input wand id_14
);
  id_19 :
  assert property (@(*) id_10);
  module_0 modCall_1 (
      id_6,
      id_13,
      id_2,
      id_5,
      id_10,
      id_5,
      id_8,
      id_14,
      id_8
  );
  union packed {
    logic id_20;
    logic id_21;
    logic id_22;
    logic [id_1 : id_1  .  id_11] id_23;
    id_24 id_25;
    logic id_26[-1 : 1 'b0 ==  1];
  } id_27;
  always id_27.id_22 = ~-1;
  xnor primCall (
      id_2, id_8, id_10, id_3, id_6, id_18, id_16, id_9, id_5, id_7, id_17, id_14, id_0, id_13
  );
  assign id_12 = id_0;
  assign id_27.id_20 = id_27.id_23;
endmodule
