// Seed: 3012954308
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
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
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_10,
      id_5,
      id_12
  );
  output wire id_1;
  always_latch @(posedge id_10 or posedge -1 + -1) begin : LABEL_0
    if (1 !== 1) begin : LABEL_1
      @(-1, 1 or 1'b0);
    end
  end
endmodule
