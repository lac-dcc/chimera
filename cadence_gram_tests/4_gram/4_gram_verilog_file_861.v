// Seed: 2791772473
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
  output wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_16(
      id_13, $realtime, id_4, 1'b0
  );
  wire id_17;
  parameter id_18 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  tri id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  always @(posedge $realtime or $realtime) begin : LABEL_0
    id_1 <= $realtime;
    id_1 <= id_2;
  end
  id_5(
      id_2, ($realtime && id_4 && id_2)
  );
  assign id_3 = -1;
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  wire id_10;
endmodule
