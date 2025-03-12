// Seed: 2586805782
module module_0 (
    input  tri1 id_0,
    output wand id_1,
    input  wand id_2
);
  logic id_4;
  ;
  assign module_1.id_4 = 0;
  bit id_5;
  ;
  wire id_6, id_7;
  always begin : LABEL_0
    if (1) id_4[-1] = -1 || id_2;
  end
  for (id_8 = -1; -1; id_5 = 1) begin : LABEL_1
    for (id_9 = id_6; id_8; id_8 = !1'h0) begin : LABEL_2
      assign id_5 = id_0;
    end
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd10
) (
    output supply0 id_0,
    output supply0 id_1,
    output wor id_2,
    output tri1 id_3,
    input supply1 id_4,
    input wire id_5,
    input wand _id_6,
    output wand id_7
);
  logic [7:0] id_9;
  not primCall (id_7, id_9);
  assign id_9 = (id_5);
  assign id_7 = 1;
  assign id_9[id_6 :-1] = id_4 ? -1 + -1 : id_6;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5
  );
endmodule
