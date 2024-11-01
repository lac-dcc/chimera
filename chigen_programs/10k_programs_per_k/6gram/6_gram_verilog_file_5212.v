// Seed: 2049035929
module module_0 ();
  wire id_1;
  module_2(
      id_1, id_1, id_1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  generate
    begin : id_6
      wire id_7;
    end
  endgenerate
  module_0();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_1 - 1;
  id_4(
      .id_0(1 ** 1),
      .id_1(1),
      .id_2(id_2),
      .id_3(id_1),
      .id_4(""),
      .id_5(1),
      .id_6(1'b0),
      .id_7(1),
      .id_8(1),
      .id_9(1),
      .id_10(id_2),
      .id_11(1),
      .id_12(1 < id_1),
      .id_13(1),
      .id_14(id_2),
      .id_15(1)
  ); specify
    (id_5 => id_6) = 1;
  endspecify
endmodule
