// Seed: 1954048197
module module_0 #(
    parameter id_4 = 32'd15,
    parameter id_5 = 32'd93
);
  wire id_2;
  wire id_3;
  defparam id_4.id_5 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_4 = id_2;
  pullup (id_3[1], id_3);
  always_latch @(posedge 1) begin : LABEL_0
    if (id_1[1]) begin : LABEL_0
      id_4 = #id_5 1;
    end
  end
  module_0 modCall_1 ();
  reg id_7 = id_4;
endmodule
