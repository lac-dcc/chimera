// Seed: 3843119550
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  for (id_10 = id_4; 1; id_4 = 1) begin : LABEL_0
    assign id_10 = 1;
  end
  wor id_11 = id_9;
  generate
    wire id_12;
  endgenerate
  tri0 id_13;
  assign id_6 = 1 ? {1, id_11#(
      .id_11($display(1)),
      .id_2 (1),
      .id_2 (1),
      .id_7 (""),
      .id_13(1),
      .id_13(1)
  )} : id_8;
  wire id_14;
  wire id_15;
  wire id_16;
  always @(id_10) id_2 = id_13 - 1;
  wire id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  xor primCall (id_4, id_2, id_6, id_5, id_1);
  module_0 modCall_1 (
      id_4,
      id_6,
      id_3,
      id_2,
      id_2,
      id_4,
      id_5,
      id_5,
      id_3
  );
endmodule
