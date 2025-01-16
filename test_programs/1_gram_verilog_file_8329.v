// Seed: 4285052209
module module_0 ();
  localparam id_2 = 1;
  always
    assert (id_1) begin : LABEL_0
      if (!1'h0) id_1 <= -1;
      else begin : LABEL_0
        @(*) id_1 += id_2;
        id_1 <= id_1;
        @(1) $display;
        id_1 <= -1;
      end
      id_1 <= 1;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  module_0 modCall_1 ();
endmodule
