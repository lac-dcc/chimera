// Seed: 2761397097
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
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always_comb
  fork
  join
  always_latch @(posedge 1)
    if (id_7) begin : LABEL_0
      id_2 = 1 && ~1;
      id_3 = 1;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_5(
      .id_0(1),
      .id_1(1'b0 - 1),
      .id_2(id_3),
      .id_3(id_3),
      .id_4(),
      .id_5(""),
      .id_6(id_4#(.id_7(1'b0)) [1'b0+:1]),
      .id_8(1)
  );
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_1
  );
endmodule
