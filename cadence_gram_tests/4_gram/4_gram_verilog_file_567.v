// Seed: 3018863924
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
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = $realtime ? 1 : 1'b0;
  wire id_16;
  assign id_12 = id_13;
  wire id_17;
  id_18(
      1, $realtime, $realtime
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
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  always @(posedge id_2 or posedge id_1) begin : LABEL_0
    id_6 <= $realtime;
  end
  module_0 modCall_1 (
      id_5,
      id_2,
      id_2,
      id_9,
      id_5,
      id_9,
      id_9,
      id_2,
      id_2,
      id_5,
      id_9,
      id_9,
      id_2,
      id_2,
      id_2
  );
  wire id_10;
  id_11(
      .id_0(-1'h0), .id_1(1'b0)
  );
endmodule
