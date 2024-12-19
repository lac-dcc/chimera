// Seed: 555150071
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  reg id_3;
  initial begin : LABEL_0
    if (1) begin : LABEL_0
      id_3 = #1 1;
    end
  end
  assign id_2 = 1;
  module_2 modCall_1 ();
endmodule
module module_1 ();
  assign id_1 = 1 ? 1 : id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wire id_3;
endmodule
module module_2 ();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  module_2 modCall_1 ();
endmodule
