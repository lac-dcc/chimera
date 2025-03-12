// Seed: 1167451011
module module_0 (
    input uwire id_0,
    input wand id_1,
    output wand id_2,
    output wand id_3,
    input supply1 id_4,
    output uwire id_5,
    output uwire id_6
);
endmodule
module module_1 (
    output wire  id_0,
    input  tri   id_1,
    output wand  id_2,
    output uwire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_3,
      id_1,
      id_3,
      id_0
  );
endmodule
module module_2 (
    input  tri1  id_0,
    output tri0  id_1,
    output logic id_2,
    output logic id_3
);
  always @(id_0 ^ id_0 - id_0) begin : LABEL_0
    id_2 <= id_0;
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_0 = 0;
  assign id_2 = id_0 & id_0;
  assign id_2 = -1'b0 == -1;
  assign id_1 = -1;
endmodule
