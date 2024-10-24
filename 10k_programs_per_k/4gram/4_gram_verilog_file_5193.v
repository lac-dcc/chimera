// Seed: 328427438
module module_0 (
    input id_0,
    input id_1,
    input id_2,
    input id_3,
    inout reg id_4
);
  always @(*) begin
    if (id_0) begin
      id_4 = 1;
    end else id_4 <= id_4;
  end
  assign id_4 = 1;
  logic id_5;
  type_12 id_7 (
      .id_0(id_0),
      .id_1(id_2),
      .id_2(1'b0 - 1'b0),
      .id_3(),
      .id_4({id_1{~id_0}}),
      .id_5(id_5),
      .id_6('b0)
  );
  defparam id_8.id_9 = id_2;
endmodule
