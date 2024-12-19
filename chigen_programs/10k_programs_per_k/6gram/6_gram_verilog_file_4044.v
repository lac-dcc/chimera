// Seed: 1337934715
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  module_2 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_1,
      id_5
  );
  wire id_6;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
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
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  generate
    for (id_10 = 1; 1; id_3 = id_8) begin : LABEL_0
      assign id_9 = id_6;
      assign id_4 = id_5;
    end
  endgenerate
  id_11(
      .id_0(id_7 == id_8),
      .id_1(1),
      .id_2(1),
      .id_3(id_6 ~^ id_8),
      .id_4(1),
      .id_5(1),
      .id_6(id_1),
      .id_7(id_9),
      .id_8(~id_4),
      .id_9(1 * 1'b0),
      .id_10(~id_3),
      .id_11(id_9 - 1'b0),
      .id_12(id_2),
      .id_13(id_2),
      .id_14(id_1 - 1),
      .id_15(1)
  );
endmodule
