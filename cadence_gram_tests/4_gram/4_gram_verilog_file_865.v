// Seed: 3665539860
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  tri0 id_6 = (id_4);
  specify
    $setup(negedge id_7, negedge id_8, id_4 > $realtime);
    (id_9 + => id_10) = ($realtime : id_2  : $realtime, id_8  : id_9  : -1);
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = -1'd0 ? id_5[$realtime] : id_6;
  xnor primCall (id_9, id_8, id_14, id_6, id_11, id_10, id_12, id_7, id_4, id_13);
  module_0 modCall_1 (
      id_3,
      id_11,
      id_6,
      id_7,
      id_9
  );
endmodule
