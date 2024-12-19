// Seed: 2807324414
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    input tri id_4,
    input tri id_5,
    output wire id_6
);
  supply0 id_8;
  assign module_1.type_1 = 0;
  for (id_9 = id_8; 1; id_8 = id_8) begin : LABEL_0
    assign id_9 = 1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    output supply0 id_3
);
  supply0 id_5 = id_2;
  final $display(id_1);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5,
      id_5,
      id_0,
      id_1,
      id_3
  );
  wire id_6;
endmodule
