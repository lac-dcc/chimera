// Seed: 1120498491
module module_0 #(
    parameter id_36 = 32'd97,
    parameter id_37 = 32'd8
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
    module_0,
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
    id_31
);
  input wire id_32;
  output wire id_31;
  inout wire id_30;
  output wire id_29;
  input wire id_28;
  output wire id_27;
  input wire id_26;
  output wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_33;
  assign id_5 = id_21;
  wire id_34;
  wire id_35;
  defparam id_36.id_37 = ("");
  tri0 id_38 = 'd0;
  always_comb @(posedge 1) begin : LABEL_0
    id_31 = id_20;
  end
  supply1 id_39 = 1'b0;
  assign id_22 = id_18 - id_7;
  wire id_40;
  assign id_15 = 1;
  id_41 :
  assert property (@(id_1 or negedge id_26) 1'b0)
  else;
  wire id_42;
  assign id_12 = 1;
  wire id_43 = id_35;
endmodule
module module_1 #(
    parameter id_12 = 32'd69,
    parameter id_13 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_9(
      .id_0(1), .id_1(1), .id_2(1'b0), .id_3(1), .id_4(id_8)
  );
  wire id_10;
  id_11(
      .id_0(id_3), .id_1(id_10)
  );
  if (id_2[1]) defparam id_12.id_13 = "";
  wire id_14;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_7,
      id_4,
      id_10,
      id_5,
      id_10,
      id_7,
      id_7,
      id_8,
      id_8,
      id_10,
      id_4,
      id_3,
      id_4,
      id_7,
      id_14,
      id_10,
      id_7,
      id_3,
      id_8,
      id_6,
      id_1,
      id_4,
      id_4,
      id_4,
      id_8,
      id_10
  );
  id_16 :
  assert property (@({1{1}}) 1)
  else;
endmodule
