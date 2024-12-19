// Seed: 1042001916
module module_0 #(
    parameter id_16 = 32'd90,
    parameter id_17 = 32'd95
) (
    input supply0 id_0
    , id_12,
    output wor id_1,
    input wor id_2,
    output supply0 id_3,
    input wor id_4,
    input wor id_5,
    output wire id_6,
    input tri0 id_7,
    input wand id_8,
    input wor id_9,
    input tri0 id_10
);
  tri0 id_13, id_14;
  always
    if (id_12) begin : LABEL_0
      id_3 = 1'd0;
    end
  tri0 id_15 = 1;
  defparam id_16.id_17 = (id_14);
  assign id_1 = id_2 - "";
  wire id_18, id_19;
  assign id_12 = 1;
endmodule
module module_1 (
    output wand id_0,
    input  wand id_1,
    output tri0 id_2,
    input  tri  id_3
);
  always deassign id_0;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_0,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.type_20 = 0;
endmodule
