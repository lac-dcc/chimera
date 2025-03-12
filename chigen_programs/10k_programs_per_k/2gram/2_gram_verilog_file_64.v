// Seed: 694573345
module module_0 #(
    parameter id_23 = 32'd36,
    parameter id_25 = 32'd32
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(
        .id_7 (id_8),
        .id_9 (-1),
        .id_10(id_11),
        .id_12(id_13),
        .id_14(id_15)
    ),
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    _id_23,
    id_24,
    _id_25,
    id_26,
    id_27
);
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_19 = id_20[-1];
  logic [-1 : id_23] id_28;
  ;
  logic [1 'b0 : id_25] id_29;
  ;
  parameter id_30 = 1;
endmodule
module module_1 #(
    parameter id_17 = 32'd94,
    parameter id_20 = 32'd39,
    parameter id_21 = 32'd95,
    parameter id_6  = 32'd70,
    parameter id_7  = 32'd34,
    parameter id_8  = 32'd78
) (
    input wire id_0,
    input wor id_1,
    input wor id_2,
    output tri1 id_3,
    input tri0 id_4,
    output wire id_5
    , id_29,
    output supply0 _id_6,
    input tri1 _id_7,
    input wand _id_8,
    input supply0 id_9,
    input tri0 id_10,
    input supply0 id_11,
    output supply1 id_12,
    input tri id_13,
    input supply1 id_14,
    output wor id_15,
    output tri id_16,
    input uwire _id_17,
    output tri0 id_18,
    input wand id_19,
    input tri0 _id_20,
    output wand _id_21,
    output wire id_22,
    input wor id_23,
    input tri0 id_24,
    input supply1 id_25,
    output tri1 id_26,
    input uwire id_27
);
  logic [id_6  +  (  id_21  )  |  id_21 : id_20] id_30;
  always assign id_3[id_7-:id_17] = id_24;
  parameter id_31 = 1;
  module_0 modCall_1 (
      id_29,
      id_31,
      id_29,
      id_31,
      id_31,
      id_29,
      id_29,
      id_31,
      id_31,
      id_29,
      id_29,
      id_31,
      id_29,
      id_31,
      id_29,
      id_31,
      id_29,
      id_29
  );
  pmos (
      {-1, -1, id_1} == id_1, 1, id_9, id_21, id_7 - -1'b0, id_3, id_30[1'b0], id_29 * id_2, id_2
  );
  wire [id_8 : -1] id_32;
endmodule
