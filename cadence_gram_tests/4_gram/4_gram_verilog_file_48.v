// Seed: 2506977051
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
    id_10
);
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_11 = $realtime == $realtime;
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
    id_12
);
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_13(
      id_10, ~id_11, id_6
  );
  module_0 modCall_1 (
      id_1,
      id_5,
      id_10,
      id_3,
      id_10,
      id_5,
      id_11,
      id_10,
      id_12,
      id_3
  );
  always @(posedge $realtime or negedge -1) begin : LABEL_0
    if (-1) id_8 <= ($realtime);
    else id_9 <= 1;
  end
  assign id_4 = (id_1);
endmodule
