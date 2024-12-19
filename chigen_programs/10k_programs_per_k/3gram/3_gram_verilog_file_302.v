// Seed: 358019105
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  genvar id_4;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    output wor id_2
);
  supply1 id_4;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
  wire id_6;
  xnor primCall (id_2, id_4, id_0);
  assign id_1 = id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_1 <= {id_3{1}};
  end
  xor primCall (id_6, id_5, id_7, id_4, id_3, id_8);
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6
  );
  id_9(
      .id_0(id_6),
      .id_1(id_5),
      .id_2(id_4),
      .id_3(1),
      .id_4(1'b0),
      .id_5(1),
      .id_6(id_7),
      .id_7(),
      .id_8(id_5),
      .id_9(id_6),
      .id_10(),
      .id_11(1),
      .id_12(id_6),
      .id_13(1'd0),
      .id_14(id_2 && 1),
      .id_15(1'h0 & 1),
      .id_16(1)
  );
endmodule
