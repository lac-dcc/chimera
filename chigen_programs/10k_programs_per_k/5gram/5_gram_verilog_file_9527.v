// Seed: 3165063114
module module_0;
  reg id_0;
  reg id_1;
  always @(negedge id_0) begin
    if (id_1) begin
      id_0 <= id_1;
      id_1 <= id_0;
    end else {id_1, 1} <= 1'b0;
  end
  logic id_2;
  type_11 id_3 (
      .id_0(1),
      .id_1(id_4),
      .id_2(1'h0),
      .id_3(id_1),
      .id_4(),
      .id_5(1),
      .id_6(1),
      .id_7(id_1)
  );
  defparam id_5.id_6 = id_2;
  logic id_7;
  assign id_4 = 1;
  assign id_4 = 1;
endmodule
