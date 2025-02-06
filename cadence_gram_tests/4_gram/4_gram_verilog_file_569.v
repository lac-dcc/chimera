// Seed: 3948242591
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
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_11;
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
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_14;
  nand primCall (id_3, id_6, id_9, id_5, id_10, id_4, id_1, id_12, id_8, id_13, id_14);
  module_0 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_3,
      id_5,
      id_9,
      id_6,
      id_14,
      id_11,
      id_3
  );
  id_15(
      .id_0(), .id_1(id_12), .id_2($realtime)
  ); id_16(
      .id_0(), .id_1($realtime), .id_2($realtime), .id_3(id_5), .id_4($realtime)
  );
  assign id_7 = id_8;
  wire id_17;
  wire id_18;
  always @(posedge 1'b0 or negedge id_9) begin : LABEL_0
    id_16 = id_13;
  end
  wire id_19;
  assign id_18 = id_6;
endmodule
