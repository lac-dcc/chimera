// Seed: 3282154939
module module_0 (
    input  supply1 id_0,
    output logic   id_1
);
  always id_1 = #(id_0) id_0;
  wire  id_3;
  logic id_4 [-1 : 1 'b0];
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd26
) (
    input wor id_0,
    input uwire id_1,
    input supply1 _id_2,
    output tri id_3,
    input wor id_4,
    output logic id_5
);
  wire [id_2 : -1] id_7;
  always @(posedge 1 or posedge 1) begin : LABEL_0
    id_5 <= id_7;
  end
  logic id_8;
  localparam id_9 = id_8++;
  parameter id_10 = id_9;
  module_0 modCall_1 (
      id_0,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
