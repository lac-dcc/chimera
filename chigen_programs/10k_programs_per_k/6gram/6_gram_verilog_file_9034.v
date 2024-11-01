// Seed: 2855774866
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  module_0();
  assign id_2 = id_4;
  wire id_5;
  id_6(
      .id_0(1'b0), .id_1(), .id_2(id_1), .id_3(1)
  );
endmodule
module module_2 (
    output tri id_0,
    output tri id_1
);
  assign id_1 = 1'b0;
  module_0();
  always @(!(1'b0) == 1) begin
    assume (id_3 == 1);
  end
endmodule
