// Seed: 2611429321
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_11;
  generate
    always @(id_11) id_11 = -1;
  endgenerate
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
    id_17
);
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  module_0 modCall_1 (
      id_6,
      id_17,
      id_3,
      id_5,
      id_16,
      id_5,
      id_14,
      id_3,
      id_17,
      id_17
  );
  id_18 :
  assert property (@(posedge id_17) -1'b0)
  else $clog2(28);
  ;
  assign id_1[1'b0] = -1;
  bit id_19;
  always @(posedge id_16 or posedge 1) id_19 = id_16 >> id_17;
endmodule
