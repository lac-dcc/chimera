// Seed: 1424687622
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
    id_10#(.id_11(1))
);
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_12, id_13, id_14, id_15, id_16;
  parameter id_17 = 1'b0 < id_8;
  assign id_5 = id_16 ? id_12 : id_12;
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_2,
      id_7,
      id_10,
      id_8,
      id_2,
      id_1,
      id_8
  );
  assign modCall_1.id_12 = 0;
  id_12 :
  assert property (@(posedge 1'h0) id_6)
    if (1)
      #1
        if (id_1) $display;
        else begin : LABEL_0
          if ((1 - id_10)) @(posedge -1) id_10 = id_11 * -1 <= 1 & 1;
        end
    else id_7 = id_11;
endmodule
