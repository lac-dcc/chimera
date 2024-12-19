// Seed: 756879381
module module_0 (
    input wor id_0,
    input tri id_1,
    input supply0 id_2
);
  genvar id_4;
  tri id_5;
  tri id_6 = 1'b0;
  assign id_5 = id_5 == id_2 & id_5;
  always @(1) begin : LABEL_0
    id_5 = (1);
  end
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    output wor id_2,
    output supply1 id_3,
    input wire id_4,
    input tri1 id_5,
    input uwire id_6
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6
  );
  assign modCall_1.type_7 = 0;
  assign id_2 = id_1;
  wire id_8;
  wire id_9;
endmodule
