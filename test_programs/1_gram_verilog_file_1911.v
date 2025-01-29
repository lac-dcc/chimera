// Seed: 3881601122
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
    id_16
);
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  real id_17;
  wire id_18;
  wire id_19;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1
);
  tri0 id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  always
    if ("" || 1'b0) begin : LABEL_0
      id_0 = -1;
      id_1 <= -1'd0;
    end else begin : LABEL_0
      #1 id_1 <= -1 == id_3;
    end
  logic id_4, id_5, id_6, id_7, id_8;
  assign id_0 = id_7;
  assign id_3 = 1;
  for (id_9 = 1; id_9; id_1 = id_8) wire id_10, id_11;
endmodule
