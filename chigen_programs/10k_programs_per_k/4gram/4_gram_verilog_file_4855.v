// Seed: 3784798949
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output uwire id_3,
    input wand id_4
);
  assign id_3 = id_0;
  assign module_1.id_2 = 0;
  logic id_6;
  ;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri0 id_1,
    input  wor  id_2,
    output wor  id_3
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_3,
      id_2
  );
endmodule
module module_2 (
    output tri id_0,
    input tri0 id_1,
    input supply1 id_2,
    output wor id_3,
    input wor id_4,
    output supply1 id_5
);
  if (-1) begin : LABEL_0
    assign id_3 = id_2 - id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.type_4 = 0;
endmodule
