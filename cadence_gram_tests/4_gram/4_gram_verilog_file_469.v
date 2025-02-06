// Seed: 3268758368
module module_0 (
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
    id_15
);
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic [7:0] id_16;
  wire \id_17 ;
  assign id_2 = 1'd0;
  assign id_16[-1] = id_13;
  id_18(
      .id_0(id_3), .id_1(id_15[-1])
  );
  wire id_19;
  id_20(
      .id_0(\id_17 ), .id_1(), .id_2(id_14), .id_3($realtime), .id_4($realtime)
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
    id_33,
    id_34,
    id_35,
    id_36,
    id_37,
    id_38,
    id_39
);
  input wire id_39;
  input wire id_38;
  inout wire id_37;
  output wire id_36;
  output wire id_35;
  inout wire id_34;
  inout wire id_33;
  output wire id_32;
  output wire id_31;
  inout wire id_30;
  inout wire id_29;
  inout wire id_28;
  inout wire id_27;
  input wire id_26;
  inout wire id_25;
  output wire id_24;
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge 1 or negedge -1'b0)
    if (1) id_24 = $realtime & id_19;
    else begin : LABEL_0
      id_40(1, (id_23 == $realtime), id_1);
    end
  module_0 modCall_1 (
      id_6,
      id_17,
      id_36,
      id_16,
      id_30,
      id_8,
      id_18,
      id_33,
      id_24,
      id_25,
      id_19,
      id_39,
      id_39,
      id_29,
      id_29
  );
  id_41(
      .id_0(!id_13),
      .id_1(id_24),
      .id_2(1'b0),
      .id_3(id_29[1]),
      .id_4(1'h0),
      .id_5($realtime),
      .id_6($realtime),
      .id_7(id_32),
      .id_8(id_29)
  );
endmodule
