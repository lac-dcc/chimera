// Seed: 3898306251
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5, id_6;
  assign module_1.type_0 = 0;
  id_7(
      id_2, 1, id_3 - 1 * 1, 1
  );
endmodule
module module_1 (
    output wand id_0,
    input  tri1 id_1,
    output wand id_2
);
  generate
    begin : LABEL_0
      wire id_4, id_5;
      wire id_6;
    end
    assign id_2 = 1;
  endgenerate
  xnor primCall (id_2, id_4, id_1, id_5, id_6, id_7);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_4
  );
endmodule
