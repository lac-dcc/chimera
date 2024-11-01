// Seed: 201400693
module module_0;
  integer id_1 = 1;
  assign id_1 = id_1 || id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  always @(~id_1 or 1) for (id_2 = 1; 1; id_1 = 1) id_1 <= #1 1;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  reg id_3;
  always @(1'b0) begin
    id_3 <= 1 & 1 & 1 & 1'b0;
  end
  module_0();
  wire id_4;
  id_5(
      .id_0(id_2), .id_1(1), .id_2(1), .id_3(1'h0), .id_4(""), .id_5(id_3), .id_6(1), .id_7(1)
  );
  always @(posedge 1) begin
    assert (id_3);
  end
endmodule
