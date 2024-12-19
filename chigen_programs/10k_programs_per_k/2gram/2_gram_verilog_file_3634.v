// Seed: 2750082154
module module_0 (
    id_1
);
  inout wire id_1;
  initial begin : LABEL_0
    id_1 = 1'b0;
  end
  wire id_2;
  module_2 modCall_1 ();
  wire id_3 = id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
  module_0 modCall_1 (id_3);
endmodule
module module_2;
  uwire id_1;
  id_2(
      .id_0(~id_1 ^ id_1), .id_1(1), .id_2(1), .id_3(1), .id_4(1), .id_5(1'b0), .id_6(id_1)
  );
  wire id_3;
  wire id_4 = id_3;
  assign id_3 = id_4;
endmodule
