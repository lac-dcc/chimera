// Seed: 1915111370
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input uwire id_2,
    output supply1 id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri0 module_0,
    output tri1 id_7,
    input wor id_8
);
endmodule
module module_1 (
    output wire id_0
    , id_5,
    input  tri  id_1,
    input  tri1 id_2,
    input  tri1 id_3
);
  genvar id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0,
      id_2
  );
endmodule
module module_2 (
    output logic id_0,
    output supply0 id_1,
    input tri id_2,
    output supply0 id_3,
    output logic id_4
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2
  );
  final begin : LABEL_0
    fork
      id_4 = 1;
    join
  end
  parameter id_6 = 1;
  always @(posedge -1 or posedge id_6) begin : LABEL_1
    id_0 <= id_2 - id_6 ? {-1} : id_2;
  end
  assign id_1 = id_6;
  assign id_4 = -1'b0;
endmodule
