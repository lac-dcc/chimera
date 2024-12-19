// Seed: 1446801806
module module_0 #(
    parameter id_7 = 32'd92,
    parameter id_8 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  defparam id_7.id_8 = id_6 - id_1;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    wait (id_3);
  end
  uwire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4
  );
  supply0 id_5;
  always_latch @(negedge 1'd0) begin : LABEL_0
    id_4 = 1'b0;
  end
  wire id_6;
  buf primCall (id_2, id_4);
  assign id_5 = id_5;
  assign id_5 = 1;
  wire id_7 = 1;
endmodule
