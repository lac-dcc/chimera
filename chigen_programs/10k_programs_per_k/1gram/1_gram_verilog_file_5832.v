// Seed: 154401693
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_5, id_6 = 1, id_7;
  module_0(
      id_4, id_1
  );
  always id_6 <= #id_6 1;
  nand (id_1, id_4, id_7);
  always @(posedge 1 or negedge 1) begin
    id_6 <= id_5;
    do id_5 = 1; while (id_2);
  end
  if (id_6) begin
    wire id_8;
    assign id_7 = id_7;
  end else initial id_7 = id_2;
endmodule
