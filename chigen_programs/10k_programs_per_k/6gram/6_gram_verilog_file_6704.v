// Seed: 2040584878
module module_0 #(
    parameter id_5 = 32'd35,
    parameter id_6 = 32'd14
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  input wire id_3;
  output logic [7:0] id_2;
  output logic [7:0] id_1;
  wire [1 : -1] _id_5;
  assign id_2[-1] = -1'b0;
  assign id_2[-1 : id_5==1] = id_5 << id_4[1];
  logic _id_6 = id_5 > id_4;
  assign module_1.id_2 = 0;
  wire [id_5 : 1] id_7;
  assign id_2 = id_5;
endmodule
module module_1 #(
    parameter id_0 = 32'd92
) (
    input  supply1 _id_0,
    output supply0 id_1,
    output supply1 id_2
);
  logic [7:0][1 'b0 : id_0] id_4;
  assign id_2 = id_4[id_0] != -1;
  supply0 id_5 = -1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
