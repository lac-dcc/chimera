// Seed: 2805706004
module module_0 #(
    parameter id_9 = 32'd20
) (
    output tri1 id_0,
    output tri id_1,
    input supply1 id_2,
    input tri0 id_3
);
  logic id_5;
  ;
  logic id_6;
  union packed {
    logic id_7;
    logic id_8;
  } _id_9;
  wire id_10;
  logic id_11;
  wire id_12;
  wire id_13, id_14[id_9 : -1];
  wire id_15 = id_11;
  assign id_9.id_8 = $realtime;
  logic id_16;
endmodule
module module_1 (
    input tri0 id_0,
    output wand id_1,
    output supply1 id_2,
    output tri1 id_3
);
  for (id_5 = id_0; -1'b0; id_5 += 1) begin : LABEL_0
    logic id_6;
  end
  logic id_7;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_9.id_8 = 0;
endmodule
