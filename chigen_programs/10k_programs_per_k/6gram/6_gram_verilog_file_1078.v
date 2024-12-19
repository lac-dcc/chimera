// Seed: 859695293
module module_0 ();
  wor  id_1;
  wire id_2;
  assign id_1 = 1;
  wire id_3;
  assign id_2 = 1;
endmodule
module module_1 ();
  assign id_1 = id_1;
  supply1 id_2 = 1'b0;
  supply0 id_3;
  tri id_4;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    id_1 = id_3;
    if (id_1) begin : LABEL_0
      cover (id_2);
      id_4 = id_3;
    end
  end
endmodule
module module_2 (
    input supply0 id_0
    , id_6,
    output supply1 id_1,
    input logic id_2,
    input wor id_3,
    input logic id_4
);
  assign id_1 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  assign id_6 = 1 ? id_2 : 1;
  always @(*) begin : LABEL_0
    id_6 <= id_4;
  end
endmodule
