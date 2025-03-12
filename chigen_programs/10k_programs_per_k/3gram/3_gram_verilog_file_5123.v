// Seed: 2760249425
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output reg id_1;
  always @(posedge 1 or posedge -1) id_1 = -1;
  always assign id_1 = id_2;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd76,
    parameter id_1 = 32'd69,
    parameter id_3 = 32'd18
) (
    output supply1 _id_0,
    output tri _id_1,
    input tri id_2,
    input supply1 _id_3,
    input tri0 id_4
);
  struct packed {
    logic [1 : id_1] id_6;
    logic [id_3 : id_3] id_7;
  } [1 : -1] id_8;
  bit id_9;
  ;
  always @(posedge id_3) begin : LABEL_0
    id_9 = id_8.id_6;
  end
  assign id_8.id_6 = id_3;
  id_10 :
  assert property (@(negedge -1) 1 ** id_9)
  else begin : LABEL_1
    $unsigned(68);
    ;
  end
  wire id_11;
  logic [-1 : 1 'b0 |  id_0] id_12;
  assign id_12 = id_11;
  module_0 modCall_1 (
      id_9,
      id_7
  );
  wire id_13;
endmodule
