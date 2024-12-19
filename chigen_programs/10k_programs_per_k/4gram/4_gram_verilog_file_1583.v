// Seed: 2991961545
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
    id_23
);
  input wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_24;
  wire id_25;
  always @(negedge 1 - 1) begin : LABEL_0
    id_10 <= 1;
  end
  wire id_26;
  always @(posedge 1) id_8 = #1 1;
  wire id_27;
  assign id_16 = 1;
  wire id_28;
  wire id_29;
  always id_17 = #1 1'h0;
  wire id_30;
  wire id_31;
  wire id_32, module_0, id_33;
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
    id_18
);
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_19;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_6,
      id_5,
      id_3,
      id_3,
      id_7,
      id_12,
      id_9,
      id_19,
      id_9,
      id_14,
      id_9,
      id_6,
      id_4,
      id_9,
      id_19,
      id_7,
      id_11,
      id_8,
      id_15,
      id_3,
      id_11
  );
  assign modCall_1.id_8 = 0;
  assign id_2 = id_9;
  initial begin : LABEL_0
    id_16 <= (id_10[1 : 1] || 1) * 1 - "";
    if (id_14)
      if (id_16)
        if (id_2++) id_18 = "" | id_19;
        else begin : LABEL_0
          id_17 <= 1;
        end
      else begin : LABEL_0
        if (id_15) begin : LABEL_0
          id_12 = new(id_14);
        end
        id_19 <= id_1;
      end
    else id_12 <= $display(id_14);
  end
  wire id_20 = id_5;
endmodule
