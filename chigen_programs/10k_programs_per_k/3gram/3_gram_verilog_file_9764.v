// Seed: 1055990013
module module_0 (
    id_1
);
  inout wire id_1;
  reg id_2;
  wire id_3;
  wire id_4;
  supply1 id_5 = 1'd0;
  tri1 id_6;
  always @(posedge id_5) begin : LABEL_0
    if (1) id_6 = 1;
    else begin : LABEL_0
      id_2 <= "";
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wor id_4 = 1;
  buf primCall (id_3, id_4);
  module_0 modCall_1 (id_4);
  assign modCall_1.id_5 = 0;
  assign id_3 = {id_4{1}};
endmodule
