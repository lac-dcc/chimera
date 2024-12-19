// Seed: 404907067
module module_0 (
    input wire id_0
);
  assign module_2.id_0 = 0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    output supply1 id_2,
    input tri1 id_3,
    output wor id_4,
    input tri id_5,
    output supply1 id_6,
    output supply0 id_7,
    input wand id_8
);
  assign id_7 = id_1 & id_3 & 1;
  module_0 modCall_1 (id_3);
endmodule
module module_2 (
    input supply1 id_0
);
  tri id_2;
  assign id_2 = 1;
  reg id_3;
  module_0 modCall_1 (id_0);
  always begin : LABEL_0
    if ({id_0, id_0})
      if (1'b0) id_3 <= id_3 - 1;
      else
        @(1) begin : LABEL_0
          #1;
        end
    $display(id_0 && $display && 1);
  end
  wire id_6;
endmodule
