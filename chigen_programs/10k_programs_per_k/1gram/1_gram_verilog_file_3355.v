// Seed: 124122954
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
    .id_24(id_14),
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  output wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = id_9;
  assign module_1.id_6 = 0;
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
    id_11
);
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  assign id_5 = id_10.sum;
  always begin : LABEL_0
    id_11 = id_2;
    @(negedge "" or posedge 1'b0 or 1'b0) $display;
    if ({id_6{1'b0}}) id_9 = "";
    else if (id_2) for (id_5 = id_10; id_6; id_11 = id_7) $display;
  end
  genvar id_12;
  wire id_13, id_14, id_15;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_12,
      id_14,
      id_4,
      id_2,
      id_7,
      id_15,
      id_10,
      id_13,
      id_14,
      id_7,
      id_7,
      id_13,
      id_8,
      id_12,
      id_14,
      id_3,
      id_4,
      id_7,
      id_11,
      id_8,
      id_11
  );
  wire id_16, id_17;
endmodule
