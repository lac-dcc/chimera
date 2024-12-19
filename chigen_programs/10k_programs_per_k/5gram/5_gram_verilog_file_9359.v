// Seed: 2883625598
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always_latch @(id_3 or posedge id_3 + id_2)
    if (1'b0) $display(id_2 + id_3, ~1'd0 == id_3, id_2 - 1'b0 <= 1'h0, id_3, id_2);
    else begin : LABEL_0
      id_4 = #id_5 1;
    end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_3
  );
  assign id_4 = 1;
  always_latch disable id_6;
  initial begin : LABEL_0
    if (1) assign id_1 = id_6;
    else begin : LABEL_0
      id_1 <= 1;
      id_2 = id_2;
      assert (id_3);
    end
  end
  wire id_7;
  assign id_1 = 1'b0;
  reg id_8 = 1 ? id_6 : 1;
endmodule
