// Seed: 718781363
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 (
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
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  nand primCall (id_1, id_2, id_6, id_4, id_8, id_7);
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_2
  );
endmodule
module module_2 (
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
    id_28
);
  output wire id_28;
  output wire id_27;
  output wire id_26;
  input wire id_25;
  output wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_23 = id_25;
  or primCall (
      id_16,
      id_8,
      id_4,
      id_5,
      id_6,
      id_7,
      id_33,
      id_23,
      id_9,
      id_18,
      id_21,
      id_13,
      id_12,
      id_30,
      id_20,
      id_31,
      id_32,
      id_29,
      id_25
  );
  wire id_29;
  assign id_19 = 1'b0 && id_5;
  wire id_30, id_31, id_32;
  assign id_21 = {id_31, id_29, id_23};
  wire id_33;
  module_0 modCall_1 (
      id_4,
      id_23,
      id_20,
      id_8
  );
  wire id_34;
  wire id_35;
  initial begin : LABEL_0
    @* @(negedge 1) id_2 <= 1 << id_4 - id_9;
  end
  wire id_36;
  always begin : LABEL_0
    id_22 <= 1;
  end
  always begin : LABEL_0
    id_27 = #id_37 1;
    if (id_20) assign id_35 = 1;
  end
endmodule
