// Seed: 640444938
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = id_2;
  assign id_1[1] = !(id_3);
  assign id_6 = id_4;
endmodule : SymbolIdentifier
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
    id_19
);
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_13,
      id_5,
      id_4,
      id_2
  );
  assign id_4 = id_13;
  logic [7:0] id_20;
  assign id_12[1'h0] = 0 == id_13;
  assign id_3[1] = id_20[1];
  always @({id_13 == 1,
    1,
    1
  } or posedge id_13)
  begin : LABEL_0
    id_11 = ~id_16 ? 1 : id_16;
    id_13 = 1;
  end
  wire id_21;
  assign id_6[1] = 1'b0;
  xor primCall (
      id_3, id_6, id_8, id_11, id_13, id_10, id_15, id_9, id_4, id_5, id_17, id_16, id_18, id_14
  );
  assign id_17 = 1;
  assign id_18 = 1;
  wire id_22;
  wire id_23;
endmodule
