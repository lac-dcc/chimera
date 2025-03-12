// Seed: 1006894292
module module_0 (
    output logic id_0,
    input wand id_1,
    input uwire id_2,
    input supply1 id_3,
    input wand id_4,
    output logic id_5,
    output supply1 id_6,
    output tri id_7
);
  initial begin : LABEL_0
    id_5 <= -1;
    id_0 <= (id_1 ? 1'b0 : id_4);
  end
  assign module_1.id_3 = 0;
  assign id_6 = 1;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output tri id_2,
    output uwire id_3,
    output wire id_4,
    output logic id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wire id_8,
    input wire id_9,
    input tri1 id_10,
    input uwire id_11,
    input uwire id_12,
    input tri0 id_13,
    input wand id_14,
    output supply0 id_15,
    input tri0 id_16,
    output tri id_17
);
  always @((id_13)) begin : LABEL_0
    if (1) id_5 <= -1;
  end
  module_0 modCall_1 (
      id_5,
      id_16,
      id_6,
      id_14,
      id_13,
      id_5,
      id_4,
      id_17
  );
endmodule
