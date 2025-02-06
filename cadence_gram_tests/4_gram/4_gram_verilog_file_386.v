// Seed: 2945702733
module module_0;
  wire id_1;
  wire id_2;
  id_3(
      .id_0(1'b0),
      .id_1(id_2),
      .id_2(id_2),
      .id_3(),
      .id_4($realtime + id_1),
      .id_5(),
      .id_6(~id_1),
      .id_7(id_1),
      .id_8(-1)
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
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wor id_15;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_16;
  assign id_4[$realtime] = $realtime;
  supply1 id_17;
  wire id_18;
  always @(-1 or posedge -1) begin : LABEL_0
    id_15 = $realtime;
  end
  assign id_9 = $realtime;
  wire id_19;
  always @(posedge id_15 or posedge id_5) begin : LABEL_0
    if (id_17) id_6 <= id_13;
  end
endmodule
