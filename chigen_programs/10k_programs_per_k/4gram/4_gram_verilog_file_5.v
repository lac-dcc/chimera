// Seed: 3490869440
module module_0 (
    input  wor  id_0,
    output tri0 id_1,
    input  wand id_2
);
  tri0 id_4 = 1;
  supply1 id_5;
  assign id_5 = 1'b0;
  id_6(
      .id_0(id_0),
      .id_1(1),
      .id_2(id_2),
      .id_3(id_1),
      .id_4(1),
      .id_5(id_4),
      .id_6(id_1),
      .id_7(1),
      .id_8(1),
      .id_9(~id_2),
      .id_10(id_0++),
      .id_11(1),
      .id_12(1),
      .id_13(1'b0),
      .id_14(1)
  );
  assign id_5 = id_2;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    output supply1 id_2
);
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.id_1 = 0;
  always @(posedge id_0) begin : LABEL_0
    fork
      id_6(id_0, id_0);
    join
  end
endmodule
