// Seed: 201759544
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
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8 = id_3;
  id_9(
      .id_0(1),
      .id_1(id_8),
      .id_2(id_4),
      .id_3(id_4),
      .id_4(id_6),
      .id_5(1),
      .id_6(id_7 - 1),
      .id_7(id_7),
      .id_8(id_6),
      .id_9(id_8),
      .id_10(id_7),
      .id_11(1),
      .id_12(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_2,
      id_2,
      id_4,
      id_5
  );
  always @(*) begin : LABEL_0
    id_1 <= 1'b0 - 1'b0;
  end
endmodule
