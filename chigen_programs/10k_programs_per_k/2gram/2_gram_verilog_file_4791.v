// Seed: 3216049129
module module_0 (
    input  wand  id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    output logic id_3
    , id_6,
    output tri0  id_4
);
  always @(posedge 1 or 1) id_3 <= 1'h0;
endmodule
module module_1 #(
    parameter id_10 = 32'd64,
    parameter id_3  = 32'd35,
    parameter id_5  = 32'd38
) (
    input supply0 id_0,
    output wire id_1,
    output logic id_2,
    input tri0 _id_3,
    output wire id_4,
    input wand _id_5,
    output tri id_6,
    input supply1 id_7,
    output tri0 id_8
);
  wire [id_3 : 1] _id_10;
  always begin : LABEL_0
    assign id_2[id_5[id_10]] = id_10;
    if (1) begin : LABEL_1
      `define pp_11 0
      id_2 = #1 `pp_11;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_7,
      id_7,
      id_2,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
