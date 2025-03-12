// Seed: 2133502895
module module_0;
  wor [1 : -1] id_1;
  assign id_1 = 1;
  module_2 modCall_1 ();
endmodule
module module_1 #(
    parameter id_4 = 32'd5
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  inout wire _id_4;
  output wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_2[id_4] = id_1;
endmodule
module module_2 ();
  logic id_1;
  assign module_0.id_1 = 0;
  always @(id_1 or posedge id_1 * 1) id_1[""] = id_1;
endmodule
