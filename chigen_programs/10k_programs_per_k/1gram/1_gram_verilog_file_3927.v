// Seed: 1644914233
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    output supply1 id_2
);
  reg id_4 = 1;
  assign module_1.id_4 = 0;
  always
    if (1)
      foreach (id_5) begin : LABEL_0
        id_4 <= 1;
      end
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    input wire id_2,
    input supply0 id_3,
    output tri0 id_4,
    input supply1 id_5,
    input tri id_6,
    input tri1 id_7,
    output wor id_8
);
  assign id_4 = id_7;
  wand id_10;
  xnor primCall (id_0, id_11, id_10, id_3, id_7, id_5, id_2);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_0
  );
  generate
    assign id_4 = id_10;
  endgenerate
endmodule
