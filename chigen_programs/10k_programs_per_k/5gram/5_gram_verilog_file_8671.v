// Seed: 3598936296
module module_0 (
    input tri1 id_0
    , id_3,
    input wire id_1
);
  supply0 id_4;
  always @(posedge 1'b0) begin : LABEL_0
    id_4 = 1'b0;
  end
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    input wor id_2,
    input wire id_3,
    output wand id_4,
    input wand id_5,
    output tri1 id_6,
    output wor id_7
);
  module_0 modCall_1 (
      id_2,
      id_5
  );
  assign modCall_1.type_0 = 0;
  wire id_9;
  for (id_10 = id_2 == id_5; 1'b0; id_4 = id_2)
  for (id_11 = id_0; id_11; id_6 = id_10) begin : LABEL_0
    id_12(
        .id_0(1), .id_1(id_10), .id_2(1), .id_3(1'b0)
    );
  end
endmodule
