// Seed: 4073235460
module module_0 (
    output wand id_0,
    input supply1 id_1,
    output wire id_2
);
  assign id_2 = 'b0;
  logic id_4;
  assign id_2 = id_1 ^ id_1;
endmodule
module module_1 (
    output tri1 id_0
    , id_6,
    input  wire id_1,
    output wor  id_2,
    input  tri0 id_3,
    output wand id_4
);
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_0  = 32'd1,
    parameter id_14 = 32'd23,
    parameter id_15 = 32'd94,
    parameter id_2  = 32'd70,
    parameter id_3  = 32'd89
) (
    input uwire _id_0,
    output supply0 id_1,
    input wand _id_2,
    input tri0 _id_3
    , id_25,
    input supply0 id_4,
    input supply1 id_5,
    output tri1 id_6,
    input supply0 id_7,
    output wor id_8,
    input tri0 id_9,
    output supply0 id_10,
    output supply0 id_11,
    output tri0 id_12,
    output supply0 id_13,
    output wand _id_14,
    input wor _id_15,
    input wire id_16,
    output wand id_17,
    input uwire id_18,
    input tri1 id_19,
    output supply1 id_20,
    input tri0 id_21,
    output wor id_22,
    input supply0 id_23
);
  logic id_26 = 1;
  wire id_27;
  wire id_28;
  wire [-1 : -1] id_29;
  logic [-1 : id_2] id_30;
  assign id_13 = id_23;
  logic [id_14 : id_15] id_31;
  wire id_32;
  parameter id_33 = 1;
  assign module_3.id_8 = 0;
  logic [-1 : 1 'b0] id_34;
  ;
  assign id_8 = 1;
  logic [-1  |  id_3 : id_0] id_35 = id_4 ? 1 : id_31 ^ id_0#(
      .id_29(id_33),
      .id_30(-1'h0 - id_33)
  );
  assign id_25 = 1;
  logic id_36;
  ;
endmodule
module module_3 #(
    parameter id_1  = 32'd68,
    parameter id_10 = 32'd54,
    parameter id_12 = 32'd51,
    parameter id_7  = 32'd45
) (
    input tri0 id_0,
    input supply1 _id_1,
    input wor id_2,
    input tri1 id_3,
    output wire id_4,
    input uwire id_5,
    input supply1 id_6,
    input supply0 _id_7,
    input wand id_8,
    input wor id_9,
    input wand _id_10
);
  real [id_7 : 1] _id_12;
  ;
  assign id_12 = ~1'h0;
  logic [id_1  &  1 : 1] id_13;
  module_2 modCall_1 (
      id_12,
      id_4,
      id_12,
      id_12,
      id_9,
      id_5,
      id_4,
      id_5,
      id_4,
      id_9,
      id_4,
      id_4,
      id_4,
      id_4,
      id_12,
      id_12,
      id_8,
      id_4,
      id_3,
      id_6,
      id_4,
      id_0,
      id_4,
      id_0
  );
  id_14 :
  assert property (@(posedge id_9) -1)
  else;
  static logic [id_12 : id_10  <->  1 'b0] id_15 = 1'h0;
endmodule
