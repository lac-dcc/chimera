// Seed: 2232772502
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
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_11(
      .id_0(id_7),
      .id_1(id_8 ^ 1'b0),
      .id_2(id_5 == id_3),
      .id_3(id_8 * 1),
      .id_4(1'h0),
      .id_5(1),
      .sum(id_4),
      .id_6(id_9),
      .id_7(id_10)
  ); id_12 :
  assert property (@(posedge id_9) 1)
  else $display(1'b0);
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
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always_ff disable id_9;
  module_0(
      id_4, id_9, id_5, id_9, id_4, id_4, id_6, id_9, id_4, id_5
  );
endmodule
