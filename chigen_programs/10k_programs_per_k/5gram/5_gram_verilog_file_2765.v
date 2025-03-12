// Seed: 3934203346
module module_0 (
    input supply1 id_0,
    input supply0 id_1
);
  always_ff @(posedge -1 or id_0) #1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd39,
    parameter id_2 = 32'd14,
    parameter id_4 = 32'd10
) (
    input  tri1  _id_0,
    input  wor   id_1,
    input  tri   _id_2,
    input  uwire id_3,
    input  wire  _id_4,
    output tri1  id_5,
    output logic id_6
);
  always_latch @(negedge id_6++or(1)) id_6 = id_0;
  wire [-1  !==  id_4 : 1  ==  -1] id_8;
  wire id_9;
  wire [-1 'b0 : id_2  -  id_0] id_10;
  module_0 modCall_1 (
      id_1,
      id_3
  );
endmodule
