// Seed: 2653518676
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  specify
    $setuphold(negedge id_6, posedge id_7, -1, $realtime, id_8);
    $hold(negedge id_9, negedge id_10, -1);
    (id_11 + => id_12) = (-1'b0 : id_1  : id_4, 1 == $realtime);
  endspecify
  module_0 modCall_1 (
      id_11,
      id_4,
      id_9
  );
endmodule
