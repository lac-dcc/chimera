// Seed: 1704574192
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_11;
endmodule
module module_1 (
    output wor  id_0,
    input  wire id_1,
    output tri  id_2
);
  assign id_0 = id_1;
  reg  id_4;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  id_6(
      .id_0(),
      .id_1(id_5),
      .id_2(1'd0),
      .id_3(id_4),
      .id_4(id_2),
      .id_5(1),
      .id_6(id_2),
      .id_7(id_0)
  );
  wire id_7;
  wire id_8;
  always @(1 or posedge id_8) begin : LABEL_0
    id_4 <= id_4 - 1'b0;
  end
endmodule
