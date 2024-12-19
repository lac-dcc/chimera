// Seed: 3956622294
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always id_5 = 1'h0;
  wire id_6;
  wire id_7;
endmodule
module module_1;
  wire id_1, id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3
  );
endmodule
module module_2 ();
  genvar id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_2;
  wire id_3;
endmodule
module module_3 (
    output supply1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri id_4,
    output tri id_5
);
  assign id_0 = id_4;
endmodule
module module_4 (
    output supply1 id_0,
    input tri id_1,
    input tri0 id_2,
    input uwire id_3,
    input wor id_4,
    input wor id_5,
    output supply1 id_6,
    input tri1 id_7,
    input wor id_8,
    output supply0 id_9,
    output supply0 id_10,
    output supply0 id_11,
    input tri0 id_12,
    input tri0 id_13,
    output uwire id_14
);
  assign id_6 = id_1;
  nor primCall (id_0, id_5, id_1, id_7, id_13, id_12, id_8, id_3);
  module_3 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_6,
      id_4,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
