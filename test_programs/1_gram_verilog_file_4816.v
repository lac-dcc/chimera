// Seed: 1166595184
module module_0 ();
  wire id_1;
  parameter id_2 = 1'h0;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_1[-1'd0 : 1] <= id_3;
  end
  assign id_4 = id_5[1'b0];
  module_0 modCall_1 ();
endmodule
module module_2;
  id_1(
      .id_0(-1), .id_1(id_2[1 : 1])
  );
  module_0 modCall_1 ();
endmodule
