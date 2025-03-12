// Seed: 569149478
module automatic module_0 #(
    parameter id_6 = 32'd0
) (
    output wor id_0,
    input  wor id_1
);
  union packed {
    logic id_3;
    id_4  id_5;
  } _id_6;
  localparam id_7[id_6 : -1] = 1 || 1;
  assign id_0 = {id_6.id_5{id_6.id_4[""]}};
  id_8(
      -1, id_6.id_3[-1 :-1] == ""
  );
endmodule
module module_1 (
    input  tri0 id_0[-1 : 1],
    output tri0 id_1,
    input  wand id_2
);
  wire [-1 : -1] id_4, id_5, id_6, id_7, id_8;
  wire id_9, id_10, id_11;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
