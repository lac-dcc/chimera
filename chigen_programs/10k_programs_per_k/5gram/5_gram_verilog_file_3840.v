// Seed: 2713113987
module module_0 (
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
  input wire id_5;
  assign module_1.id_12 = 0;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd2,
    parameter id_9 = 32'd31
) (
    input tri1 id_0,
    input wire _id_1,
    input wand id_2,
    output wire id_3,
    output tri1 id_4,
    input supply0 id_5,
    output tri0 id_6,
    output supply0 id_7,
    input uwire id_8,
    input wire _id_9
);
  logic [7:0] id_11;
  always @(1, posedge id_0 == 1) begin : LABEL_0
    id_11[id_1>=id_9] <= id_1;
  end
  id_12 :
  assert property (@(posedge 1'b0) 1)
  else $unsigned(2);
  ;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12
  );
endmodule
