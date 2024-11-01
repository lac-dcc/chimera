// Seed: 2290554820
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output uwire id_2,
    output logic id_3,
    output tri id_4,
    input wand id_5
);
  initial id_3 <= 1'b0;
  assign id_4 = 1;
  timeprecision 1ps;
endmodule
module module_1 (
    input  uwire id_0,
    input  logic id_1,
    input  uwire id_2,
    output tri0  id_3
);
  integer id_5, id_6;
  assign id_3 = (|id_0);
  always @(1'b0) begin
    id_5 = id_1;
    id_3 = id_0 == 1;
    id_6 <= id_1;
  end
  module_0(
      id_2, id_0, id_3, id_6, id_3, id_2
  );
endmodule
