// Seed: 4154214541
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_5(
      .id_0(1), .id_1(1'b0), .min(1), .id_2()
  );
  tri id_6 = 1;
  assign id_1 = 1'h0;
  tri id_7;
  id_8 :
  assert property (@(negedge id_6) 1)
  else $display({1, 1 + id_7});
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  logic [7:0] id_3;
  module_0(
      id_1, id_1, id_2, id_1
  );
  wire id_4;
  assign id_4 = id_3[(1)];
endmodule
