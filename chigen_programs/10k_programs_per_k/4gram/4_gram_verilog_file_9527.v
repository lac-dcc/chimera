// Seed: 825636824
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input wand id_3,
    output supply1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input wor id_7,
    input tri0 id_8,
    input uwire id_9,
    input tri id_10
);
  assign id_4 = 1;
  wor id_12;
  assign id_12 = 1'b0 ? 1 : {1'd0 / id_10{id_12++}};
  id_13(
      .id_0((1)),
      .id_1(1),
      .id_2((id_3)),
      .id_3(id_8),
      .id_4(1'h0),
      .id_5(id_7),
      .id_6(1),
      .id_7(id_5)
  );
  wire id_14;
  assign module_1.id_4 = 0;
  wire id_15;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri id_5,
    inout tri id_6
    , id_13,
    input wor id_7,
    input uwire id_8,
    input tri1 id_9,
    output tri id_10,
    input wor id_11
);
  always @(negedge 1)
    if ((id_11)) begin : LABEL_0
      id_13 <= id_3 + 1;
    end
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_1,
      id_9,
      id_7,
      id_9,
      id_6,
      id_8,
      id_5
  );
endmodule
