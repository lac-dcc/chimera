// Seed: 1319653750
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
    id_17
);
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5 = 1;
  supply0 id_18;
  assign id_8 = id_14;
  wire id_19;
  assign id_18 = 1;
  supply1 id_20;
  assign id_20 = 1;
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
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_12;
  wire id_13;
  assign id_12[1'b0] = 1;
  always @(id_3) begin : LABEL_0
    id_7 = 1'b0;
  end
  assign id_8[1] = id_12;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_10,
      id_5,
      id_2,
      id_13,
      id_9,
      id_13,
      id_4,
      id_5,
      id_10,
      id_1,
      id_1,
      id_5,
      id_5,
      id_13,
      id_10
  );
  assign id_8[1] = 1;
  wire id_14, id_15, id_16;
  wire id_17;
  id_18(
      ,,
  );
  real id_19;
  or primCall (id_7, id_10, id_9, id_12, id_3, id_13, id_1, id_5, id_8, id_4);
  always @(id_10) begin : LABEL_0
    if (1) begin : LABEL_0
      #1 id_2 = id_5;
    end else begin : LABEL_0
      id_6 <= 1;
    end
  end
endmodule
