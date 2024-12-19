// Seed: 2417725018
macromodule module_0 (
    output tri id_0
);
  integer id_2 (
      .id_0(1),
      .id_1(1)
  );
  reg  id_3;
  wire id_4;
  initial begin : LABEL_0
    if (1) @(1'b0) id_3 <= id_3;
  end
  always id_3 = #1{1{id_3}} + 1'h0;
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output wand id_2,
    output wor id_3,
    input wire id_4,
    input wand id_5,
    input tri id_6,
    input uwire id_7,
    input supply1 id_8,
    input supply0 id_9
);
  assign id_3 = id_4;
  module_0 modCall_1 (id_2);
  assign modCall_1.id_3 = 0;
endmodule
