// Seed: 1640187170
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri0 id_12;
  wire id_13, id_14, id_15;
  logic [7:0] id_16;
  wire id_17;
  always_comb @(id_17) id_16[1] <= !id_6;
  wire id_18;
  reg  id_19;
  initial begin : LABEL_0
    id_8 = id_14;
    if (1 - 1) id_10#(.id_12(1)) = 1;
    else begin : LABEL_0
      if (1) disable id_20;
    end
  end
  wire id_21;
  initial begin : LABEL_0
    id_19 <= id_11 == id_12;
  end
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input tri1 id_2,
    input supply1 id_3,
    output tri1 id_4,
    input tri id_5
);
  wire id_7;
  id_8(
      .id_0(1), .id_1(1), .id_2(id_5)
  );
  generate
    assign id_4 = 1;
  endgenerate
  wire id_9, id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_9,
      id_9,
      id_9,
      id_7,
      id_10,
      id_10,
      id_9,
      id_7
  );
endmodule
