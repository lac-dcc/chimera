// Seed: 122336461
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input tri0 id_2,
    input wire id_3,
    input wire id_4,
    input supply0 id_5
);
  wire [-1 : 1] id_7;
  localparam id_8 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd49,
    parameter id_4 = 32'd21
) (
    input supply1 _id_0,
    output supply0 id_1,
    input supply1 id_2,
    input wand id_3,
    input supply1 _id_4,
    input supply0 id_5
);
  if (1) begin : LABEL_0
    wire [id_0  ==  id_4 : id_0] id_7;
  end else begin : LABEL_1
    assign id_1 = id_3;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
