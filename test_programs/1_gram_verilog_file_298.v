// Seed: 2606855520
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_6(
      .id_0(id_7),
      .id_1(id_3),
      .id_2(1'd0),
      .id_3(),
      .id_4(),
      .id_5(-1'h0),
      .id_6({-1'd0 - id_7, id_1 && -1'd0}),
      .id_7(id_7),
      .id_8(id_4),
      .id_9(1),
      .id_10(-1),
      .id_11(-1'b0),
      .id_12(id_4),
      .id_13(-1 / -1),
      .id_14(id_3),
      .id_15(-1),
      .id_16(id_3),
      .id_17(-1),
      .id_18(),
      .id_19(1'b0)
  );
endmodule
macromodule module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  id_3(
      id_2
  );
  assign id_1 = id_3;
endmodule
