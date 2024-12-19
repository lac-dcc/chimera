// Seed: 1626689054
module module_0;
  always @(1) begin : LABEL_0
    fork
      id_1 <= 1;
      @(id_1 == id_1) begin : LABEL_0
        id_1 = id_1;
      end
    join
  end
endmodule
module module_1;
  final begin : LABEL_0
    id_1 <= 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input tri0 id_0,
    input wor id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4
);
  assign id_6 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always @(*) id_6 <= 1'b0;
  assign id_6 = 1;
  always @(id_0 or negedge 1 == id_3) begin : LABEL_0
    cover (1);
  end
  reg  id_7;
  wire id_8;
  assign id_6 = 1 || "";
  always @(id_0 == 1'b0, negedge 1) id_7 = id_6;
  wire id_9;
endmodule
