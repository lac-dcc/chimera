// Seed: 2936641092
module module_0 (
    output tri0 id_0,
    output wor  id_1,
    input  wor  id_2
);
  assign id_0 = -1;
  assign module_1._id_5 = 0;
  assign id_0 = id_2;
endmodule
module module_1 #(
    parameter id_5 = 32'd69
) (
    output tri0 id_0,
    output tri1 id_1,
    input  tri0 id_2,
    output tri1 id_3,
    input  tri  id_4,
    input  tri  _id_5,
    input  tri1 id_6,
    input  wor  id_7
);
  wire id_9 = id_9;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_6
  );
  logic id_10;
  ;
  logic id_11 = (id_9);
  if (1) reg [1 : (  id_5  )] id_12;
  else
    always_comb begin : LABEL_0
      @(*) if (1) id_12 = -1;
    end
  task id_13(output id_14, id_15);
    id_11[-1] <= -1;
    id_15 = 1;
  endtask
endmodule
