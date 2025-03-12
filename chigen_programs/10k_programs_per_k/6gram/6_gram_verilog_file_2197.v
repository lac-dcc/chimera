// Seed: 2258355303
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply0 id_8 = 1;
  assign id_4 = id_5;
  assign id_6 = id_2;
endmodule
module module_1 #(
    parameter id_1 = 32'd25
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_2,
      id_4,
      id_3,
      id_4
  );
  inout wire id_3;
  inout wire id_2;
  output wire _id_1;
  and primCall (id_4, id_3, id_2);
  logic [id_1 : 1] id_5;
  ;
endmodule
