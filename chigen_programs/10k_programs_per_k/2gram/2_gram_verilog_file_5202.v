// Seed: 3607765671
module module_0 (
    input wor id_0
);
  supply0 id_2;
  supply1 id_3;
  assign id_3 = 1;
  for (id_4 = 1; 1; id_4 = !id_0) begin : LABEL_0
    assign id_2 = id_0;
    wand id_5;
    assign id_3 = 1;
    assign id_5 = id_0;
    assign id_4 = 1;
    assign id_3 = id_3;
    assign id_3 = 1;
  end
endmodule
module module_1 (
    input wor   id_0,
    input wor   id_1,
    input uwire id_2,
    input logic id_3
);
  generate
    reg id_5;
  endgenerate
  always id_5 <= #1 id_3;
  module_0 modCall_1 (id_0);
  assign modCall_1.type_7 = 0;
endmodule
