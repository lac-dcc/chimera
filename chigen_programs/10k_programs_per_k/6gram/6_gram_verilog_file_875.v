// Seed: 1993964254
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_7, id_8;
  assign module_1.id_26 = 0;
  always @(1'h0 or 1 == id_4)
    if (id_8) #1 force id_8 = id_2;
    else begin : LABEL_0
      id_7 <= #1 1;
    end
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
  output wire id_24;
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_26;
  module_0 modCall_1 (
      id_15,
      id_26,
      id_8,
      id_17,
      id_8,
      id_20
  );
  always id_22 <= #1 id_5;
  wire id_27;
  initial begin : LABEL_0
    id_26 <= #1 id_22;
    #(1);
    id_9 = id_22;
  end
endmodule
