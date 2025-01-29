// Seed: 2407071339
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  module_2 modCall_1 ();
  assign modCall_1.id_2 = 0;
  wire id_4, id_5;
  localparam \id_6 = -1;
  parameter id_7 = \id_6 ;
endmodule
module module_1 ();
  wire id_1;
  wire id_2;
  assign id_1 = -1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
  id_3(
      .id_0(id_2), .id_1(id_1), .id_2(1), .id_3(-1'b0)
  );
endmodule
module module_2;
  assign id_1 = 1'h0;
  always id_1 <= 1;
  localparam id_3 = id_1 - id_2;
  assign id_1 = id_2;
endmodule
