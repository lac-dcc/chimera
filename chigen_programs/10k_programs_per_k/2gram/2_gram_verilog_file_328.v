// Seed: 3829881511
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
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1 ? 1 : 1;
  always begin : LABEL_0
    id_5 = id_3;
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd59,
    parameter id_9  = 32'd44
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  bufif1 primCall (id_5, id_6, id_4);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_2,
      id_1,
      id_4,
      id_4,
      id_6
  );
  wire id_7;
  wire id_8;
  defparam id_9.id_10 = id_5;
endmodule
