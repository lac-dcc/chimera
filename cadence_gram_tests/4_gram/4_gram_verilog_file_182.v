// Seed: 1963387489
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  id_3(
      id_4, ($realtime), id_4, -1
  );
endmodule
module module_1 (
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
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  bit id_9;
  id_10(
      .id_0($realtime),
      .id_1(-1),
      .id_2(id_7),
      .id_3(-1'b0),
      .id_4(id_8),
      .id_5(1),
      .id_6(id_9),
      .id_7($realtime),
      .id_8(id_6),
      .id_9(-1),
      .id_10(($realtime == $realtime)),
      .id_11(id_4),
      .id_12(id_2),
      .id_13(),
      .id_14(id_8),
      .id_15(id_6),
      .id_16(id_6),
      .id_17($realtime),
      .id_18(id_2),
      .id_19(),
      .id_20(id_3[$realtime]),
      .id_21(id_5),
      .id_22(id_4),
      .id_23(~-1),
      .id_24()
  );
  module_0 modCall_1 (
      id_1,
      id_6
  );
  initial begin : LABEL_0
    id_1 = !id_5;
    id_9 <= #1 $realtime;
  end
endmodule
