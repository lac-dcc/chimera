// Seed: 119615551
module module_0 (
    input wand id_0,
    output wor id_1,
    output tri id_2,
    input uwire id_3,
    input supply1 id_4,
    output tri1 id_5,
    input supply1 id_6,
    input wand id_7,
    input tri0 id_8,
    output tri id_9,
    output tri0 id_10
);
  assign id_1  = id_6 == id_0 ? -1 : 1 ? id_7 : id_3;
  assign id_10 = -1;
endmodule
module module_1 (
    output wor id_0,
    output wire id_1,
    output logic id_2,
    input supply1 id_3,
    input tri id_4,
    input wand id_5,
    input wire id_6,
    output wire id_7,
    output wire id_8
);
  assign id_0 = -1'b0;
  wire id_10;
  real id_11;
  ;
  always @(negedge 1 or posedge -id_3) begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1,
      id_6,
      id_6,
      id_1,
      id_5,
      id_5,
      id_3,
      id_7,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
