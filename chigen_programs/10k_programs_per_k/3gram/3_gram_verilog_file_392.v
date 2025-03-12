// Seed: 1429316583
macromodule module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input uwire id_2,
    output wand id_3,
    input wire id_4
);
  localparam id_6 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    input tri0 id_2,
    output uwire id_3,
    output tri id_4,
    input supply1 id_5
);
  assign id_4 = id_0 * id_0 - -1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
  generate
    for (id_7 = id_5; -1; id_1 = id_5) begin : LABEL_0
      wire id_8 = id_7;
    end
  endgenerate
endmodule
