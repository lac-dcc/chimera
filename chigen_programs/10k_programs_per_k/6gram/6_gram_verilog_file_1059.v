// Seed: 3803497402
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
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_11) begin : LABEL_0
    wait (1'b0);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  and primCall (id_4, id_1, id_2, id_3);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_4,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2,
      id_1,
      id_1,
      id_4
  );
  logic id_6 = id_2;
endmodule
