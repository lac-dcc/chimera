// Seed: 218851393
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
endmodule
macromodule module_1 #(
    parameter id_6 = 32'd14,
    parameter id_7 = 32'd71
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  for (id_5 = id_4[1]; $display(id_4); id_2 = 1'b0) begin : LABEL_0
    defparam id_6.id_7 = id_1;
  end
  module_0 modCall_1 (
      id_5,
      id_2
  );
endmodule
