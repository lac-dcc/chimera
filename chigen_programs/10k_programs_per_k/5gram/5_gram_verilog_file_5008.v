// Seed: 1578436223
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
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_16;
  id_17(
      .id_0(1), .id_1(id_1 !=? 1)
  );
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1
);
  assign id_1 = id_3;
  id_4 :
  assert property (@(posedge 1) id_4)
  else $display(id_3 == id_3);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  always @* begin : LABEL_0
    wait (id_3);
  end
  id_5(
      .id_0(id_4 == ~(id_3)),
      .id_1(1),
      .id_2(id_1),
      .id_3(1),
      .id_4(id_4),
      .id_5(1),
      .id_6(id_3),
      .id_7(),
      .id_8(1'b0),
      .id_9(1),
      .id_10(1),
      .id_11(1),
      .id_12(1'h0),
      .id_13(1'b0),
      .id_14(1'b0)
  );
endmodule
