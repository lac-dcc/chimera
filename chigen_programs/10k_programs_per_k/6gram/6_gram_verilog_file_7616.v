// Seed: 1168457549
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    for (id_5 = id_1; 1; id_1 = id_2) begin
      id_6(
          .id_0(id_2),
          .id_1(id_2),
          .id_2(1),
          .id_3(id_1),
          .id_4(""),
          .id_5(1),
          .id_6(1),
          .id_7(1),
          .id_8(id_3),
          .id_9(1)
      );
    end
  endgenerate
endmodule
module module_1 (
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
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge ~id_10) begin
    fork
      id_13;
      id_14;
    join
    if (id_13)
      assert (id_13);
      else id_2 <= 1;
  end
  module_0(
      id_7, id_7, id_4, id_10
  );
endmodule
