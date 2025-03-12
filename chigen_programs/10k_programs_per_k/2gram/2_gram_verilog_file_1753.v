// Seed: 663633139
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5
  );
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_2 #(
    parameter id_2 = 32'd23,
    parameter id_3 = 32'd42
) (
    id_1
);
  inout logic [7:0] id_1;
  assign id_1[1'h0] = id_1;
  wire _id_2;
  wire [-1 : id_2] _id_3;
  wire [id_3 : -1  ?  1 : id_3] id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
endmodule
