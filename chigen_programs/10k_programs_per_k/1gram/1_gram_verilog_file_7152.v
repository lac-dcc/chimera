// Seed: 3639616213
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input  uwire id_2,
    output wor   id_3,
    output wor   id_4,
    input  uwire id_5
);
  always
    cover (1) begin : LABEL_0
      id_4 = id_2;
      id_0 += id_2 >= id_2;
    end
  assign id_0 = id_5;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input uwire id_2,
    input tri id_3,
    output supply1 id_4,
    output wire id_5,
    inout logic id_6,
    input tri1 id_7,
    input uwire id_8,
    input tri1 id_9
);
  logic id_11 = id_6, id_12, id_13;
  assign id_4 = 1;
  always_ff begin : LABEL_0
    id_1 <= id_13;
    if (id_13) id_13 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_0,
      id_9
  );
endmodule
