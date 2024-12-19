// Seed: 1930317420
module module_0 (
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
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = 1'd0;
  always id_6 <= id_4;
  wire id_9;
  reg  id_10;
  wire id_11;
  assign id_1 = id_6;
  initial id_1 <= id_6 ? id_10 : 1'h0;
  always #1 $display(1, id_4, 1, id_10);
  assign id_7  = id_8;
  assign id_10 = 1'b0;
  wire id_12 = id_9;
  assign id_3 = 1'b0;
endmodule
macromodule module_1 (
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
    id_22
);
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always id_12 <= id_16;
  assign id_19 = id_2;
  wire id_23;
  xnor primCall (
      id_21,
      id_15,
      id_16,
      id_11,
      id_14,
      id_20,
      id_5,
      id_4,
      id_8,
      id_13,
      id_18,
      id_1,
      id_9,
      id_10,
      id_17,
      id_12,
      id_2,
      id_23
  );
  assign id_9 = 1'b0;
  assign id_2 = id_12;
  wire id_24;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_18,
      id_12,
      id_17,
      id_2,
      id_15,
      id_24
  );
endmodule
