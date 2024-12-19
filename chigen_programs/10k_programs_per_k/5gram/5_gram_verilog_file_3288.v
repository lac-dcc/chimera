// Seed: 3887419610
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
  input wire id_28;
  input wire id_27;
  output wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_29;
  assign id_20 = id_11;
  assign module_1.id_8 = 0;
  assign id_20 = $display;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  task id_4();
    input id_5;
    input id_6;
    output id_7;
    input id_8;
    begin : LABEL_0
      assign id_6 = 1;
      id_3 <= 1;
      id_6 <= 1;
      if (id_2 - 1) begin : LABEL_0
        if (1'b0) id_6 <= #1 id_8;
      end
    end
  endtask
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
  always @(posedge 1 or 1) begin : LABEL_0
    id_6 <= #1 1'b0;
    id_8 = 1'h0;
  end
  wire id_9;
endmodule
