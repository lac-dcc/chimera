// Seed: 2215078977
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wand id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5 = -1'b0;
  always @(posedge -1) begin : LABEL_0
    @(posedge 1);
  end
endmodule
module module_1 #(
    parameter id_5 = 32'd3,
    parameter id_8 = 32'd85,
    parameter id_9 = 32'd6
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    _id_8,
    _id_9
);
  input wire _id_9;
  output wire _id_8;
  output wire id_7;
  inout wire id_6;
  input wire _id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_4,
      id_1
  );
  inout wire id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  assign id_3 = 1;
  assign id_2[id_9] = id_3 ? id_1 : -1 && -1'h0;
  logic [id_5 : id_8] id_10;
  ;
  initial
    #1 begin : LABEL_0
      assume ({-1{1}});
    end
endmodule
