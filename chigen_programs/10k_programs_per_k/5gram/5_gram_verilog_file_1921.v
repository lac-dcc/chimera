// Seed: 1219914615
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    module_0,
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
    id_23
);
  output wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout logic [7:0] id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_3,
      id_4,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2
  );
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_6;
  ;
  xnor primCall (id_5, id_4, id_2);
  always @(posedge id_5[1]) begin : LABEL_0
    if (1) assume (id_6 * id_3 - id_6);
  end
endmodule
