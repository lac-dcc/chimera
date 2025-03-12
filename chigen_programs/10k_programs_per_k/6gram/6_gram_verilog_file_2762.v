// Seed: 3486857734
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input wand id_2,
    output wire id_3,
    output supply0 id_4,
    output uwire id_5
);
  wire id_7;
  ;
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd24
) (
    output tri0 id_0,
    output uwire id_1,
    input supply1 id_2,
    output tri id_3,
    output tri0 id_4,
    output tri _id_5,
    output wor id_6,
    input tri1 id_7
);
  wire id_9, id_10;
  wire id_11;
  ;
  assign id_0 = id_2;
  logic id_12;
  ;
  logic [id_5 : id_5] id_13;
  ;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_7,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_3 = 0;
  always @(negedge id_9) begin : LABEL_0
    id_13 = "";
  end
endmodule
