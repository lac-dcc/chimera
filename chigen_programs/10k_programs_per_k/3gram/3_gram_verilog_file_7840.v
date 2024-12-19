// Seed: 3817599951
module module_0;
  wire id_1;
  wire id_2;
endmodule
module module_1;
  wire id_1;
  wire id_2;
  wire id_3;
  assign id_3 = id_2 | 1;
  module_0 modCall_1 ();
  wire id_4;
  wire id_5 = id_1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  wire id_6;
  assign id_1 = 1;
  tri1 id_7 = ~id_6 == 1'b0;
  module_0 modCall_1 ();
  id_8(
      .id_0(1), .id_1(1'd0), .id_2(1), .id_3(1)
  );
  assign id_2 = 1 + id_1;
endmodule
