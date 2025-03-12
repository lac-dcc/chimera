// Seed: 1653286235
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  assign id_1[1+-1] = id_2;
endmodule
module module_1 #(
    parameter id_6 = 32'd87,
    parameter id_8 = 32'd8
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  input wire id_7;
  inout wire _id_6;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1
  );
  inout wire id_5;
  output logic [7:0] id_4;
  output logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  wire _id_8 = id_6;
  assign id_3[1<-1'd0 : id_6-1] = ~id_7;
  assign id_4[id_8] = -1'b0;
  assign id_2 = id_6;
endmodule
