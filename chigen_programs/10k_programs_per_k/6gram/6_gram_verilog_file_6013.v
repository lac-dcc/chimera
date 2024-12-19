// Seed: 2184678083
module module_0 (
    input  wire  id_0,
    output tri0  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  tri0  id_5,
    input  tri0  id_6,
    input  tri   id_7,
    input  tri0  id_8
);
  always @(1) begin : LABEL_0
    if (id_3) begin : LABEL_0
      #1;
    end else begin : LABEL_0
      assume #1  (1) $display(1);
      else;
      #(1) id_1 = id_7;
    end
  end
endmodule
module module_1 (
    input  wand  id_0,
    output wire  id_1,
    output uwire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
