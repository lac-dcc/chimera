// Seed: 3281995908
module module_0 ();
  always @* begin : LABEL_0
    id_1 <= 1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    output tri id_2
);
  always @(*) begin : LABEL_0
    id_2 = ({1, 1} - 1) - 1;
    id_1 <= {1{1 != 1}};
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  wire  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    output tri1  id_3
);
  reg id_5;
  initial id_5 <= 1;
  buf primCall (id_3, id_5);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
