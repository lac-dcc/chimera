// Seed: 3111101477
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1 & 1 ? id_3 : id_2 & id_2 ? id_2 : 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2
  );
  wire id_4;
  wor id_5, id_6;
  assign id_6 = 1;
  wire id_7;
  assign id_6 = id_5;
  always @(*) begin : LABEL_0
    id_2 = id_6;
    $display(1, id_6 < 1);
    id_3 <= 1;
  end
endmodule
