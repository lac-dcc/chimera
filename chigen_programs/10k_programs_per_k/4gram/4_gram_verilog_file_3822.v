// Seed: 2922805318
module module_0 #(
    parameter id_1 = 32'd17,
    parameter id_2 = 32'd23
);
  wire _id_1;
  ;
  wire ["" : id_1] _id_2;
  wire [~  id_2 : -1] id_3;
  always @(id_1, posedge id_3)
    #id_4 begin : LABEL_0
      id_4 = -1;
    end
  assign module_1.id_4 = 0;
  wire [1 : 1] id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_4 = 32'd43
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  module_0 modCall_1 ();
  assign id_2 = 1 && 1 ? id_4 : id_2;
  assign id_1[-1] = 1;
  logic [id_4 : 1] id_5;
  parameter id_6 = -1 | 1;
  always @(negedge 1 & id_3) id_5 += id_4;
endmodule
