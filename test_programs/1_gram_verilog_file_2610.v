// Seed: 4195416458
module module_0 ();
  always id_1 <= -1;
  wire id_2;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output tri1 id_2,
    input uwire id_3,
    input wor id_4,
    input supply1 id_5,
    output tri id_6,
    input wor id_7,
    output uwire id_8,
    output tri id_9
);
  module_0 modCall_1 ();
endmodule
module module_2 (
    input supply1 id_0,
    output supply1 id_1,
    output supply0 id_2,
    input logic id_3,
    output tri0 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input tri1 id_7,
    output tri1 id_8,
    input wor id_9,
    output tri0 id_10,
    input uwire id_11,
    input tri0 id_12,
    input uwire id_13,
    output tri1 id_14,
    input tri id_15,
    output tri1 id_16,
    output supply1 id_17,
    output logic id_18
);
  assign id_18 = id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_20, id_21;
  always_ff @(*) begin : LABEL_0
    begin : LABEL_0
      @(posedge id_11) $display("", 1 + 1);
    end
    id_18 <= 1'b0;
  end
  always id_1 = id_5;
  assign id_4 = {1{-1}};
  integer id_22 = 1;
endmodule
