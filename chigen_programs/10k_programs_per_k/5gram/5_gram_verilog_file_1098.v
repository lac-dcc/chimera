// Seed: 510348376
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_3,
      id_3,
      id_3,
      id_2,
      id_2
  );
  initial begin : LABEL_0
    id_1[1!=1] = 1;
    id_4 <= 1;
  end
  id_8(
      .id_0(), .id_1(id_5), .id_2(1 - id_2), .id_3(id_3), .id_4(id_2), .id_5(1 - 1)
  );
  assign id_4 = 1 ? 1 : id_6;
endmodule
