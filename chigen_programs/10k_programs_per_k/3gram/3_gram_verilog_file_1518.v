// Seed: 1440137477
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input wire id_2,
    input supply0 id_3,
    output supply0 id_4
);
  localparam id_6 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output wire id_0,
    inout wor id_1,
    output supply1 id_2,
    output uwire id_3,
    output supply0 id_4,
    input tri0 id_5,
    output tri0 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_6
  );
endmodule
module module_2 #(
    parameter id_5 = 32'd23
) (
    input tri0 id_0,
    input tri0 id_1,
    input wor id_2,
    output uwire id_3,
    input wand id_4,
    input tri _id_5,
    output supply0 id_6,
    input supply0 id_7,
    output uwire id_8
);
  logic [1 : id_5] id_10;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_10 = id_4;
endmodule
