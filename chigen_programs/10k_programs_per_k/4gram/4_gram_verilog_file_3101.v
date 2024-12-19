// Seed: 1674382705
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  assign module_1.id_8 = 0;
  wire id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_8 = 32'd2,
    parameter id_9 = 32'd74
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  if (1) assign id_2 = 1'b0;
  else id_6(.id_0(1), .id_1(1), .id_2((id_5)), .id_3(id_4));
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_1
  );
  defparam id_8.id_9 = 1;
endmodule
