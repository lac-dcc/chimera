// Seed: 154696969
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout tri0 id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = 1;
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2
  );
  wire ["" : -1 'b0] id_6;
  assign id_5 = id_1;
endmodule
module module_2 #(
    parameter id_4 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  inout wire id_3;
  inout tri id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  assign id_2 = -1'b0;
  logic [-1 'h0 : id_4] id_5;
  ;
endmodule
