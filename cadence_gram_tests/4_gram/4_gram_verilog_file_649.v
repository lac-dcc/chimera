// Seed: 3609242513
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = $realtime ? id_5 : $realtime;
  assign id_6 = !id_3;
  id_7(
      id_3, 1'h0, $realtime + $realtime
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
  wire id_5;
  id_6(
      .id_0(id_1),
      .id_1(-1'b0),
      .id_2({$realtime{$realtime}}),
      .id_3($realtime),
      .id_4(-1),
      .id_5(id_4),
      .id_6(-1'b0),
      .id_7(id_5),
      .id_8(id_3[1]),
      .id_9((id_5) && 1),
      .id_10(-1'b0),
      .id_11($realtime),
      .id_12($realtime),
      .id_13($realtime),
      .id_14(),
      .id_15(id_3[$realtime]),
      .id_16(id_5),
      .id_17(1),
      .id_18(id_5)
  );
endmodule
