// Seed: 3175612496
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  wire id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12;
  assign module_1.id_15 = 0;
  id_13(
      .id_0($realtime)
  ); \id_14 (
      .id_0(1'b0),
      .id_1(id_5),
      .id_2(($realtime)),
      .id_3(id_8),
      .id_4($realtime),
      .id_5(id_1),
      .id_6(id_7),
      .id_7(id_7),
      .id_8($realtime),
      .id_9(1),
      .id_10($realtime)
  );
endmodule
module module_1 #(
    parameter id_11 = 32'd70,
    parameter id_12 = 32'd34
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  bit id_5;
  tri1 id_6;
  logic [7:0] id_7;
  wire id_8;
  wire id_9;
  tri id_10 = $realtime;
  defparam id_11.id_12 = 1;
  assign id_4 = id_5;
  assign id_5 = $realtime;
  module_0 modCall_1 (
      id_8,
      id_10
  );
  always @(posedge -1) if (id_1) id_4 <= id_1;
  specify
    (negedge id_13 => (id_14 -: 1'd0)) = (id_7[1] : (1): $realtime, 1  : ($realtime): $realtime);
    $setup(posedge id_15, posedge id_16, $realtime);
    (id_17 + => id_18) = ($realtime : id_18  : $realtime, $realtime : id_6  : $realtime);
    (id_19 - => id_20) = ((id_15): $realtime : $realtime, id_16  : id_13  : id_19);
  endspecify
endmodule
