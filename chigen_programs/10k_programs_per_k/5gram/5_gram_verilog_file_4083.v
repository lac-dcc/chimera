// Seed: 1107803104
module module_0 (
    output tri1 id_0,
    output wand id_1,
    output uwire id_2,
    input supply0 id_3,
    input tri0 id_4,
    input wire id_5,
    input wire id_6,
    input wire id_7,
    input tri0 id_8,
    input wor id_9
);
  assign id_0 = id_9 && id_8 - 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input wor id_2,
    output logic id_3,
    output tri1 id_4
);
  generate
    for (id_6 = 1'b0; $realtime; id_6 = -id_2) begin : LABEL_0
      always @(posedge id_0 or posedge -1) begin : LABEL_1
        id_3 <= id_1;
      end
    end
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1
  );
endmodule
