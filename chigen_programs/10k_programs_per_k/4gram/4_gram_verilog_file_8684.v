// Seed: 1851207416
module module_0 ();
  wire id_1, id_2;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd19,
    parameter id_1 = 32'd40
) (
    input wor _id_0,
    input wire _id_1,
    output supply0 id_2,
    input wor id_3,
    output logic id_4
);
  logic id_6;
  assign id_4 = id_0;
  module_0 modCall_1 ();
  always @(id_6, -1, negedge id_6) begin : LABEL_0
    if (-1'b0) id_4 <= -1;
  end
  logic [id_0 : id_1] id_7, id_8;
  always @((id_6), negedge 1) begin : LABEL_1
    id_7 <= id_0;
    id_4 = #id_9 1;
  end
  wire [id_1 : -1] id_10;
endmodule
