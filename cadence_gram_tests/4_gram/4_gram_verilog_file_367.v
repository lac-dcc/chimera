// Seed: 2243742393
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  inout wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_22;
  assign id_20 = $realtime;
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
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge -1 or negedge -1) begin : LABEL_0
    id_5[1 :-1] <= -1'b0;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_1,
      id_7,
      id_7,
      id_6,
      id_6,
      id_4,
      id_4,
      id_1,
      id_8,
      id_6,
      id_1,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_1,
      id_1
  );
  assign id_5[1] = -1;
  wire id_9;
  specify
    $period(posedge id_10, -1, id_11);
  endspecify
endmodule
