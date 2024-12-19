// Seed: 324936309
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  tri1 id_6;
  id_7(
      .id_0(1), .id_1(id_2), .id_2(id_3), .id_3(1 / id_6 == (1))
  );
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wor id_12 = id_6 - 1'h0, id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_8,
      id_3
  );
  assign modCall_1.id_6 = 0;
  wire id_14;
  wire id_15;
  assign id_10 = id_9;
  wire id_16;
  always @(posedge id_12) begin : LABEL_0
    id_10 <= 1;
  end
  assign id_3 = id_8;
  xnor primCall (id_5, id_3, id_7, id_13, id_12, id_10, id_6, id_8, id_2, id_9);
endmodule
