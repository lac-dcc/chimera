// Seed: 3952497823
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0] id_8;
  assign id_8[1'h0==1] = 1;
  integer id_9 (
      .id_0(1),
      .id_1(1),
      .id_2((1'b0)),
      .id_3(id_2),
      .id_4(1'b0),
      .id_5()
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
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_7(
      .id_0(1), .id_1(id_5)
  );
  module_0 modCall_1 (
      id_1,
      id_3,
      id_6,
      id_3,
      id_6,
      id_1,
      id_5
  );
endmodule
