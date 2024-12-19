// Seed: 623302935
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1'b0;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1
  );
endmodule
module module_2;
  always_latch begin : LABEL_0
    if (1'b0)
      #1 begin : LABEL_0
        return id_1;
      end
  end
endmodule
module module_3 ();
  wire id_2, id_3, id_4, id_5, id_6;
  module_2 modCall_1 ();
endmodule
