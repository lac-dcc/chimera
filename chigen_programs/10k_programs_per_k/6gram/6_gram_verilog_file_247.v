// Seed: 1587571811
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  generate
    wire id_7;
    for (id_8 = 1 == id_4; 1'd0; id_7 = 1) begin : LABEL_0
      id_9(
          .id_0(1), .id_1(1)
      );
    end
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
    id_10
);
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11;
  initial begin : LABEL_0
    id_9 <= id_2;
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_10,
      id_1,
      id_4,
      id_1
  );
endmodule
