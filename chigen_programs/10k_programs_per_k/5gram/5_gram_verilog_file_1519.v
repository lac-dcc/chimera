// Seed: 1648309223
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input uwire id_2
);
  wire id_4 = id_4;
endmodule
module module_0 (
    input  tri1  id_0,
    output tri0  module_1,
    output wor   id_2,
    inout  uwire id_3
);
  wire id_5, id_6, id_7, id_8;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output tri1 id_0,
    output logic id_1,
    input wor id_2,
    output wire id_3,
    input wire id_4,
    output uwire id_5,
    output supply1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    input tri1 id_9,
    output logic id_10,
    input tri0 id_11,
    output logic id_12,
    input wand id_13,
    input wor id_14
);
  always @(posedge 1 or posedge 1) begin : LABEL_0
    fork
      begin : LABEL_1
        id_12 <= id_14 ==? id_11;
        id_1 = id_12++ == id_7;
        $signed(49);
        ;
        if (1 & 1) id_10 <= 1;
      end
    join
  end
  module_0 modCall_1 (
      id_13,
      id_11,
      id_4
  );
endmodule
