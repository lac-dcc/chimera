// Seed: 741644499
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
    module_0,
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
    id_24
);
  output wire id_25;
  output wire id_24;
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge id_9) begin : LABEL_0
    id_6 = 1'b0;
  end
  wire id_26, id_27;
  assign id_11 = id_1;
  wire id_28;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  tri id_5;
  always @(posedge 1) begin : LABEL_0
    id_3 = #(1) 1;
    if (id_5) begin : LABEL_0
      id_3 <= 1'd0;
    end else #1;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_4,
      id_5,
      id_4,
      id_5,
      id_5,
      id_2,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_1,
      id_5,
      id_5,
      id_4,
      id_5,
      id_4,
      id_5
  );
endmodule
