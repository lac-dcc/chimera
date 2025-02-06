// Seed: 1973051316
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  inout wire id_26;
  output wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_27;
  assign id_16 = id_7;
  id_28(
      .id_0($realtime),
      .id_1($realtime),
      .id_2($realtime),
      .id_3(1),
      .id_4(id_8[1]),
      .id_5(),
      .id_6((1'b0) - 1),
      .id_7($realtime),
      .id_8(!id_27),
      .id_9((id_5[$realtime])),
      .id_10(id_19),
      .id_11(1),
      .id_12(id_1),
      .id_13(id_2[-1] && 1'b0)
  );
  assign id_27 = 1 != id_26;
  id_29(
      .id_0($realtime), .id_1(1'b0), .id_2(), .id_3()
  );
  reg id_30 = $realtime;
  assign id_16 = id_1;
  wire id_31;
  assign id_13 = 1'b0 ? -1 : $realtime;
  wire id_32;
  bit  id_33;
  id_34(
      .id_0((id_13)), .id_1($realtime), .id_2($realtime)
  );
  wor id_35;
  always @(posedge $realtime or 1) begin : LABEL_0
    if (-1) begin : LABEL_0
      id_33 <= !id_35;
      if (-1'b0) id_30 <= $realtime;
    end
  end
  wire id_36;
  module_0 modCall_1 (
      id_35,
      id_36,
      id_17
  );
  wire id_37;
endmodule
