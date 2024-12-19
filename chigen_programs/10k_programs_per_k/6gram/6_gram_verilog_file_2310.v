// Seed: 1711034681
module module_0 (
    input supply1 id_0,
    output uwire id_1,
    input tri1 id_2,
    output wor id_3,
    output tri id_4,
    input tri0 id_5,
    output uwire id_6
    , id_9,
    output wor id_7
);
  wire id_10;
  wire id_11;
  wire id_12;
  always @(*) $display;
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    output tri0 id_2,
    output supply1 id_3,
    input wor id_4,
    output wor id_5
);
  always @* begin : LABEL_0
    id_3 = 1;
    id_3 = 1'b0;
    id_2 = 1;
    id_1 <= 1 - 1;
  end
  always @(1 or 1 or id_0) begin : LABEL_0
    id_1 <= 1 - id_0;
    id_3 = 1'h0;
  end
  tri id_7;
  assign id_7 = (id_4);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_7,
      id_2,
      id_5,
      id_0,
      id_5,
      id_5
  );
  assign modCall_1.type_14 = 0;
endmodule
