// Seed: 2602246435
module module_0 #(
    parameter id_3 = 32'd90,
    parameter id_4 = 32'd39,
    parameter id_5 = 32'd2,
    parameter id_7 = 32'd13
) (
    output tri  id_0,
    output tri0 id_1,
    output tri0 id_2,
    input  tri0 _id_3,
    output wor  _id_4,
    output wand _id_5
    , _id_7
);
  assign id_1 = -1;
  wire [id_7 : -1] id_8;
  union packed {
    logic [id_4 : id_5] id_9;
    struct packed {
      logic [1 : -1] id_10;
      logic [id_3  !=?  1 : id_5] id_11;
    } [id_4 : -1] id_12;
  } id_13;
  ;
endmodule
module module_1 #(
    parameter id_0  = 32'd17,
    parameter id_1  = 32'd12,
    parameter id_12 = 32'd31,
    parameter id_18 = 32'd17,
    parameter id_2  = 32'd9,
    parameter id_21 = 32'd65,
    parameter id_7  = 32'd56
) (
    input supply0 _id_0,
    output uwire _id_1,
    input tri0 _id_2,
    input supply1 id_3
    , id_17,
    input tri0 id_4,
    input supply1 id_5,
    input tri id_6,
    input supply0 _id_7,
    input uwire id_8,
    input uwire id_9,
    output tri0 id_10,
    input supply1 id_11,
    input supply1 _id_12,
    output supply1 id_13,
    input tri1 id_14,
    input tri id_15
);
  assign id_17[id_7] = -1;
  localparam id_18 = 1;
  logic [id_1 : id_2] id_19;
  ;
  module_0 modCall_1 (
      id_10,
      id_13,
      id_10,
      id_18,
      id_18,
      id_18
  );
  uwire [-1 : id_12] id_20;
  assign id_20 = -1 ? -1'b0 < -1 : 1;
  wire _id_21;
  wire id_22;
  assign id_20 = id_19[~id_0==?id_18 : id_21];
endmodule
