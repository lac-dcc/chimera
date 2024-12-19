// Seed: 894666455
module module_0 (
    input  tri0  id_0,
    output tri1  id_1,
    input  uwire id_2
);
  tri1 id_4;
  wire id_5;
  tri  id_6;
  assign id_1 = 1 - id_6;
  for (id_7 = id_5; 1'b0; id_4 = id_2) begin : LABEL_0
    always_comb id_4 = id_5;
  end
  wire id_8;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input tri1 id_2,
    input wand id_3,
    output tri0 id_4,
    input wor id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_5
  );
  assign modCall_1.type_1 = 0;
endmodule
