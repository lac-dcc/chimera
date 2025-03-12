// Seed: 564761868
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output uwire id_3,
    input wire id_4,
    input uwire id_5,
    input supply1 id_6,
    output uwire id_7,
    input wire id_8,
    output wire id_9,
    input tri id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13
);
  wire id_15 = id_6;
  supply0 id_16, id_17 = -1;
endmodule
module module_1 (
    output tri1 id_0,
    input tri1 id_1,
    output wor id_2,
    input tri0 id_3,
    input uwire id_4,
    output tri0 id_5,
    input tri1 id_6,
    output supply1 id_7
);
  assign id_7 = -1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_4,
      id_0,
      id_6,
      id_4,
      id_1,
      id_5,
      id_3,
      id_0,
      id_3,
      id_6,
      id_6,
      id_3
  );
  assign modCall_1.id_4 = 0;
  always @(posedge id_1 or posedge id_3) begin : LABEL_0
    assert (id_1 || -1 || id_3);
  end
endmodule
