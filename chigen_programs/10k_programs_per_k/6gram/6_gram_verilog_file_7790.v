// Seed: 3392552063
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  module_2();
  always @(1) begin
    deassign id_7;
    assign id_3 = 1;
  end
endmodule
module module_1 ();
  assign id_1 = id_1;
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_1
  );
  assign id_1 = 1;
endmodule
module module_2;
  initial #1 force id_1 = 1;
endmodule
