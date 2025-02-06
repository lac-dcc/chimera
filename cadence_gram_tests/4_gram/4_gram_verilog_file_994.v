// Seed: 1133348091
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
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_14 = id_1;
  wire id_15;
  assign id_13 = id_12[1 : 1] ? $realtime : 1;
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
    id_9
);
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
  assign id_9 = 1 ? id_5 : 1 ? -1'b0 | id_3 : $realtime;
  uwire id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_2,
      id_2,
      id_10,
      id_11,
      id_8,
      id_3,
      id_11,
      id_11,
      id_4,
      id_11
  );
  assign id_8 = id_2;
  always @(posedge $realtime) begin : LABEL_0
    id_9 <= id_4[-1] && id_11 && $realtime && $realtime && 1 && id_3;
    id_3 = id_3;
  end
  tri1 id_12;
  specify
    $setuphold(posedge id_13, posedge id_14, ~id_7[$realtime], id_6[$realtime]);
    $setup(negedge id_15, negedge id_16, -1);
    (id_17 + => id_18) = ($realtime : id_14  : id_13, id_10 == $realtime : $realtime : -1);
    (id_19 + => id_20) = (id_12 && -1  : $realtime : id_4[1], -1'b0 : $realtime : $realtime);
  endspecify
endmodule
