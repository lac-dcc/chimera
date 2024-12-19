// Seed: 1262069237
module module_0 #(
    parameter id_3 = 32'd4,
    parameter id_4 = 32'd51
) (
    output logic id_0,
    input  tri0  id_1
);
  always_ff for (id_0 = 1; 1; id_0 = 1 - 'b0) id_0 <= 1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign module_1.id_0  = 0;
  if (1) begin : LABEL_0
    defparam id_3.id_4 = id_4;
  end else wire id_5;
endmodule
module module_1 (
    inout logic id_0,
    input uwire id_1
);
  module_0 modCall_1 (
      id_0,
      id_1
  );
  always @(posedge id_1 or posedge 1) id_0 <= 1;
endmodule
module module_2;
  assign id_1 = 1;
  wire id_2;
  assign id_2 = id_2;
endmodule
