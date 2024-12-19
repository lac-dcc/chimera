// Seed: 1224828496
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1'b0) begin : LABEL_0
    id_1 = id_3;
  end
  id_5(
      .id_0(), .id_1(!id_3), .id_2(id_3), .id_3(1 == 1), .id_4(id_3), .id_5(1), .id_6(id_3)
  );
  wire id_6;
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
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_7
  );
  assign modCall_1.id_1 = 0;
  assign id_3 = 1 + 1'b0;
endmodule
