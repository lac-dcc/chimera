// Seed: 641133659
module module_0 (
    input supply1 id_0,
    output wire id_1,
    input tri id_2,
    input supply0 id_3,
    output supply1 id_4
);
  assign id_1 = 1'b0;
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input  wand id_1,
    input  tri0 id_2
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
  wand id_4 = id_4++;
  assign id_0 = 1 + id_4++;
  assign {id_4, -1} = -1;
  bit id_5;
  initial begin : LABEL_0
    id_5 <= 1;
  end
endmodule
module module_2 #(
    parameter id_1 = 32'd90
) (
    output wand id_0,
    input uwire _id_1,
    input wand id_2,
    input uwire id_3,
    output wire id_4,
    output supply0 id_5,
    input wire id_6,
    input tri0 id_7
);
  logic [7:0] id_9;
  assign id_5 = id_9[id_1 : id_1];
  module_0 modCall_1 (
      id_3,
      id_0,
      id_6,
      id_2,
      id_4
  );
endmodule
