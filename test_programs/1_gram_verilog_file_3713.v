// Seed: 3647867478
module module_0 (
    id_1
);
  output wire id_1;
  initial $display(id_2[~1]);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2[1 :-1] = 1;
  always if (id_3) id_1 = id_3;
  supply0 id_4, id_5, id_6;
  assign {id_4} = ('b0);
  module_0 modCall_1 (id_3);
endmodule
module module_2 (
    input tri id_0,
    input wire id_1,
    input tri id_2,
    input supply0 id_3,
    input tri1 id_4,
    output wire id_5,
    input tri1 id_6,
    output tri id_7,
    output tri1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input wand id_11,
    output uwire id_12,
    output supply1 id_13
);
  assign id_7 = id_3;
  supply1 id_15, id_16, id_17;
  wire id_18;
endmodule
module module_3 (
    input  wand id_0,
    input  wire id_1,
    output wand id_2
);
  tri id_4;
  assign id_2 = id_4;
  module_2 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_2,
      id_2,
      id_1,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
  wand id_5;
  assign id_2 = id_0 | id_4;
  bufif1 primCall (id_2, id_1, id_0);
  if (id_4 == -1) wand id_6;
  else begin : LABEL_0
    assign id_2 = id_6;
    wire id_7;
  end
  wire id_8;
  assign id_5 = id_5 ? 1 : id_4;
endmodule
