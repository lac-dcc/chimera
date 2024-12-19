// Seed: 2841373131
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
  inout wire id_27;
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    output supply0 id_0,
    output tri id_1
);
  reg id_3, id_4;
  xnor primCall (id_1, id_6, id_4, id_3, id_7, id_8);
  wire id_5;
  initial begin : LABEL_0
    id_1 = 1;
  end
  reg id_6;
  reg id_7;
  assign id_6 = id_4;
  always @(posedge 1'b0)
    if (1) begin : LABEL_0
      id_0 = 1 == $display;
      if (1) cover (1);
      else id_7 <= 1;
    end
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_5,
      id_8,
      id_5,
      id_5,
      id_8,
      id_5,
      id_8,
      id_8,
      id_5,
      id_8,
      id_5,
      id_8,
      id_5,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_5,
      id_8,
      id_5,
      id_5,
      id_8,
      id_8,
      id_5,
      id_5
  );
  wire id_9;
  wire id_10;
endmodule
