// Seed: 253435086
module module_0 (
    input wand id_0,
    input uwire id_1,
    input supply1 id_2,
    output wor id_3,
    input wire id_4,
    output uwire id_5,
    input wor id_6
);
  wire id_8;
  generate
    id_9(
        .id_0(id_8),
        .id_1(id_2 == 1),
        .id_2(id_6),
        .id_3(1 - 1),
        .id_4(),
        .id_5(1),
        .id_6(1),
        .id_7(id_2)
    );
  endgenerate
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input tri0 id_2,
    output tri0 id_3,
    input wand id_4,
    output uwire id_5,
    output supply1 id_6,
    output tri0 id_7
);
  reg id_9;
  assign id_3 = id_2;
  always @(1 or posedge 1) begin : LABEL_0
    id_9 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_4,
      id_3,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
