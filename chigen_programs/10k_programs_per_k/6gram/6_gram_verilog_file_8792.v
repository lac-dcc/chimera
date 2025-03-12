// Seed: 2506783065
module module_0 (
    output tri id_0,
    output wand id_1,
    output supply0 id_2,
    input uwire id_3,
    input supply0 id_4,
    output uwire id_5,
    output wand id_6
);
  assign id_1 = 1'b0 - id_4 * id_4;
  assign module_1.id_4 = 0;
  reg id_8 = -1, id_9;
  always begin : LABEL_0
    cover (id_9);
    id_8 = 1;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd16
) (
    input supply0 _id_0,
    output tri1 id_1,
    input wor id_2,
    output supply0 id_3,
    output supply1 id_4,
    input wire id_5
);
  wire id_7;
  wire [id_0 : 1 'b0] id_8;
  wand id_9;
  assign id_9 = -1;
  always @* #1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_4,
      id_1
  );
endmodule
