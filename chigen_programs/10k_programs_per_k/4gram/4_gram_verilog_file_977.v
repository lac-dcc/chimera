// Seed: 3300698616
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_6 = 32'd81
) (
    output logic id_0,
    input  wire  id_1,
    input  wire  id_2,
    input  wand  id_3
);
  wire id_5;
  always @(1) begin : LABEL_0
    id_0 = id_5;
    id_0 <= id_2;
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
  assign id_0 = id_5;
  _id_6 :
  assert property (@(posedge -1'b0) 1'b0)
  else $signed(31);
  ;
  localparam id_7 = 1;
  wire [1 : id_6] id_8;
endmodule
