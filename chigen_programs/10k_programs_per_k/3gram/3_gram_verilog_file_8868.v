// Seed: 3513861058
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
    id_18
);
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge id_11) $clog2(78);
  ;
  assign id_4[1] = id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_7 = 1, id_8 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_7,
      id_4,
      id_7,
      id_7,
      id_2,
      id_7,
      id_7,
      id_1,
      id_1,
      id_1,
      id_7,
      id_7,
      id_2,
      id_7,
      id_1,
      id_3
  );
  assign id_2 = id_4[1];
  assign id_2 = id_8;
endmodule
