// Seed: 487412120
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  assign module_1._id_0 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd87,
    parameter id_3 = 32'd6
) (
    input uwire _id_0,
    input supply0 id_1,
    input wire id_2,
    input tri0 _id_3,
    output logic id_4,
    input tri id_5,
    input wand id_6,
    input supply0 id_7,
    input tri1 id_8,
    output tri id_9
);
  bit [-1 : 1] id_11;
  wire [id_3  -  -1 'd0 : id_0] id_12;
  always @(1'b0 or negedge id_7) begin : LABEL_0
    id_11 = id_5;
    id_4  = #id_13 -1 == id_6;
  end
  module_0 modCall_1 (
      id_12,
      id_12
  );
endmodule
