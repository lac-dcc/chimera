// Seed: 2345478039
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1;
  logic [1 : {  1 'h0 +  1  ,  1  }] id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign id_1 = id_1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_3,
      id_6,
      id_1,
      id_4
  );
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  assign id_2[1] = id_1 + id_1 && 1'h0;
endmodule
