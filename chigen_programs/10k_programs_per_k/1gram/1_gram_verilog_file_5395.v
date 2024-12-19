// Seed: 3996399006
module module_0 (
    id_1
);
  input wire id_1;
  if (1'd0) begin : LABEL_0
    assign id_2 = 1;
  end else wor id_3 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    input supply1 id_2,
    input tri0 id_3
);
  always $display;
  wire id_5;
  module_0 modCall_1 (id_5);
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_4 = 32'd43,
    parameter id_5 = 32'd98
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_4 = 1, id_5 = ~~1;
  wire id_6, id_7;
  nand primCall (id_2, id_7, id_6, id_5, id_4);
  integer id_8;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
endmodule
