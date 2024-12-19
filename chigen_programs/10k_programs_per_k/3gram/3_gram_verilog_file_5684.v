// Seed: 3847426789
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1) id_1 <= id_3;
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
    id_16
);
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always
    if (id_2) begin : LABEL_0
      id_4 <= 1;
    end
  assign id_3 = 1;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_1,
      id_11
  );
  assign id_4 = id_10;
  wire id_17;
  always @(id_17)
  fork
    while (id_6 + id_2 + id_4) begin : LABEL_0
      id_5 <= id_1;
      $display;
    end
    id_8 <= #1 1;
  join
endmodule
