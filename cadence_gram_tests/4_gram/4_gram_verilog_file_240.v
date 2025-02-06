// Seed: 2609848427
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
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
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33
);
  input wire id_33;
  output wire id_32;
  output wire id_31;
  input wire id_30;
  output wire id_29;
  inout wire id_28;
  input wire id_27;
  inout wire id_26;
  inout wire id_25;
  input wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_34(
      .id_0(id_10),
      .id_1($realtime),
      .id_2(($realtime)),
      .id_3(id_23),
      .id_4($realtime | !id_27),
      .id_5(),
      .id_6($realtime),
      .id_7(1'b0),
      .id_8(),
      .id_9(id_13(id_11, id_9, $realtime))
  );
  assign id_19[((-1))] = $realtime;
  always @(posedge $realtime or -1'h0 & id_23 & $realtime & $realtime) begin : LABEL_0
    id_18 <= id_6;
    if ($realtime)
      if (id_8) id_26 <= id_8;
      else begin : LABEL_0
        id_31 <= id_33;
      end
  end
  module_0 modCall_1 (
      id_4,
      id_2
  );
endmodule
