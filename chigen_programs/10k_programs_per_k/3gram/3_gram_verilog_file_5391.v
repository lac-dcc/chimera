// Seed: 2171535324
module module_0;
  always @(posedge 1 - 1) begin : LABEL_0
    id_1 <= 1;
  end
  wire id_3;
  assign #1 id_2 = 1;
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always @(id_5 or posedge id_6 & 1) begin : LABEL_0
    id_3 <= 1 | id_5;
  end
endmodule
