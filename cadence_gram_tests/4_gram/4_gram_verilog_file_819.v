// Seed: 2362166297
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire \id_8 ;
  wire id_9;
  specify
    (id_10 + => id_11) = ($realtime : $realtime : -1, $realtime : $realtime : $realtime);
  endspecify
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge $realtime or id_14) begin : LABEL_0
    if (id_12) id_16 <= -1;
    else begin : LABEL_0
      id_11 = -1;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_11,
      id_13,
      id_5,
      id_4,
      id_2,
      id_4
  );
endmodule
