// Seed: 1529397315
module module_0 (
    output wand id_0,
    output wand id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5
);
  assign id_1 = id_4;
endmodule
module module_1 #(
    parameter id_0 = 32'd63,
    parameter id_5 = 32'd82,
    parameter id_8 = 32'd38
) (
    input supply1 _id_0,
    input tri0 id_1,
    output supply0 id_2
);
  wire [1 : -1  ==  id_0] id_4;
  assign id_2 = id_4 ? -1'd0 : id_4;
  wire _id_5;
  logic [7:0] id_6;
  logic [7:0] id_7;
  wire _id_8;
  assign id_7[id_5] = -1;
  assign id_6[-1-:1+id_8] = 1'b0;
  id_9 :
  assert property (@(negedge id_8) id_0)
  else $signed(59);
  ;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
