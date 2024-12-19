// Seed: 1573327042
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_2;
  assign module_1.id_15 = 0;
  wire id_3, id_4;
endmodule
module module_1 #(
    parameter id_41 = 32'd48,
    parameter id_42 = 32'd72
) (
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
    .id_40(id_36),
    id_37,
    id_38,
    id_39
);
  output wire id_39;
  input wire id_38;
  input wire id_37;
  inout wire id_36;
  output wire id_35;
  output wire id_34;
  output wire id_33;
  input wire id_32;
  input wire id_31;
  inout wire id_30;
  input wire id_29;
  inout wire id_28;
  output wire id_27;
  inout wire id_26;
  inout wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  defparam id_41.id_42 = id_9[1];
  final #((id_10)) $display;
  assign id_21 = id_40;
  assign id_40 = 1;
  wire id_43;
  wire id_44;
  always_ff begin : LABEL_0
    if (id_32) begin : LABEL_0
      @(posedge (id_11) / 1 or 1) id_15 = 1;
    end else id_28 = id_26 > id_40;
  end
  module_0 modCall_1 (
      id_40,
      id_28
  );
endmodule
