// Seed: 639171679
module module_0 (
    output tri0 id_0,
    output tri id_1,
    input tri id_2,
    output tri1 id_3,
    input tri0 id_4,
    output tri0 id_5
    , id_30,
    input supply1 id_6,
    input supply0 id_7,
    output uwire id_8,
    output uwire id_9,
    input wire id_10,
    input supply1 id_11
    , id_31,
    input supply1 id_12,
    output supply0 id_13,
    output supply0 id_14,
    input wor id_15,
    input wire id_16,
    output supply1 id_17,
    output supply1 id_18,
    output tri0 id_19,
    output wire id_20,
    input wire id_21,
    input wor id_22,
    input wand id_23,
    output supply0 id_24,
    input wand id_25,
    input tri id_26,
    output tri1 id_27,
    input supply1 id_28
);
endmodule
module module_1 #(
    parameter id_0 = 32'd50,
    parameter id_2 = 32'd87
) (
    input supply0 _id_0,
    output wand id_1,
    input wand _id_2,
    output tri1 id_3,
    output wire id_4,
    input uwire id_5
);
  logic [1 : 1] id_7 = id_0 == id_5;
  union packed {
    logic [id_2 : id_2  ==  id_0] id_8;
    logic [1 'b0 : -1] id_9;
  } id_10 = id_0;
  assign id_4 = -1 * id_10 - -1;
  assign id_10[-1==1] = id_2;
  logic id_11;
  ;
  assign id_10.id_9 = id_10;
  always @(posedge 1 & "" or 1) id_11 = -1;
  wire id_12 = id_2;
  assign id_10[id_2] = id_10.id_9[1!=1'b0];
  module_0 modCall_1 (
      id_1,
      id_4,
      id_5,
      id_1,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5,
      id_5,
      id_1,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_3,
      id_1,
      id_5,
      id_5,
      id_5,
      id_4,
      id_5,
      id_5,
      id_1,
      id_5
  );
  assign modCall_1.id_3 = 0;
  specify
    (id_13 *> id_14) = (-1'b0, id_2);
    (id_15 => id_16) = ("" ^ id_14 - id_0, 1);
    if (id_7 == id_10.id_9) (posedge id_17 => (id_18 +: 1 > id_11)) = (id_15 > -1'b0, id_14);
    (id_19 => id_20) = 1;
  endspecify
endmodule
