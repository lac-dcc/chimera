// Seed: 3343313517
module module_0 (
    id_1,
    id_2
);
  output uwire id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd99
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  struct packed {
    logic [-1 : id_1] id_5;
    logic ["" : -1]   id_6;
  } id_7;
  module_0 modCall_1 (
      id_4,
      id_2
  );
endmodule
module module_2 (
    input supply1 id_0,
    input supply1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
