// Seed: 34025066
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input wire id_5,
    input wire id_6,
    output wire id_7,
    output tri1 id_8
);
  wire id_10;
  ;
endmodule
module module_1 (
    output uwire id_0,
    output supply1 id_1,
    input wand id_2,
    output tri1 id_3,
    output supply1 id_4,
    input wand id_5,
    input tri1 id_6
);
  always @(posedge id_2 or posedge id_5) begin : LABEL_0
    fork
      id_8;
    join
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_2,
      id_5,
      id_2,
      id_5,
      id_1,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
