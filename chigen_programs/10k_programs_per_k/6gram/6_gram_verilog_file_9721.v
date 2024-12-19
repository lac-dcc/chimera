// Seed: 357904092
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1 ^ 1;
  assign id_4 = 1'b0;
  assign id_2 = 1;
  always @(posedge id_3 or negedge 1) begin : LABEL_0
    id_2 <= id_1;
  end
  assign module_1.id_11 = 0;
  initial begin : LABEL_0
    deassign id_4;
    $display;
  end
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wor id_14 = 1;
  assign id_12 = 1 == id_9 + id_14;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_9
  );
  always @(posedge 1 or id_12) id_8 <= #1 1;
endmodule
