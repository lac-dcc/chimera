// Seed: 1511532809
module module_0 #(
    parameter id_7 = 32'd32
) (
    output supply1 id_0,
    input supply0 id_1,
    output tri id_2,
    input tri id_3,
    input wor id_4
    , id_6, _id_7
);
  wire [-1 : id_7] id_8;
  wire id_9;
  module_2 modCall_1 (
      id_9,
      id_6,
      id_6,
      id_6
  );
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
  logic id_5;
  ;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  assign id_5 = id_2;
endmodule
