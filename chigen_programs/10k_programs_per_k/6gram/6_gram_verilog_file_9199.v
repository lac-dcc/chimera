// Seed: 28976906
module module_0;
  always @(negedge 1 & id_1) begin
    deassign id_1;
  end
  id_2(
      .id_0(1'h0), .id_1(id_1), .id_2(id_1)
  );
  initial begin
    wait (1'd0);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  logic [7:0] id_4;
  id_5(
      .id_0(id_4), .id_1(), .id_2(id_4[1]), .id_3(1)
  ); module_0();
endmodule
