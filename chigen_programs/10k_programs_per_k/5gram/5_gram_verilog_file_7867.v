// Seed: 4043659887
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  wire id_8;
  wire id_9;
  wire [-1 : 1 'd0] id_10;
  logic id_11;
  ;
  assign id_3 = id_7;
  assign id_3 = id_9;
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
    id_19
);
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output logic [7:0] id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout supply1 id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  xnor primCall (
      id_3, id_6, id_8, id_11, id_7, id_13, id_12, id_15, id_9, id_4, id_5, id_18, id_14, id_19
  );
  generate
    assign id_4 = -1;
    assign id_16[-1'b0] = id_15 != id_6;
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_11,
      id_6,
      id_5,
      id_3,
      id_3
  );
endmodule
