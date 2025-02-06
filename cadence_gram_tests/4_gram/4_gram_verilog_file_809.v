// Seed: 3076124297
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
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = $realtime;
  always @(posedge -1 or negedge id_7) begin : LABEL_0
    if (id_11) begin : LABEL_0
      $clog2(57);
      ;
    end
  end
  wire id_14;
  id_15(
      .id_0($realtime),
      .id_1(id_5),
      .id_2(~id_9),
      .id_3(),
      .id_4(id_13),
      .id_5(id_11),
      .id_6(-1),
      .id_7()
  );
  wire id_16;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7;
  specify
    $period(negedge id_8, 1, id_9);
  endspecify
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_1,
      id_6,
      id_4,
      id_7,
      id_7,
      id_4,
      id_1,
      id_7,
      id_1,
      id_6
  );
endmodule
