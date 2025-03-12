// Seed: 731560236
module module_0 (
    input uwire id_0,
    input wire id_1,
    input supply1 id_2,
    output uwire id_3,
    output tri id_4
);
  assign id_4 = id_1;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input tri1 id_2,
    input wire id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    output wire id_7,
    input wor id_8,
    input tri0 id_9,
    output logic id_10,
    input wire id_11,
    input uwire id_12,
    output supply0 id_13
);
  wire id_15;
  ;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_13,
      id_13
  );
  assign modCall_1.id_4 = 0;
  always @(negedge id_5 + 1) begin : LABEL_0
    id_10 = new[-1 == (id_2 == id_6)];
    assert (-1'd0);
  end
endmodule
