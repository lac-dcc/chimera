// Seed: 2088138707
module module_0;
  wire id_1;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wand id_2,
    output wire id_3,
    output wand id_4,
    input tri id_5,
    output uwire id_6,
    input uwire id_7,
    output supply1 id_8,
    input supply1 id_9,
    input tri id_10
);
  module_0 modCall_1 ();
endmodule
module module_2;
  reg id_1;
  for (id_2 = 1'b0; 1; id_2 = id_2) begin : LABEL_0
    reg id_3;
    assign id_3 = 1 - 1;
    assign id_1 = id_1;
    always_latch begin : LABEL_0
      id_3 = id_1;
      id_1 = 1;
      id_3 = #1 id_1;
    end
    uwire id_4 = ~id_4;
  end
  module_0 modCall_1 ();
  wire id_5;
endmodule
