// Seed: 2210667038
macromodule module_0 (
    output wand id_0
);
  supply1 id_2, id_3;
  assign module_1.type_1 = 0;
  logic [7:0] id_4;
  tri id_5, id_6;
  initial begin : LABEL_0
    id_5 = 1'b0;
    id_2 = id_4[1] - !id_6;
  end
  wire id_7;
  integer id_8;
  id_9(
      .id_0(1'h0)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output wand id_2,
    input supply1 id_3
);
  wire id_5, id_6;
  wire id_7;
  module_0 modCall_1 (id_2);
endmodule
