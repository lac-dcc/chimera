// Seed: 2326722302
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  assign module_2.id_6 = 0;
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_2 = 32'd72,
    parameter id_4 = 32'd48
) (
    output wire id_0,
    output wand id_1,
    input tri1 _id_2,
    input wor id_3,
    input tri0 _id_4,
    output logic id_5,
    input supply1 id_6,
    input supply1 id_7,
    output tri1 id_8
    , id_12,
    input wire id_9,
    output supply0 id_10
);
  logic [1 : 1] id_13, id_14;
  assign id_8 = 1;
  nor primCall (id_8, id_6, id_15, id_9, id_3, id_14, id_13, id_12, id_7);
  always_ff @(posedge -1 or posedge id_4 >> -1'd0) begin : LABEL_0
    id_5 <= 1 != id_6;
  end
  logic [id_4  -  1 'b0 : id_2] id_15;
  ;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_15
  );
endmodule
