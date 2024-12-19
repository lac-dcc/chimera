// Seed: 2489306810
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_12;
  id_13 :
  assert property (@(posedge id_11) id_7)
  else $display(id_10);
  wire id_14;
  wire id_15;
  id_16(
      .id_0(id_11),
      .id_1(1),
      .id_2(id_5),
      .id_3(id_6),
      .id_4(1 !== 1),
      .id_5(1'b0),
      .id_6(1),
      .id_7(id_5),
      .id_8(1),
      .id_9($display(id_1)),
      .id_10(1)
  );
  wire id_17;
endmodule
module module_1;
  uwire id_1;
  wire  id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign (weak1, strong0) id_1 = id_1;
  assign id_1 = 1;
  id_3 :
  assert property (@(negedge id_1) 1)
  else $display(id_3++);
endmodule
