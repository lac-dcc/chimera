// Seed: 749614571
module module_0 (
    input wor id_0,
    input wire id_1,
    input wor id_2,
    input tri1 id_3,
    input tri1 id_4,
    output tri id_5,
    output supply0 id_6
);
  wand id_8;
  initial $display(1'd0 - 1, id_0);
  always id_6 = id_0;
  assign id_6 = $display(!id_8, 1, id_2, id_3);
  always @(posedge id_3 or negedge 1);
  wor id_9, id_10, id_11;
  always_comb id_5 = id_9;
  assign module_1.type_3 = 0;
  tri1 id_12 = id_8;
  wire id_13;
  assign id_8 = id_8;
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    output wire id_2,
    input uwire id_3,
    input uwire id_4,
    input tri id_5,
    input tri id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_0,
      id_5,
      id_2,
      id_1
  );
  if (1) begin : LABEL_0
    assign id_2 = 1;
  end
  assign id_1 = id_5 >> 1;
endmodule
