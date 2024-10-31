// Seed: 3667190299
module module_0;
  assign id_1 = 1;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0();
  supply1 id_5;
  always begin
    id_6(.id_0(1'b0), .id_1(1), .id_2(id_1), .id_3(id_1), .id_4(1'b0), .id_5(), .id_6());
    @(1'h0 or posedge 1'b0) $display(1'b0, -id_3(1, 1, id_5));
  end
  always
    if (1) id_1 = #1 1;
    else id_1 <= 1;
endmodule
