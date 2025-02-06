// Seed: 2513290915
module module_0 #(
    parameter id_1 = 32'd5,
    parameter id_2 = 32'd17
);
  defparam id_1.id_2 = $realtime;
  wire id_3 = id_2;
  id_4(
      .id_0(id_3), .id_1(id_2), .id_2(-1), .id_3($realtime), .id_4(), .id_5(id_3)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_7(
      .id_0($realtime)
  ); specify
    (id_8 + => id_9) = ($realtime | $realtime : -1  : -1, id_5[$realtime] : id_3  : 1'b0);
  endspecify
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
