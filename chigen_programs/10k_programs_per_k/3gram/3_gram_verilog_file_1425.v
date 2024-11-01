// Seed: 851063211
macromodule module_0 ();
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  if (~id_3) begin
    assign id_1 = id_2;
  end else begin : id_7
    wire id_8;
    id_9(
        .id_0(!1), .id_1(id_3)
    );
  end
  wire id_10;
  id_11(
      .id_0(1),
      .id_1(id_2),
      .id_2(1),
      .id_3(1),
      .id_4(id_1),
      .id_5(id_2),
      .id_6(id_2),
      .id_7(id_5[1 : 1]),
      .id_8(id_3),
      .id_9(id_1[0]),
      .id_10(1),
      .id_11(1),
      .id_12(1),
      .id_13(id_3 == 1 && 1),
      .id_14()
  ); module_0();
endmodule
