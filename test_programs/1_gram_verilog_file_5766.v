// Seed: 1413359299
module module_0 (
    .id_9(id_1),
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always begin : LABEL_0
    @(id_5) @(*);
    $display(id_2);
    id_8 = -1;
    assert (1'h0) begin : LABEL_0
      id_8 <= -1'b0;
    end
    id_4 = -1'b0 - id_2 - id_2;
  end
  wire id_10, id_11;
  always id_4 = (-1);
  wire id_12;
  wire id_13;
  assign id_8 = id_3;
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18#(
        .id_19(1),
        .id_20(-1),
        .id_21(1'b0),
        .id_22(-1'd0 * id_15),
        .id_23(~-1),
        .id_24(id_7)
    )
);
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_16 = ~id_1;
  wire id_25;
  id_26 :
  assert property (@(id_17 or id_1) id_11)
    if (id_10) id_20 <= -1'b0;
    else id_8 <= id_11;
  module_0 modCall_1 (
      id_23,
      id_18,
      id_8,
      id_9,
      id_10,
      id_3,
      id_25,
      id_8
  );
  always
    if (1'b0) $display(1, -1'h0);
    else id_17 = id_22;
  id_27(
      id_17
  );
  assign id_23 = 1;
  wire id_28;
endmodule
