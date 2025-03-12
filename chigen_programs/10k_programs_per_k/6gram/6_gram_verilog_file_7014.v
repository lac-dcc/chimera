// Seed: 4101201944
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input tri0 id_4
    , id_16,
    output tri0 id_5,
    output supply1 id_6,
    input wire id_7,
    output tri id_8,
    output tri1 id_9,
    input tri id_10,
    input supply1 id_11,
    input tri id_12,
    input uwire id_13,
    output uwire id_14
);
  integer [-1 'b0 > "" : 1 'b0] id_17 = id_11;
  logic id_18;
  assign module_1.id_6 = 0;
  always @(-1, posedge id_10) begin : LABEL_0
    disable id_19;
  end
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    output logic id_2,
    input wor id_3,
    output tri0 id_4,
    input uwire id_5,
    output tri1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    input wand id_9,
    output tri id_10
);
  always @(*) begin : LABEL_0
    id_2 <= id_5;
  end
  module_0 modCall_1 (
      id_0,
      id_6,
      id_7,
      id_1,
      id_7,
      id_1,
      id_10,
      id_8,
      id_10,
      id_10,
      id_3,
      id_8,
      id_9,
      id_3,
      id_4
  );
endmodule
