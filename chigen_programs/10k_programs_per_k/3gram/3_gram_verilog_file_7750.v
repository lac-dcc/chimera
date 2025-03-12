// Seed: 2610821840
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    output supply0 id_3,
    input wor id_4
);
  wire id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_11 = 32'd97,
    parameter id_7  = 32'd54
) (
    output supply0 id_0,
    output wand id_1,
    input tri0 id_2,
    output logic id_3,
    input wand id_4
);
  parameter id_6 = 1;
  wire _id_7;
  always_comb @(id_2 ? {id_2, id_7} : 1 or id_7) begin : LABEL_0
    id_3 = 1 & id_4;
  end
  logic id_8, id_9;
  supply1 ["" : id_7] id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_0,
      id_4
  );
  assign id_3 = id_4;
  logic [-1 : -1] _id_11;
  assign id_10 = id_7 & 1;
  wire id_12;
  ;
  logic [{  -1 'b0 &  -1 'h0 ,  -1  }  +  id_11 : -1] id_13;
endmodule
