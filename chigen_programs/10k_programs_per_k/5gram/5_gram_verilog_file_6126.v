// Seed: 3700190469
module module_0;
  assign id_1 = 1;
  tri0 id_2;
  assign module_2.id_0 = 0;
  generate
    if (1) begin : LABEL_0
      assign id_2 = 1'b0;
      if (id_1) begin : LABEL_0
        initial begin : LABEL_0
          id_2 = id_1;
        end
      end else begin : LABEL_0
        wire id_3;
      end
    end
  endgenerate
endmodule
module module_1 ();
  wire id_2;
  module_0 modCall_1 ();
  integer id_3;
endmodule
module module_2 (
    output wand id_0
    , id_4,
    input  wor  id_1,
    input  tri0 id_2
);
  assign id_4 = ~id_2 + 1;
  module_0 modCall_1 ();
  assign id_0 = id_4 || id_2;
  tri id_5 = 1;
endmodule
