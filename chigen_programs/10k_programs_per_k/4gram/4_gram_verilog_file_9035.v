// Seed: 1584231376
module module_0 (
    output tri0 id_0,
    input wire id_1,
    output supply1 id_2
);
  wire id_4;
  module_2 modCall_1 (
      id_1,
      id_2
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input logic id_1,
    input supply1 id_2,
    output logic id_3,
    output tri0 id_4,
    input tri id_5,
    output logic id_6,
    output tri1 id_7
);
  always @(posedge id_5 or 1)
    if (id_5) id_3 <= #id_1 1;
    else id_6 <= id_1;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input  tri   id_0,
    output uwire id_1
);
endmodule
