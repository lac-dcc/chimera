// Seed: 3604740475
module module_0 #(
    parameter id_6 = 32'd12,
    parameter id_7 = 32'd48
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_6.id_7 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5,
      id_5,
      id_5
  );
  always #1 begin : LABEL_0
    id_4 <= id_4;
  end
endmodule
