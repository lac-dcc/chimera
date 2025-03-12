// Seed: 2648488515
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input tri1 id_2,
    input tri id_3,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    output uwire id_7,
    input tri id_8
);
  always @(1'd0 or negedge 1) $signed(21);
  ;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    output supply0 id_2,
    output tri id_3
);
  wire id_5;
  or primCall (id_2, id_6, id_5, id_0);
  assign id_3 = id_5;
  wire id_6;
  ;
  always @(posedge 1) begin : LABEL_0
    id_1 <= id_6;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
