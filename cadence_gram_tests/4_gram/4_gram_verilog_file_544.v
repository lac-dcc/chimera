// Seed: 3916743926
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  always @(-1 or($realtime) or $realtime == 1 or id_1 or -1'b0 or negedge $realtime) begin : LABEL_0
    id_2 = id_1;
  end
  assign id_3 = id_4;
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
    id_10
);
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [7:0] id_11;
  uwire id_12;
  always @($realtime or -1 or 1 or posedge $realtime or negedge $realtime) begin : LABEL_0
    id_1 <= id_2;
  end
  assign id_1 = id_12 ? $realtime : 1'd0;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_8,
      id_10
  );
  id_13(
      $realtime, id_7
  );
  wire id_14 = id_11[$realtime];
  wire id_15;
  id_16(
      .id_0(1), .id_1(-1), .id_2(-1), .id_3(), .id_4()
  );
endmodule
