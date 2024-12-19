// Seed: 3172607539
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
    id_14
);
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_15;
  wire id_16, id_17;
  assign module_1.id_2 = 0;
  id_18(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1'd0), .id_4(1), .id_5(id_11), .id_6(id_13)
  );
  wire id_19;
  assign id_12 = 1;
endmodule : SymbolIdentifier
module module_1 (
    output logic id_0
    , id_2
);
  assign id_0 = 1 - id_2;
  always @(id_2 or posedge 1) id_0 = #(id_2) 1'b0;
  wire id_4;
  assign id_2 = id_2 - 1'b0;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
