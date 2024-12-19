// Seed: 649215052
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
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  wire id_2, id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2
  );
endmodule
module module_2 (
    output supply1 id_0,
    input supply1 id_1,
    output supply1 id_2,
    output tri id_3,
    output tri id_4,
    input uwire id_5,
    output wire id_6,
    input wor id_7
);
endmodule
module module_3 (
    output uwire id_0,
    input uwire id_1,
    input wire id_2,
    input uwire id_3,
    input supply1 id_4
);
  module_2 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_4
  );
  assign modCall_1.id_1 = 0;
  assign id_0 = id_4;
endmodule
