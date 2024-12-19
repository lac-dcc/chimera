// Seed: 19555976
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge (id_7) <= 1, posedge id_8);
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd62,
    parameter id_5 = 32'd3
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  defparam id_4.id_5 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule
