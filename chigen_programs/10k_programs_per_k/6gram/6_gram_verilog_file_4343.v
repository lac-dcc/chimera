// Seed: 862909342
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
    id_22
);
  output wire id_22;
  output wire id_21;
  input wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout tri id_2;
  inout wire id_1;
  assign id_2 = (1 - id_17 ? id_18 : -1);
  assign id_2 = 1;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_2 = 32'd6
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3
  );
  inout wire _id_2;
  inout logic [7:0] id_1;
  initial begin : LABEL_0
    id_1[!id_2] <= id_4;
  end
endmodule
