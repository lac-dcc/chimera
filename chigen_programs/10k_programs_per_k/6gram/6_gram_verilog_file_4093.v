// Seed: 1461033393
module module_0 (
    output tri  id_0,
    output wand id_1
);
  wire id_3;
  assign module_1.id_3 = 0;
  always @(negedge id_3) force id_3 = id_3;
endmodule
module module_1 #(
    parameter id_1 = 32'd19
) (
    output supply0 id_0,
    input supply1 _id_1
    , id_5,
    input tri0 id_2,
    output tri0 id_3
);
  wire id_6;
  ;
  generate
    if (-1)
      if ((1)) begin : LABEL_0
        logic [7:0] id_7;
        supply1 \id_8 = id_2 ? id_5 == id_7 : id_1;
        assign id_7[-1 : id_1] = id_5;
      end else begin : LABEL_1
        always @(1 or posedge id_5) id_5 = #1 -1'b0;
      end
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_3
  );
endmodule
