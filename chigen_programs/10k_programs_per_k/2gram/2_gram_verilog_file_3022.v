// Seed: 2731864091
module module_0;
  wire id_1;
  wire id_2;
endmodule
module module_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_6 <= id_3;
  end
  reg id_7;
  assign id_5 = id_1;
  id_8(
      .id_0(1)
  );
  reg id_9;
  always begin : LABEL_0
    id_9 <= id_7;
    id_6 <= 1;
  end
  module_0 modCall_1 ();
  wire id_10;
  id_11(
      .id_0(1), .id_1(id_6), .id_2(1), .id_3(id_3)
  );
endmodule
