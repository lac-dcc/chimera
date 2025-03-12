// Seed: 1598562920
module module_0 (
    output uwire id_0,
    output wire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri1 id_4,
    input wire id_5,
    input tri1 id_6,
    output uwire id_7,
    output uwire id_8,
    input wor id_9,
    input wand id_10,
    output supply0 id_11,
    input tri1 id_12,
    input tri0 id_13,
    input tri id_14,
    output tri1 id_15,
    output wand id_16,
    input wire id_17,
    output tri id_18,
    input supply1 id_19,
    input supply0 id_20,
    input supply0 id_21
);
  always
  `define pp_23 0
  supply0 id_24 = id_21 || id_21;
  assign id_4 = -1;
  assign `pp_23 = 'b0;
  assign id_4 = id_14;
  assign module_1.id_12 = "";
endmodule
module module_1 #(
    parameter id_0 = 32'd80,
    parameter id_2 = 32'd66,
    parameter id_3 = 32'd94,
    parameter id_9 = 32'd54
) (
    output tri0 _id_0,
    output uwire id_1,
    input uwire _id_2,
    input tri0 _id_3,
    input tri1 id_4,
    output tri0 id_5,
    input supply1 id_6,
    input wor id_7
);
  assign id_5 = id_6;
  parameter id_9 = 1;
  bit [id_9 : id_3] id_10, id_11;
  id_12 :
  assert property (@(posedge id_9 or id_11) "") id_10 <= id_2;
  wire [id_3 : (  id_2  )] id_13, id_14[1 : id_0], id_15, id_16, id_17;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4,
      id_6,
      id_1,
      id_7,
      id_6,
      id_5,
      id_5,
      id_4,
      id_4,
      id_1,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5,
      id_4,
      id_1,
      id_7,
      id_6,
      id_7
  );
endmodule
