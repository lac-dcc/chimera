// Seed: 3261789937
module module_0 (
    id_1
);
  output wire id_1;
  tri1 id_3;
  assign id_1 = !id_2 == id_3;
  assign module_2.id_4 = 0;
endmodule
module module_1;
  wire id_2;
  wire id_3;
  wire id_5;
  module_0 modCall_1 (id_5);
  logic [7:0] id_6, id_7;
  always_comb @(*) begin : LABEL_0
    #1;
  end
  wire id_8;
  wire id_9;
  wire id_10;
  id_11(
      .id_0(id_2)
  );
  wire id_12;
  assign id_6[("")] = 1;
endmodule
module module_2 #(
    parameter id_4 = 32'd81,
    parameter id_5 = 32'd75
);
  id_2(
      .id_0(1), .id_1(id_1)
  );
  wire id_3;
  module_0 modCall_1 (id_3);
  defparam id_4.id_5 = 1;
endmodule
