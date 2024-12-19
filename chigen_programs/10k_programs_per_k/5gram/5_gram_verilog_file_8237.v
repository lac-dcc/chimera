// Seed: 2120957911
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  int id_8;
  wire id_9, id_10, id_11, id_12, id_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    for (id_5 = 1; 1 ==? id_4; id_1 = 1) begin : LABEL_0
      if (1 == 1) begin : LABEL_0
        wire id_6;
      end else begin : LABEL_0
        assign id_3 = 1;
      end
    end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_4,
      id_5
  );
endmodule
