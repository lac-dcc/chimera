// Seed: 1290054637
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri id_3,
    output uwire id_4,
    output uwire id_5,
    input wire id_6,
    output supply1 id_7,
    output tri id_8
);
  wire id_10;
endmodule
program module_1 (
    input supply0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input uwire id_4,
    output wire id_5,
    input uwire id_6,
    output logic id_7,
    input supply0 id_8,
    input wor id_9
);
  wire id_11;
  assign id_1 = 1'b0 | 1;
  xnor primCall (id_1, id_4, id_12, id_11, id_3, id_2, id_0, id_9, id_8, id_14, id_15, id_6, id_13);
  tri  id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  always @(negedge id_8 or posedge id_6) begin : LABEL_0
    id_7 <= {1, 1};
  end
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_5,
      id_1,
      id_5,
      id_0,
      id_5,
      id_1
  );
  assign modCall_1.id_8 = 0;
  wire id_16;
endprogram
