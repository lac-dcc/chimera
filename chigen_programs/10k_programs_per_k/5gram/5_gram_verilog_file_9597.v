// Seed: 3504547650
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_10;
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
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  module_0(
      id_1, id_2, id_5, id_1, id_7, id_1, id_2, id_2, id_1
  );
  initial begin
    id_3 <= 1;
  end
  wire id_8;
  assign id_8 = {1, 1 == id_7};
  id_9(
      .id_0(id_6),
      .id_1(1'd0),
      .id_2({id_7, id_2 == 1}),
      .id_3(1),
      .id_4(1'h0),
      .id_5(1'd0),
      .id_6(id_2 < 1 & id_1 != 1),
      .id_7(id_4),
      .id_8(id_5),
      .id_9(id_8),
      .id_10(id_8),
      .id_11(1'b0 - 1'd0)
  );
endmodule
