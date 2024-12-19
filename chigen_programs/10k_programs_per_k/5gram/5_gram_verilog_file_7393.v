// Seed: 1142917005
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 ();
  assign id_1 = 1;
  tri0 id_2 = id_2 - 1;
  tri  id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_2 = 0;
  logic [7:0] id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11;
  always @(posedge 1) begin : LABEL_0
    if (1 <= 1) id_6 = id_7;
  end
  wire id_12;
  assign id_11 = id_4[1];
endmodule
