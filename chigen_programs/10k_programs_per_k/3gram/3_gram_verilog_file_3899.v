// Seed: 3740591270
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_7 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd47
) (
    _id_1,
    id_2
);
  output wire id_2;
  input wire _id_1;
  wire [id_1 : -1] id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2
  );
endmodule
module module_2 #(
    parameter id_2 = 32'd77
) (
    input tri1 id_0,
    input supply1 id_1,
    input tri _id_2
);
  wire  id_4;
  logic id_5 [-1 : -1  +  id_2];
  ;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5
  );
endmodule
