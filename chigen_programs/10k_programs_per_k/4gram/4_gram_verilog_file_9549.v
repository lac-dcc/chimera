// Seed: 2749035676
module module_0 (
    input wor id_0,
    output supply0 id_1,
    output tri0 id_2,
    input wor id_3,
    output uwire id_4,
    input wire id_5,
    input uwire id_6,
    input tri id_7,
    output uwire id_8
);
  wire id_10;
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    output uwire id_3,
    output tri1 id_4,
    inout supply1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    output wire id_8
);
  wire id_10;
  assign id_1 = 1 != id_5;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_6,
      id_4,
      id_5,
      id_6,
      id_5,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
