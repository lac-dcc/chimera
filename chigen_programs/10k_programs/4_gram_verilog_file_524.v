// Seed: 1293239777
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri id_4, id_5 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  module_0(
      id_4, id_4, id_5
  );
  wire id_6;
  assign id_2[1] = {1'd0, 1'd0};
  always @(posedge 1 or posedge 1) begin
    deassign id_2;
    #1;
  end
endmodule
