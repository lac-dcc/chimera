// Seed: 2341967235
module module_0;
  always @(1) begin : LABEL_0
    wait (id_1 < 1);
    {1} += id_1;
    if (1'b0) id_1 <= #1  (1 - 1);
    else id_1 <= id_1;
  end
  wire id_2;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 ();
  assign id_2 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  uwire id_6 = 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
