// Seed: 1845784763
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    output tri   id_2
);
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output tri id_2,
    output tri0 id_3
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_2 = -1 || id_0;
  wire id_5;
  wire id_6;
  assign id_2 = id_6;
  wire id_7;
  wire [-1 : -1] id_8;
endmodule
module module_2 (
    output tri0 id_0,
    input tri0 id_1,
    output uwire id_2,
    input supply1 id_3,
    input supply0 id_4
);
  reg  id_6;
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
  wire id_8;
  ;
  always @(posedge "") id_6 = (-1) - 1;
endmodule
