// Seed: 3146584454
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
    id_16
);
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  specify
    (negedge id_17 => (id_18  : $realtime)) = (-1  : id_4  : id_7, -1  : $realtime : 1);
    (id_19 + => id_20) = (id_13  : id_6  : $realtime, 1'b0 : 1  : $realtime);
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
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_9,
      id_9,
      id_4,
      id_4,
      id_7,
      id_2,
      id_4,
      id_5,
      id_9,
      id_9,
      id_9,
      id_7,
      id_4,
      id_7
  );
  supply0 id_10;
  always @(posedge -1 or negedge id_10) begin : LABEL_0
    id_1 <= id_6 << id_6;
  end
endmodule
