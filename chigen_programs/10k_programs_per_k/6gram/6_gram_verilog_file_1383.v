// Seed: 582020575
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_2.id_7 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri1 id_1,
    output wor  id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_6 = id_10[1];
    assert (id_6);
    id_1 = 1;
  end
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_3,
      id_12
  );
  id_14(
      .id_0(1), .id_1(1), .id_2(id_7 !== id_8), .id_3(1), .id_4(1 == 1)
  );
endmodule
