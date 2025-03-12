// Seed: 2255329752
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  assign module_2.id_2 = 0;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  input wire id_1;
  assign id_2 = id_1;
endmodule
module module_2 (
    output logic id_0,
    input  tri0  id_1,
    input  tri   id_2
);
  logic id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  always_comb id_0 = #id_6 -1;
  assign id_4 = -1;
endmodule
module module_3 #(
    parameter id_3 = 32'd51
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  output wire id_2;
  inout wire id_1;
  wire [id_3 : -1] id_4;
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
