// Seed: 1689844957
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input uwire id_2,
    output tri1 id_3
    , id_14,
    output tri1 id_4,
    input tri0 id_5,
    output uwire id_6,
    output uwire id_7
    , id_15,
    output wire id_8,
    input wire id_9,
    input wire id_10,
    input wand id_11,
    output uwire id_12
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    input tri id_2,
    output logic id_3
);
  always @(-1 or negedge 1'b0) begin : LABEL_0
    id_3 <= id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_2,
      id_1,
      id_1,
      id_0
  );
endmodule
