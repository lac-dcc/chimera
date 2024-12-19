// Seed: 1129457496
module module_0 (
    output tri1 id_0,
    input  wor  id_1
);
  tri0 id_3;
  wire id_4;
  supply0 id_5;
  assign id_0 = id_3++ - id_5 == 1;
  tri0 id_6, id_7 = id_3;
  wire id_8;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    input supply1 id_9
);
  module_0 modCall_1 (
      id_8,
      id_6
  );
  assign modCall_1.type_11 = 0;
  tri0 id_11;
  logic [7:0] id_12;
  id_13(
      .id_0(), .id_1(id_5)
  );
  always @(posedge id_9 or negedge 1);
  wire id_14;
  id_15(
      .id_0(id_5),
      .id_1(1),
      .id_2(id_4),
      .id_3(1'b0),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(id_1),
      .id_9(1)
  );
  assign id_14 = 1'b0;
  wire id_16;
  generate
    assign id_12[1'b0] = |id_0;
  endgenerate
  assign id_11 = 1;
endmodule
