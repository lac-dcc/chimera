// Seed: 1220240596
module module_0;
  wire id_1;
  always @(id_1) begin : LABEL_0
    force id_1 = -1;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd24
) (
    id_1,
    id_2,
    _id_3
);
  inout wire _id_3;
  input wire id_2;
  output logic [7:0] id_1;
  assign id_1[id_3] = id_3;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_4, id_5;
  module_0 modCall_1 ();
  assign id_4 = -1;
endmodule
