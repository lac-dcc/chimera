// Seed: 690511320
module module_0 (
    output tri0 id_0,
    output uwire id_1,
    output tri id_2,
    input wor id_3,
    output tri1 id_4,
    input supply1 id_5,
    output uwire id_6
);
  logic id_8;
  ;
  assign module_1.id_13 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd13,
    parameter id_7 = 32'd86
) (
    input wand id_0,
    input supply0 id_1,
    input wor id_2,
    output wand id_3,
    input supply1 id_4,
    input uwire _id_5,
    output tri id_6,
    output tri0 _id_7,
    input uwire id_8,
    output tri1 id_9,
    input tri id_10,
    output uwire id_11
);
  assign id_6 = id_8 ? id_1 == id_2 : id_10#(.id_2(1));
  logic id_13[id_7 : id_5];
  module_0 modCall_1 (
      id_11,
      id_6,
      id_6,
      id_8,
      id_6,
      id_1,
      id_11
  );
  assign id_13 = id_4;
  logic [7:0] id_14;
  initial begin : LABEL_0
    id_13 <= id_13;
  end
  assign id_3 = -1 / !id_14[-1];
endmodule
