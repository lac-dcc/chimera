// Seed: 535285717
module module_0 ();
  wire id_1;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd63,
    parameter id_8 = 32'd49
) (
    input supply1 id_0,
    output wand id_1,
    input wor id_2,
    output tri0 id_3,
    input tri0 _id_4,
    output wire id_5,
    input tri1 id_6,
    output logic id_7,
    input tri0 _id_8
);
  always begin : LABEL_0
    id_7 = 1'b0;
    id_7 <= id_4;
  end
  logic id_10;
  always id_10 = id_2;
  logic [id_8 : id_4] id_11;
  module_0 modCall_1 ();
  wire id_12[-1 'b0];
  xnor primCall (id_1, id_10, id_11, id_2, id_6);
endmodule
