// Seed: 3525387242
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
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  id_9(
      .id_0(1),
      .id_1(1'b0 * 1 - 1),
      .id_2(1 == 1),
      .id_3(~id_8),
      .id_4(1'd0 > 1),
      .id_5(1),
      .id_6(id_6),
      .id_7(-id_2)
  );
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  assign id_3 = 1;
  always_ff @(*) begin : LABEL_0
    id_4[1'b0] = 1;
  end
  wire id_6, id_7;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_6,
      id_7,
      id_5,
      id_6,
      id_7
  );
endmodule
