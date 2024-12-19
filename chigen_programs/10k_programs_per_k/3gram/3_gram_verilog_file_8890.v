// Seed: 1147657258
module module_0;
  id_1(
      .id_0(id_2), .id_1(1), .id_2(1)
  );
  assign module_2.id_6 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 ();
  assign id_3 = 1'b0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  initial begin : LABEL_0
    id_6 = 1;
  end
  wire id_7;
  wire id_8 = id_6;
  module_0 modCall_1 ();
endmodule
