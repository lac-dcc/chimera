// Seed: 28394333
module module_0 (
    input tri1 id_0,
    output wire id_1,
    input supply0 id_2,
    output wire id_3,
    input supply1 id_4,
    output uwire id_5,
    input wand id_6,
    output tri0 id_7,
    input tri0 id_8,
    output tri id_9,
    input tri0 id_10,
    output wand id_11,
    output wire id_12
);
  wire id_14;
endmodule
module module_1 (
    output logic id_0,
    inout wand id_1,
    input wand id_2,
    input tri id_3,
    input wand id_4,
    input wand id_5,
    output logic id_6,
    input wire id_7,
    input wor id_8,
    input supply1 id_9
);
  always_ff @(id_3 or posedge id_2) begin : LABEL_0
    id_0 <= -1'b0;
  end
  always @(1'b0 or negedge id_3) id_6 = id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_5,
      id_1,
      id_5,
      id_1,
      id_7,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
