// Seed: 3760848526
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge $realtime or negedge $realtime) begin : LABEL_0
    id_3 = 1;
  end
  wire id_7;
  id_8(
      .id_0(), .id_1(-1'h0), .id_2($realtime), .id_3()
  );
  supply1 id_9 = 1'b0 ? 1 : $realtime == $realtime;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_1,
      id_6,
      id_1
  );
  wire id_8 = id_7[$realtime];
endmodule
