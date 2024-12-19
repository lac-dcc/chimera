// Seed: 1529489333
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_2 = id_2;
    id_2 = #1 id_2;
    release id_3;
  end
  always @(posedge 1) begin : LABEL_0
    id_3 <= id_4 & id_4;
  end
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
    id_18
);
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  final begin : LABEL_0
    case (id_6)
      id_9: id_15 = 1;
      (1): id_18 = 1;
      id_1 - 1: id_12 <= 1;
    endcase
  end
  module_0 modCall_1 (
      id_15,
      id_12,
      id_6,
      id_17
  );
endmodule
