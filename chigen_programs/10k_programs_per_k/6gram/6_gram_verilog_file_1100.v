// Seed: 1138554184
module module_0 (
    output tri1 id_0
);
  reg id_2;
  always @(negedge 1 & 1 - 1'd0) id_2 = #1 id_2;
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    output supply1 id_2,
    output tri id_3
);
  wire id_5, id_6;
  module_0 modCall_1 (id_2);
  assign modCall_1.type_4 = 0;
  uwire id_7 = 1'd0;
  reg   id_8;
  reg   id_9;
  reg   id_10;
  initial begin : LABEL_0
    id_8 = 1;
    for (id_8 = 1; id_7; id_8 = 1) begin : LABEL_0
      id_3 = 1'b0;
      disable id_11;
      id_10 <= id_8;
    end
    id_9 <= 1;
  end
endmodule
