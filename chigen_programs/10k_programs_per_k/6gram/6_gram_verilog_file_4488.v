// Seed: 1730602137
module module_0 (
    id_1,
    id_2,
    id_3,
    module_0
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always @(*) #1;
endmodule
module module_1 #(
    parameter id_7 = 32'd11
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout reg id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  wire _id_7;
  ;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_5
  );
  wire id_8;
  logic [1 : id_7] id_9;
  ;
  always @(posedge ~id_3[-1'd0]) begin : LABEL_0
    id_4 = #id_10  !id_7;
  end
endmodule
