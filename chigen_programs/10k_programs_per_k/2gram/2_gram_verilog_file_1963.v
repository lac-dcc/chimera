// Seed: 1712021571
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input supply0 id_7,
    input wire id_8,
    input supply0 id_9,
    input tri0 id_10
);
  assign module_1.id_1 = 0;
  wire id_12;
endmodule
module module_1 #(
    parameter id_3 = 32'd47,
    parameter id_4 = 32'd70
) (
    output tri0 id_0,
    input  tri1 id_1
);
  if (1) defparam id_3.id_4 = 1;
  else begin : LABEL_0
    wor id_5 = 1;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
