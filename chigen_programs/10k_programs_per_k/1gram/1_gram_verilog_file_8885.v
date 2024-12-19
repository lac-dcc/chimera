// Seed: 1703896598
module module_0 (
    input wire id_0,
    input wire id_1,
    input wor  id_2
);
  integer id_4 = !1;
  module_2 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_4
  );
  assign module_1.id_2 = 0;
  assign id_4 = id_1;
endmodule
module module_1 (
    output tri   id_0,
    output tri1  id_1,
    input  tri0  id_2,
    output logic id_3
);
  always id_3 <= 1'h0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  wire id_5;
  tri id_6, id_7 = 1, id_8;
  wire id_9;
endmodule
macromodule module_2 (
    output wor  id_0,
    input  wor  id_1,
    output wand id_2,
    output tri1 id_3
);
  wire id_5;
  assign id_2 = 1 || id_1 + 1;
  uwire id_6, id_7;
  assign id_7 = id_1;
  always
    if (id_7) begin : LABEL_0
      @(1);
    end else id_3 = 1;
  wire id_8;
  assign id_5 = $display(1 == 1, id_8 ^ 1) * id_6;
  assign id_6 = 1;
  assign module_0.id_2 = 0;
  assign id_6 = id_6;
endmodule
