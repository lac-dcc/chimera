// Seed: 1717377085
module module_0 (
    input  tri1  id_0,
    output logic id_1,
    input  wor   id_2,
    input  uwire id_3
);
  assign module_1.id_7 = 0;
  always_ff @(posedge -1) id_1 <= 1'h0;
  initial begin : LABEL_0
    id_1 = id_2;
  end
  always @(posedge -1);
endmodule
module module_1 #(
    parameter id_6 = 32'd19
) (
    output logic id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_3
  );
  wire _id_6;
  id_7 :
  assert property (@(negedge id_4 < 1) 1)
  else id_0 <= 1;
  logic [7:0] id_8;
  wire [id_6 : -1  -  1 'b0] id_9;
  assign id_8[-1] = -1'b0;
endmodule
