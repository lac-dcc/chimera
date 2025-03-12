// Seed: 1927400837
module module_0 (
    input wor id_0,
    output wor id_1,
    input supply0 id_2,
    input wor module_0,
    output tri1 id_4,
    output wand id_5,
    input supply0 id_6,
    output wor id_7,
    input uwire id_8,
    output supply1 id_9,
    output supply0 id_10,
    input supply0 id_11
);
  wire id_13;
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output logic id_3,
    input supply1 id_4,
    output uwire id_5,
    input wand id_6,
    input wire id_7,
    input wire id_8
);
  bit id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_8,
      id_5,
      id_5,
      id_6,
      id_5,
      id_1,
      id_5,
      id_0,
      id_2
  );
  assign modCall_1.id_11 = 0;
  always @(posedge id_10) id_10 = id_2;
  assign id_0 = 1;
  wire id_11 = id_2;
  always @(posedge -1 or negedge 1) id_3 = -1'h0;
  initial begin : LABEL_0
    id_10 = id_11 && id_2;
  end
  assign id_10 = -1;
  always_ff @(1 or posedge id_8) $unsigned(75);
  ;
endmodule
