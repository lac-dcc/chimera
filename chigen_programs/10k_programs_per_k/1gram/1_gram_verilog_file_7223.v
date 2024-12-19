// Seed: 468169385
macromodule module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = 1'd0;
  assign id_1 = id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3, id_4;
  assign id_2 = 1;
  wire id_5;
  assign id_4 = id_1;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (id_4);
  wire id_8;
  wire id_9;
endmodule
module module_2 (
    input tri id_0
);
  assign id_2 = id_0;
  always if (1) id_2 += id_2;
  assign id_2 = (1);
  always_comb $display(1, id_0, id_2, ~~id_0, 1 & id_2);
  wire id_3;
  wire id_4;
endmodule
module module_3 (
    input tri1  id_0,
    input uwire id_1
);
  wor id_3 = id_0;
  module_2 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
endmodule
