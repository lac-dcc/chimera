// Seed: 2712094714
module module_0;
  for (id_1 = -1; id_1; id_1 = id_1) begin : LABEL_0
    wire id_2;
  end
  assign module_1.id_1 = 0;
  wire id_3;
endmodule
module module_1 #(
    parameter id_1 = 32'd76,
    parameter id_3 = 32'd66
) (
    _id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  input wire id_2;
  inout wire _id_1;
  module_0 modCall_1 ();
  wire [id_1  -  -1 : -1] id_4;
  wire [id_3 : id_3] id_5;
endmodule
module module_2 #(
    parameter id_1 = 32'd38
) (
    _id_1,
    id_2,
    id_3
);
  inout wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  output logic [7:0] id_2;
  input wire _id_1;
  generate
    always begin : LABEL_0
      id_2[!(-1'b0) : id_1] = id_1;
    end
  endgenerate
  wire id_4;
endmodule
