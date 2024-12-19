// Seed: 150163440
module module_0 (
    input  uwire id_0,
    input  tri0  id_1
    , id_4,
    output wor   id_2
);
  always @(posedge id_1 or posedge 1'h0) begin : LABEL_0
    if (id_4) #1 force id_2 = 1;
  end
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    input  wand id_0,
    inout  tri1 id_1,
    input  wor  id_2,
    input  wire id_3,
    output tri1 id_4
);
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  wand  id_0,
    input  uwire id_1,
    output wand  id_2,
    output wor   id_3
);
  bufif1 primCall (id_3, id_0, id_1);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3
  );
endmodule
