// Seed: 2300269803
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(*) begin
    fork
      id_4;
    join
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0(
      id_2, id_2, id_2
  );
  wire id_4;
  logic [7:0] id_5 = id_1;
  wire id_6;
  id_8(
      .id_0(1'b0),
      .id_1(id_4),
      .id_2(id_5),
      .id_3(id_5[1] == module_1),
      .id_4(id_2),
      .id_5((1 ? id_4 : 1'b0) == id_3[1'h0]),
      .id_6(1),
      .id_7(""),
      .id_8(id_1),
      .id_9(1),
      .id_10(~$display),
      .id_11(id_5[1])
  );
endmodule
