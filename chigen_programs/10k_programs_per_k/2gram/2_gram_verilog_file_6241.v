// Seed: 880870299
module module_0 (
    output tri  id_0,
    input  tri0 id_1
);
  uwire id_3;
  always_latch id_3 = 1 & id_1 & (id_3);
  wor id_4 = id_3;
  always #1;
  assign id_4 = id_1;
  assign id_0 = 1;
  assign id_4 = id_4;
  assign id_5[1] = 1;
  wire id_6;
  always begin : LABEL_0
    id_0 = 1;
  end
endmodule
module module_1 (
    input  uwire id_0,
    input  logic id_1,
    input  uwire id_2,
    output uwire id_3,
    input  wor   id_4,
    output logic id_5,
    input  uwire id_6
);
  always id_5 <= id_1;
  wire  id_8;
  uwire id_9;
  id_10(
      .id_0(id_2), .id_1(id_3), .id_2(1), .id_3(id_8), .id_4(1), .id_5(1), .id_6(1'b0)
  );
  module_0 modCall_1 (
      id_3,
      id_0
  );
  wire id_11;
  id_12(
      .id_0(id_10), .id_1(id_2)
  );
  wor id_13;
  assign id_9 = id_6;
  assign id_9 = id_13;
endmodule
