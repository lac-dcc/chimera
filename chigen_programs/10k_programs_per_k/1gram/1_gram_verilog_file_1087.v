// Seed: 511169234
module module_0 ();
  assign id_1 = id_1;
  wire id_2;
  uwire id_3, id_4 = 1'b0, id_5;
  assign module_2.type_3 = 0;
  assign id_3 = ~1;
endmodule
module module_1;
  wire id_2, id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
module module_2;
  reg id_1;
  module_0 modCall_1 ();
  always id_1 <= #1 1'd0;
  assign id_2 = 1 - id_1 !== 1;
endmodule
module module_3 (
    input  uwire id_0,
    output tri0  id_1,
    output wire  id_2,
    input  uwire id_3
);
  reg id_5 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_5 = 0;
  always #1 id_5 <= 1;
  assign id_2 = 1;
endmodule
