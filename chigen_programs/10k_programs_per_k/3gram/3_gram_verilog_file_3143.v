// Seed: 2020759973
module module_0 (
    output supply0 id_0,
    input tri id_1,
    input wor id_2,
    output tri0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input wire id_6,
    input tri id_7,
    output tri0 id_8,
    input uwire id_9
);
  wire id_11;
  wire id_12, id_13, id_14, id_15;
  always @(posedge id_13) begin : LABEL_0
    if (!1) assert (id_6);
  end
  always @(-1) $signed(52);
  ;
endmodule
module module_1 (
    input  tri1 id_0,
    output tri0 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
