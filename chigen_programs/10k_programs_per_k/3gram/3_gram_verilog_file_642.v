// Seed: 964324332
module module_0 ();
  tri0 id_2 = 1'b0;
  assign module_3.id_2 = 0;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_5 = 32'd25,
    parameter id_6 = 32'd33
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  for (id_4 = id_3; "" && 1; id_1 = id_1) begin : LABEL_0
    defparam id_5.id_6 = 1;
    assign id_4 = 1 - id_2[1];
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
program module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 ();
endprogram
