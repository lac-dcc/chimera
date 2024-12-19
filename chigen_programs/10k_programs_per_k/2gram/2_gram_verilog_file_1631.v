// Seed: 3004687935
module module_0 ();
  id_1(
      .id_0(1), .id_1(id_2), .id_2(id_2), .id_3(1), .id_4(id_2), .id_5(id_3), .id_6(id_3), .id_7()
  );
  assign id_2 = 1;
  final #1;
  wire id_4;
  reg  id_5 = id_2;
  always begin : LABEL_0
    id_5 <= 1;
  end
endmodule
module module_1;
  assign id_1 = 1;
  module_0 modCall_1 ();
  wire id_3;
  always #1 begin : LABEL_0
    id_2 <= 1'd0;
  end
endmodule
