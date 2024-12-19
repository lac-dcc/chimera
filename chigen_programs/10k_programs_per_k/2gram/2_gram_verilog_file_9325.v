// Seed: 1890191713
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_3 ^ id_6;
  always id_2 = 1'b0;
  id_9(
      .id_0(1),
      .id_1(id_5),
      .id_2(id_8 ? 1 : id_5 - id_4 ? 1 : id_6 ? id_8 : id_1 ? 1 : 1),
      .id_3(1'b0),
      .id_4(id_7),
      .id_5(id_7)
  );
  wire id_10;
  tri1 id_11;
  always #1 begin : LABEL_0
    id_6 = id_8;
  end
  if (1) begin : LABEL_0
    assign id_2 = 1;
  end
  supply1 id_12;
  initial begin : LABEL_0
    id_4 = id_11;
  end
  assign id_6 = {1{id_12}};
  wire id_13;
  wire id_14 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(
        .id_6 (1),
        .id_7 (1),
        .id_8 (~1),
        .id_9 (id_8 & 1),
        .id_10(id_6),
        .id_11(1'b0 * id_3),
        .id_12(id_10),
        .id_13(id_13)
    ),
    id_14,
    id_15
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_12 = "" == (1);
  wire id_16;
  wire id_17;
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_17,
      id_18,
      id_2,
      id_2,
      id_14,
      id_4,
      id_5
  );
  assign modCall_1.type_16 = 0;
endmodule : SymbolIdentifier
