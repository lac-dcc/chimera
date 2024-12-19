// Seed: 2577655591
module module_0;
  reg id_1;
  always @(*) begin : LABEL_0
    #1
    if (1) begin : LABEL_0
      id_1 = 1;
    end else begin : LABEL_0
      id_1 = 1;
      wait (1'b0);
      id_1 <= 1;
    end
  end
  tri1 id_2;
  assign id_2 = 1;
  wor   id_3;
  wire  id_4;
  uwire id_5 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wand id_4;
  module_0 modCall_1 ();
  assign modCall_1.type_7 = 0;
  id_5(
      .id_0(id_3[1])
  );
  assign id_3[1'b0] = 1;
  assign id_2 = 1;
  assign id_2 = id_4 & ~1 & (1'b0);
endmodule
