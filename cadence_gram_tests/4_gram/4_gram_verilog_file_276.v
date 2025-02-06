// Seed: 2252053331
module module_0 ();
  wire id_1;
  wire id_2;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  always @(id_3) begin : LABEL_0
    id_3 <= id_1;
    id_3 = $realtime;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
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
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_11;
  id_12(
      .id_0(1'b0), .id_1(), .id_2((-1)), .id_3($realtime), .id_4($realtime), .id_5()
  );
  module_0 modCall_1 ();
  id_13(
      .id_0(id_8),
      .id_1($realtime),
      .id_2(id_4),
      .id_3(id_8 | $realtime),
      .id_4(-1),
      .id_5($realtime),
      .id_6(),
      .id_7($realtime),
      .id_8(id_5[$realtime]),
      .id_9(id_2),
      .id_10(id_6),
      .id_11($realtime),
      .id_12()
  );
  always @(negedge $realtime) begin : LABEL_0
    id_5 = id_9;
  end
endmodule
