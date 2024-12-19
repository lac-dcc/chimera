// Seed: 4118921695
module module_0 (
    input wire id_0,
    output uwire id_1,
    input wor id_2,
    input uwire id_3,
    input tri id_4
    , id_15,
    input supply1 id_5,
    input tri id_6,
    input tri0 id_7,
    input uwire id_8,
    input wor id_9,
    input supply0 id_10,
    output tri0 id_11,
    input supply0 id_12,
    output wor id_13
);
endmodule
module module_1 (
    input wire id_0,
    output logic id_1,
    output logic id_2,
    output wor id_3,
    input supply1 id_4,
    input wor id_5,
    input tri1 id_6,
    input tri1 id_7,
    input uwire id_8,
    input supply0 id_9,
    input tri0 id_10
);
  always @(posedge 1) begin : LABEL_0
    if (1) id_2 = #(1) 1;
    else id_1 = #(1 == id_6  : 1  : 1) 1;
  end
  xor primCall (id_3, id_0, id_4, id_9, id_8, id_6, id_10, id_5, id_7);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_7,
      id_9,
      id_7,
      id_6,
      id_10,
      id_8,
      id_0,
      id_10,
      id_10,
      id_3,
      id_6,
      id_3
  );
  assign modCall_1.type_0 = 0;
endmodule
