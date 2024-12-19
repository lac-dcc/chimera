// Seed: 1932065997
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_3,
      id_2
  );
  assign id_5 = 1;
endmodule
module module_2 #(
    parameter id_8 = 32'd55,
    parameter id_9 = 32'd70
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  initial begin : LABEL_0
  end
  defparam id_8.id_9 = id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_1
  );
endmodule
