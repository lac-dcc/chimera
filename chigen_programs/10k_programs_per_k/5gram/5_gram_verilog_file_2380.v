// Seed: 4016018211
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  assign module_1.id_13 = 0;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_9 :
  assert property (@(posedge (id_4)) id_8)
  else $signed(33);
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd71,
    parameter id_15 = 32'd95,
    parameter id_5  = 32'd69
) (
    input uwire id_0,
    output supply0 id_1,
    input tri id_2,
    input wand id_3,
    output logic id_4,
    input tri0 _id_5,
    output wire id_6,
    output wire id_7,
    input wand id_8,
    output logic id_9,
    input wor id_10,
    output wire _id_11,
    output supply1 id_12,
    input tri0 id_13,
    input supply1 id_14,
    input tri0 _id_15
);
  uwire [1 'h0 !=  id_15 : -1  ==  1] id_17 = -1;
  logic [id_5 : id_11] id_18 = id_14 > -1'b0;
  assign id_11 = id_2;
  wire id_19;
  always @(posedge id_2)
    if (1) begin : LABEL_0
      id_4 = id_18;
      id_9 = id_15;
    end else if (-1 == 1) assume (id_17);
  module_0 modCall_1 (
      id_19,
      id_18,
      id_19,
      id_18,
      id_17,
      id_18,
      id_17,
      id_19
  );
endmodule
