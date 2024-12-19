// Seed: 1667486988
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input wand id_2,
    output supply0 id_3,
    input wor id_4,
    output tri1 id_5,
    input tri0 id_6
);
  always @(posedge 1) id_5 = id_6;
  id_8(
      .id_0(1), .id_1(id_6), .id_2((id_4)), .id_3(id_5)
  );
  wire id_9;
  wire id_10;
  assign id_5 = id_2;
  wire id_11;
  wire id_12;
  always begin : LABEL_0
    @(posedge id_10);
  end
  wire id_13;
endmodule
module module_1 (
    input  tri1 id_0,
    input  wire id_1,
    output wand id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    id_4 = id_4;
  end
endmodule
