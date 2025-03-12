// Seed: 2970272470
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
    id_15
);
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire  id_16;
  wire  id_17;
  logic id_18;
  ;
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
    id_14
);
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout logic [7:0] id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_2,
      id_13,
      id_13,
      id_9,
      id_5,
      id_9,
      id_14,
      id_9,
      id_12,
      id_3,
      id_13,
      id_3,
      id_9,
      id_9,
      id_13
  );
  output wire id_1;
  assign id_7 = id_11;
  assign id_7 = id_5;
  assign id_6[-1'b0 :-1] = id_14;
  always @(posedge id_13 or posedge id_11[1'b0==-1]) begin : LABEL_0
    $signed(44);
    ;
    assume ({(-1), -1'b0});
  end
  assign id_7 = 1'b0;
endmodule
