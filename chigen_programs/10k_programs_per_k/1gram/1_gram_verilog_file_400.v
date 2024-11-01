// Seed: 4101558752
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    assign id_1 = id_2;
    assign id_3 = 1;
  endgenerate
  wire id_9;
  wire id_10;
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
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1'b0 / 1;
  wire id_12;
  wire id_13, id_14;
  always #1 id_11 <= id_2;
  module_0(
      id_8, id_4, id_6, id_7, id_9, id_9, id_6, id_14
  ); id_15 :
  assert property (@(posedge id_11.sum or id_5[1] or 'b0) 1);
  id_16(
      !1
  ); id_17(
      id_15
  );
  nand (id_5, id_13, id_4, id_11, id_7, id_12, id_2, id_1);
  tranif0 (.id_0(1'd0));
  id_18(
      id_2
  );
endmodule
