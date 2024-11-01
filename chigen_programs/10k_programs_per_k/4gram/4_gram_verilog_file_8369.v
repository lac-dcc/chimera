// Seed: 3186176927
module module_0;
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1,
    input tri1 id_2,
    output wor id_3,
    input wor id_4,
    input uwire id_5,
    input tri1 id_6,
    output supply1 id_7,
    output wor id_8,
    output wor id_9,
    input supply0 id_10
);
  always_latch @(id_1 or posedge 1)
    if (1) begin
      id_0 <= 1;
    end
  tri id_12 = 1;
  module_0(); id_13(
      .id_0(1),
      .id_1(id_1 ** id_5),
      .id_2(id_6),
      .id_3(id_6),
      .id_4(id_7),
      .id_5(1),
      .id_6(1),
      .id_7(1)
  );
  assign {1, 1'd0, !id_1} = 1'b0;
  id_14 :
  assert property (@(posedge 1) id_1)
  else $display(id_14, 1'd0, (id_14 - 1));
  wire id_15;
  supply1 id_16 = 1;
endmodule
