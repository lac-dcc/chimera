// Seed: 756062911
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_7(
      .id_0(id_1), .id_1(1), .id_2((id_6)), .id_3(1)
  );
  assign id_3 = id_6;
endmodule
module module_1 #(
    parameter id_13 = 32'd23,
    parameter id_14 = 32'd37
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11;
  xnor (id_10, id_2, id_6, id_3, id_1, id_11, id_5, id_4);
  module_0(
      id_1, id_3, id_1, id_9, id_4, id_3
  );
  wire id_12;
  defparam id_13.id_14 = 1;
endmodule
