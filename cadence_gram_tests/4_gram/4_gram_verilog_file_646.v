// Seed: 566578900
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  tri1 id_6;
  wire id_7;
  id_8(
      .id_0(1),
      .id_1(id_2),
      .id_2(-1),
      .id_3($realtime),
      .id_4($realtime),
      .id_5(id_1),
      .id_6(-1'b0),
      .id_7((-1'b0)),
      .id_8(1'd0),
      .id_9(id_2),
      .id_10($realtime),
      .id_11(!id_4),
      .id_12(id_5),
      .id_13($realtime)
  );
  assign id_6 = id_4;
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
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_12;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_8,
      id_5,
      id_1
  );
  always @(posedge $realtime or posedge -1) begin : LABEL_0
    id_2 <= (id_10);
  end
  assign id_6[1] = $realtime && id_1;
endmodule
