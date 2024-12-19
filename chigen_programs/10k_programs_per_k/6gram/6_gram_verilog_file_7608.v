// Seed: 2605951549
module module_0 (
    input  tri  id_0,
    input  tri0 id_1,
    output tri1 id_2,
    output wor  id_3,
    input  tri0 id_4,
    input  wire id_5,
    output wor  module_0
);
  wire id_8;
  reg  id_9;
  wire id_10;
  always @(id_1 or posedge 1) begin : LABEL_0
    if (1) id_9 <= 1;
  end
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input uwire id_3,
    output tri id_4,
    input wor id_5,
    inout supply1 id_6
);
  assign id_4 = 1 == id_2;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_0,
      id_5,
      id_3,
      id_6
  );
  assign modCall_1.type_2 = 0;
  assign id_4 = (id_1 & id_5 & 1 == id_2);
endmodule
