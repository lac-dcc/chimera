// Seed: 3482385503
module module_0 (
    output tri1 id_0,
    input wand id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wor id_4,
    output uwire module_0,
    output uwire id_6,
    output supply0 id_7
    , id_11,
    output supply1 id_8,
    input supply1 id_9
);
  wire id_12;
  ;
  wire id_13;
  struct packed {id_14 id_15;} id_16;
  wor id_17 = -1 == id_11;
  wire id_18;
  tri0 id_19 = 1;
  logic id_20;
  wire id_21;
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd50,
    parameter id_10 = 32'd57,
    parameter id_11 = 32'd78,
    parameter id_13 = 32'd2,
    parameter id_18 = 32'd60
) (
    inout wire id_0,
    output wand _id_1,
    input supply0 id_2,
    input wand id_3,
    input wire id_4,
    input tri1 id_5,
    output tri0 id_6,
    output tri id_7,
    output tri0 id_8,
    output wand id_9
    , id_17,
    input wand _id_10,
    input supply0 _id_11,
    input wand id_12,
    input wor _id_13,
    input tri0 id_14,
    input supply0 id_15
);
  logic [1 : id_1  -  1 'h0] _id_18 = id_13 < id_5;
  wire [-1 : id_11  ==  id_10] id_19;
  module_0 modCall_1 (
      id_8,
      id_14,
      id_6,
      id_15,
      id_5,
      id_9,
      id_6,
      id_8,
      id_9,
      id_2
  );
  assign modCall_1.id_8 = 0;
  wire [id_18 : id_13] id_20;
  logic id_21;
  id_22 :
  assert property (@(posedge -1'h0) 1'h0)
  else $clog2(62);
  ;
endmodule
