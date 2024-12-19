// Seed: 3986837078
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_2
  );
  assign id_6[1] = id_5;
  wire id_7;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  always id_5 <= 1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge id_6 or posedge 1'b0) id_2 <= 1;
  assign id_7 = 1'b0;
  module_2 modCall_1 (
      id_4,
      id_3,
      id_6,
      id_1,
      id_2
  );
endmodule
