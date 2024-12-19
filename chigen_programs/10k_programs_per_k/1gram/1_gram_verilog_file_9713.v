// Seed: 1270622721
macromodule module_0 (
    id_1
);
  output wire id_1;
  wire id_3;
  assign id_2 = 1;
  assign #1 id_2 = 1;
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input tri0 id_2,
    input uwire id_3
);
  wire id_5, id_6;
  tri1 id_7, id_8;
  module_0 modCall_1 (id_8);
  always begin : LABEL_0
    id_7 = 1;
  end
endmodule
module module_2 (
    output logic id_0,
    output logic id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  wire  id_4,
    input  uwire id_5
);
  initial
    #1
      if (1'b0) begin : LABEL_0
        id_0 <= 1;
      end else id_1 <= 1;
  wire id_7;
  id_8(
      .id_0({1, id_5}),
      .id_1(id_3),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(id_5),
      .id_6(id_4),
      .id_7(id_4 ? 1 : 1'd0)
  );
  wire id_9;
  module_0 modCall_1 (id_9);
  wire id_10;
  if (id_9) begin : LABEL_0
    wire id_11;
  end
  id_12(
      1, 1'h0, 1 - id_1 !== 1, id_2
  );
  wire id_13;
  tri0 id_14 = 1;
  wire id_15, id_16;
endmodule
