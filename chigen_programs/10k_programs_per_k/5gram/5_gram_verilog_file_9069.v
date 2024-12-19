// Seed: 2373707837
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd49,
    parameter id_8 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
  wire id_6;
  defparam id_7.id_8 = id_1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always #(1) begin : LABEL_0
    id_1 <= id_3;
  end
  module_0 modCall_1 (
      id_5,
      id_2,
      id_2
  );
endmodule
