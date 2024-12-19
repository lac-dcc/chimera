// Seed: 1586337801
module module_0;
  wire id_1 = id_1;
  assign module_1.id_4 = 0;
  wor id_3;
  id_4(
      .id_0(id_3), .id_1(id_3 - 1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_10 = $display((1)) ? 1'h0 : 1'd0;
  wire id_15;
  module_0 modCall_1 ();
  always @(posedge 1) begin : LABEL_0
    foreach (id_16[1]) begin : LABEL_0
      id_1[1] = 1;
      $display;
    end
  end
  assign id_5 = id_9 ? 1 - id_8 : 1;
endmodule
