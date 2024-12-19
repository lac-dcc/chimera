// Seed: 3549472938
module module_0;
  assign module_2.type_7 = 0;
  assign module_1.id_4   = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    if (id_4 + 1) begin : LABEL_0
      id_3 = (1'b0);
    end else id_5(id_4 || 1, ~(id_3));
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri id_0,
    input tri id_1
);
  wire id_3;
  wire id_4, id_5;
  wire id_6;
  module_0 modCall_1 ();
  assign id_6 = 1;
  assign id_6 = 1'b0;
endmodule
