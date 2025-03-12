// Seed: 2205015127
module module_0 #(
    parameter id_6 = 32'd69
) (
    output tri1 id_0,
    input supply0 id_1,
    input tri id_2,
    output wor id_3
    , _id_6,
    input uwire id_4
);
  logic id_7;
  assign id_7[""] = 1;
  wire id_8;
  assign module_1.id_1 = 0;
  wire id_9;
  ;
  logic [id_6 : -1] id_10;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output tri0  id_4
);
  assign id_4 = id_3;
  always @(posedge 1) begin : LABEL_0
    assert (id_3);
  end
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_4,
      id_3
  );
endmodule
