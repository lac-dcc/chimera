// Seed: 1444321461
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_7 = 1'h0;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  reg id_3, id_4;
  assign id_4 = id_3 == 1'b0;
  module_0();
  always id_4 <= 1;
  id_5 :
  assert property (@(1) id_5) begin
    id_2 <= id_4;
  end
  wire id_6 = "" + id_4;
endmodule
