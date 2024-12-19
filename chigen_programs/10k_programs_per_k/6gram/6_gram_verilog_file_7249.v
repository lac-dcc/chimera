// Seed: 4148372792
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_4;
  always @(1 or posedge 1) begin : LABEL_0
    id_4 <= id_1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_8(
      .id_0(1'h0 - 1), .id_1(1), .id_2(id_2), .id_3(1)
  );
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6
  );
  assign modCall_1.id_4 = 0;
  wire id_9;
  wire id_10;
  reg  id_11 = id_1;
  wire id_12;
  always @(posedge id_10) begin : LABEL_0
    if (1) id_8 = id_4;
    id_1 <= 1;
  end
endmodule
