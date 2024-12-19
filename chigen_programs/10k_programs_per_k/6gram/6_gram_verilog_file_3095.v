// Seed: 1019772779
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = 1;
  logic [7:0] id_8;
  reg id_9, id_10, id_11, id_12, id_13;
  id_14(
      .id_0(id_11), .id_1(id_8[""]), .id_2(id_2), .id_3(id_5), .id_4(1)
  );
  always @(posedge 1) begin : LABEL_0
    id_1 <= id_11;
  end
endmodule
module module_1 (
    input  uwire id_0
    , id_3,
    output wor   id_1
);
  uwire id_4;
  wor   id_5 = 1;
  uwire id_6 = 1'b0 < id_5;
  always @(posedge id_4 or negedge id_6) id_3 <= 1'b0;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.type_16 = 0;
  assign id_4 = id_0;
  wire id_7;
  assign id_5 = 1;
  id_8(
      .id_0(1),
      .id_1(id_5),
      .id_2(id_5),
      .id_3(id_0),
      .id_4(),
      .id_5(id_4),
      .id_6(id_6),
      .id_7(1),
      .id_8(id_4),
      .id_9(1),
      .id_10(id_5)
  );
endmodule
