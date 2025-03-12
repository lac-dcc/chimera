// Seed: 1066564818
module module_0;
  logic [7:0] id_1;
  ;
  wire id_2;
  bit  id_3;
  assign id_2 = id_1;
  always @(posedge id_2 or posedge id_1) id_3 = id_3 - id_1[-1];
  wire id_4, id_5, id_6;
  parameter id_7 = 1;
  wire id_8;
  assign module_1.id_4 = 0;
  logic id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd87,
    parameter id_7  = 32'd12
) (
    output logic id_0,
    output logic id_1,
    output tri1 id_2,
    output tri1 id_3,
    output logic id_4,
    output supply1 id_5,
    input tri id_6,
    input supply0 _id_7
);
  always @(posedge -1) id_4 <= -1;
  assign id_2 = id_6;
  module_0 modCall_1 ();
  logic [7:0] id_9, _id_10;
  always @(id_6 or -1) begin : LABEL_0
    #(id_10) begin : LABEL_1
      id_1 = id_9[id_10 : id_7];
    end
  end
  always @(*) id_0 <= -1'd0;
endmodule
