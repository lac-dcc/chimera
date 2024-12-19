// Seed: 3088191772
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wor id_3,
    input tri id_4,
    input tri id_5,
    input tri1 id_6,
    input wand id_7
);
  tri1 id_9;
  assign id_9 = id_4;
endmodule
module module_1 (
    input tri id_0,
    output tri1 id_1,
    input supply0 id_2,
    output wand id_3,
    input tri0 id_4,
    input wand id_5,
    output tri0 id_6,
    input uwire id_7,
    input supply0 id_8#(1 - 1'b0, !id_2),
    input wor id_9,
    input logic id_10
);
  logic id_12;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_8,
      id_5,
      id_0,
      id_5,
      id_5,
      id_7
  );
  assign modCall_1.id_7 = 0;
  assign id_6 = 1;
  assign id_12 = id_10;
  initial begin : LABEL_0
    id_12 <= id_10;
  end
  and primCall (id_3, id_8, id_2, id_10, id_0, id_4, id_5, id_12);
endmodule
