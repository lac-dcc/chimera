// Seed: 2527988025
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
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output uwire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_23;
  assign id_16 = id_17;
  wire id_24;
  id_25 :
  assert property (@(posedge -1 | id_2) 1)
  else assign id_8 = id_15;
  parameter id_26 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd28
) (
    output tri1 id_0,
    input tri1 id_1,
    output logic id_2,
    input tri0 id_3,
    input supply1 _id_4
);
  wire [1 'h0 -  1 : id_4] id_6;
  parameter id_7 = 1;
  parameter id_8 = "";
  wire [-1 : 1] id_9;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_7,
      id_7,
      id_8,
      id_6,
      id_7,
      id_8,
      id_8,
      id_7,
      id_6,
      id_9,
      id_7,
      id_9,
      id_6,
      id_7,
      id_7,
      id_9,
      id_9,
      id_8,
      id_6,
      id_8
  );
  always id_2 <= id_6;
endmodule
