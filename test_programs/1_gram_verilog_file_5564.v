// Seed: 3613769044
macromodule module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  supply1 id_4, id_5;
  always $display(id_1, -1, -1, id_5, id_1, 1'h0);
  assign id_4 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  wire id_2;
  final @(negedge -1) id_3 = id_1;
  supply1 id_4;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  assign id_3 = 1'b0;
  assign id_3 = this;
  always $display(id_4 & id_3.id_4);
endmodule
