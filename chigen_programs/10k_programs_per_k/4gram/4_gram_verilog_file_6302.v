// Seed: 2529541468
module module_0;
  wire id_1;
  wire id_3;
  wire id_4;
  wire id_5;
  assign id_1 = id_1;
endmodule
module module_1;
  wire id_1;
  wire id_5;
  wire id_6;
  assign id_4 = 1;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5[1==1'b0] = id_6;
  module_0();
  always_latch @(*) begin
    if (1) id_4 = id_6;
    else assign {id_6, 1, id_6, 1 + id_2, id_6} = 1;
  end
  always_latch id_6 <= 1'b0 - id_6;
endmodule
