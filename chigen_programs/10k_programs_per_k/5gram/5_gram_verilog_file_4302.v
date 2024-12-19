// Seed: 809288408
module module_0;
  module_2 modCall_1 ();
  wire id_3, id_4, id_5, id_6, id_7, id_8, id_9;
endmodule
module module_1 #(
    parameter id_4 = 32'd32,
    parameter id_5 = 32'd29
) (
    input  tri1  id_0,
    output logic id_1
);
  generate
    always
    fork : SymbolIdentifier
      if (1) id_1 <= 1;
      id_3(id_0);
    join : SymbolIdentifier
  endgenerate
  defparam id_4.id_5 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 ();
  wire id_1;
  wire id_2;
  module_3 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2
  );
  wire id_3 = id_1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_8(
      .id_0(1), .id_1(id_6 !== 1)
  );
endmodule
