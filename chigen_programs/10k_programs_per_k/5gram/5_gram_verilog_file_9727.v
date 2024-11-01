// Seed: 3037678614
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wor  id_4;
  wire id_5;
  always @(negedge 1) release id_4;
  module_0(
      id_4, id_4, id_5
  );
  final $display(1'b0, 1'b0);
  always_comb @(posedge 1) begin
    if (id_1) id_2 <= id_4 !=? 1'b0;
    else begin
      id_2 <= id_4 + ~id_2;
      id_2 <= id_1;
    end
  end
endmodule
