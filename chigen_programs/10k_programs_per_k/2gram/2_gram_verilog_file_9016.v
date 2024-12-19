// Seed: 140750496
module module_0;
  assign id_1 = 1;
  assign module_2.id_2 = 0;
  id_2(
      .id_0(1), .id_1(1), .id_2(~1), .id_3(id_1 != id_1), .id_4(1), .id_5(1'b0)
  );
  always begin : LABEL_0
    id_1 <= #1 1;
  end
endmodule
module module_1 ();
  wire id_2 = id_2;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  reg id_5;
  generate
    wire id_7;
  endgenerate
  always begin : LABEL_0
    if (1)
      assume (1'h0);
      else @(negedge 1 == 1) id_5 <= id_6;
  end
  wire id_8;
endmodule
