// Seed: 3649956823
module module_0 #(
    parameter id_1 = 32'd26,
    parameter id_2 = 32'd24
);
  wire _id_1;
  assign id_1 = id_1;
  wire [1 : id_1] _id_2;
  logic [7:0][id_2 : id_1] id_3;
  assign id_1 = id_3;
  assign id_3[1][-1] = -1;
endmodule : SymbolIdentifier
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  tri0  id_0,
    input  tri0  id_1,
    output logic id_2
);
  always id_2 <= id_0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
