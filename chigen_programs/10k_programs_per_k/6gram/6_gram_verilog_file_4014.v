// Seed: 1461036716
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  assign module_1.id_21 = 0;
  always @(id_6 == 1'b0) begin : LABEL_0
    id_15 <= 1'b0;
    for (id_12 = 1; 1; id_12 = 1) @(posedge 1) force id_8 = id_6 + id_7;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    .id_26(id_7),
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
    id_25
);
  inout wire id_25;
  inout wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  id_27(
      .id_0(1), .id_1(id_9)
  );
  assign id_13 = id_7;
  module_0 modCall_1 (
      id_1,
      id_26,
      id_10,
      id_12,
      id_13
  );
  wire id_28;
  initial begin : LABEL_0
    id_6 <= 1;
    id_19 = id_15 == id_24;
  end
  assign id_10 = 1 == 1;
  assign id_18 = 1;
  assign id_19 = 1 - 1;
  wire id_29;
  assign id_25 = id_14;
  wire id_30;
  id_31(
      .id_0(1), .id_1(1), .id_2(1'b0)
  );
  function automatic id_32(input id_33);
    id_34.id_35.id_36.id_37();
    id_21 = id_24 + (id_36);
  endfunction
  wire id_38;
  wire id_39, id_40;
endmodule
