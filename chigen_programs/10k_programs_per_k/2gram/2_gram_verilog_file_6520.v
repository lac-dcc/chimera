// Seed: 344642057
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    output wire id_2,
    input wor id_3,
    input wire id_4,
    input tri id_5,
    output supply1 id_6,
    input wand id_7,
    output wire id_8
);
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input logic id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri id_4,
    output logic id_5,
    output logic id_6,
    input wire id_7
);
  final begin : LABEL_0
    id_6 = id_0;
  end
  always
    if (id_3) id_5 <= 1;
    else begin : LABEL_0
      id_5 <= id_0(id_7, id_3, 1, 1);
    end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_2,
      id_3,
      id_4,
      id_1,
      id_2,
      id_1
  );
endmodule
