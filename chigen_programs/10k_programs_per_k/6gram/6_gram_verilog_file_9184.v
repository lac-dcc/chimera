// Seed: 1881878556
module module_0 (
    output supply1 id_0,
    output wand id_1,
    output tri id_2
);
  wand id_4 = 1'b0;
  wire id_5;
  module_2 modCall_1 (
      id_0,
      id_2
  );
  assign modCall_1.type_0 = 0;
  wire id_6;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input tri id_2,
    output uwire id_3,
    input uwire id_4,
    input wand id_5,
    output supply1 id_6
);
  always @(negedge 1 - 1) begin : LABEL_0
    deassign id_6;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6
  );
  assign modCall_1.type_1 = 0;
endmodule
module module_2 (
    output tri1 id_0,
    output supply0 id_1
);
endmodule
