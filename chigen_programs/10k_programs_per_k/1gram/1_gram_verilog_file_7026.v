// Seed: 3197748040
module module_0;
  wire id_1, id_2, id_3, id_4;
  module_2 modCall_1 (id_3);
  assign modCall_1.id_1 = 0;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  inout supply0 id_1;
  assign id_1 = id_1 / 1;
  localparam id_2 = 1;
  assign module_3.id_3 = 0;
endmodule
module module_3 (
    input supply1 id_0,
    input supply1 id_1
);
  bit id_3;
  always begin : LABEL_0
    if (1) begin : LABEL_1
      return id_1 < id_0;
      id_3 = -1;
    end
    $signed(12);
    ;
  end
  assign id_3 = id_1;
  wire id_4, id_5;
  parameter id_6 = -1;
  module_2 modCall_1 (id_4);
endmodule
