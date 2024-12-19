// Seed: 3451644608
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  assign module_1.id_5 = 0;
  wire id_5, id_6;
  id_7(
      .id_0(id_2), .id_1()
  ); id_8(
      .id_0(1'b0), .id_1(id_5), .id_2(id_2), .id_3(id_6), .id_4(1), .id_5(1)
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
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wor id_7 = 1'd0;
  logic [7:0] id_8;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7
  );
  initial begin : LABEL_0
    id_8[1'b0] <= id_5;
    id_8 = (id_3);
  end
endmodule
