// Seed: 1706415451
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  specify
    specparam id_4 = id_4;
    (negedge id_5 => (id_6 +: 1)) = (1, id_5);
    (id_7 => id_8) = 1;
    specparam id_9 = 'b0;
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = 'd0;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.id_6 = 0;
  id_5 :
  assert property (@(posedge id_5 == id_1) 1)
  else $display;
  id_6(
      .id_0(1), .id_1(id_7), .id_2(id_3)
  );
  assign id_2 = id_6;
endmodule
