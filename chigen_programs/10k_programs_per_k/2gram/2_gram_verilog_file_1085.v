// Seed: 1045174068
module module_0 #(
    parameter id_3 = 32'd21
) (
    id_1
);
  output wire id_1;
  logic [7:0] id_2;
  for (_id_3 = 1; id_3; id_2[id_3] = -1) begin : LABEL_0
    logic id_4;
    struct {
      logic [~  (  1  ) : id_3] id_5;
      logic [id_3 : 1] id_6;
      logic id_7;
    }
        id_8, id_9;
  end
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (id_1);
  assign id_2 = id_3[1+:-1];
endmodule
