// Seed: 2225396538
module module_0;
  initial begin : LABEL_0
    id_1 = 1;
  end
  wire id_2;
  assign module_2.id_7 = 0;
  generate
    if (1) begin : LABEL_0
      wor id_4 = 1;
    end
  endgenerate
  assign module_1.id_1 = 0;
endmodule
module module_1;
  assign id_1 = 1'b0;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_6 = 32'd38,
    parameter id_7 = 32'd80
) (
    output wire id_0,
    output tri1 id_1,
    input  wire id_2,
    output tri1 id_3
);
  id_5(
      id_0 < 1'b0, id_3, 1, 1,
  ); defparam id_6.id_7 = 1;
  module_0 modCall_1 ();
endmodule
