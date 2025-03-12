// Seed: 2141956902
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_7;
  assign id_1 = id_6;
  logic id_8;
  ;
  logic id_9;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd11
) (
    id_1[-1'b0 : ""],
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_4,
      id_7
  );
  output logic [7:0] id_1;
  or primCall (id_6, id_7, id_5, id_4);
  assign id_1 = id_4;
  wire id_8;
  assign id_4 = id_2;
  logic id_9;
  logic _id_10;
  ;
  assign id_4 = id_9[id_10];
endmodule
