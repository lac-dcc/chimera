// Seed: 2321824323
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri0 id_4
);
  logic id_6;
  ;
  localparam id_7 = 1;
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input wire id_2
);
  wand id_4 = id_0 - 1'b0 ? id_1 : id_2 ? id_1 : id_2 ? 1 : id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_3 = 0;
  wire id_5;
  ;
endmodule
module module_2 (
    input supply0 id_0,
    input tri1 id_1,
    input tri id_2,
    input tri0 id_3,
    input wire id_4,
    input uwire id_5,
    input uwire id_6,
    output uwire id_7
);
  assign id_7 = id_3;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6
  );
endmodule
