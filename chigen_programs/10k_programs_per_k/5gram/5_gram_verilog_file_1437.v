// Seed: 1439858970
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  reg  id_4 = {1};
  wire id_5;
  wire id_7;
  always @(id_2) begin : LABEL_0
    id_1 <= id_4;
  end
  wire id_8;
  assign id_6 = id_1;
  wire id_9;
  assign id_8 = id_3;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_8;
  final begin : LABEL_0
    fork
      id_9(id_2 == 1'b0);
      #1;
    join
    id_8 <= 1;
    assign id_5 = 1 & id_8;
    #1;
  end
  assign id_6[1'b0] = 1;
  module_0 modCall_1 (
      id_8,
      id_2
  );
  assign modCall_1.type_12 = 0;
endmodule
