// Seed: 1442670451
module module_0 (
    output id_0,
    input tri1 id_1,
    input id_2
);
  always @(negedge (id_2[1'b0]) - 1) begin
    id_0 = id_1[1+1];
  end
  type_5 id_3 (
      .id_0(1),
      .id_1(1),
      .id_2(id_0)
  );
endmodule
