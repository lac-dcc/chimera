// Seed: 4216108770
module module_0 (
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
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_9 = id_5;
  assign module_1.id_12 = 0;
  always @(posedge 1 or posedge 1) begin : LABEL_0
    id_8 <= id_3 - 1'b0;
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
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1 or posedge (id_13)) if (1) id_5 <= id_12;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_8,
      id_7,
      id_8,
      id_13,
      id_7,
      id_5,
      id_11
  );
endmodule
