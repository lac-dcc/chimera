// Seed: 2017426945
module module_0 (
    input uwire id_0,
    output tri id_1,
    input wor id_2,
    input supply0 id_3,
    input supply0 id_4,
    output supply1 id_5
);
  wire id_7;
endmodule
module module_1 (
    input  logic   id_0,
    output supply0 id_1,
    input  uwire   id_2,
    output logic   id_3,
    input  uwire   id_4
);
  logic id_6;
  if (id_2) begin : id_7
    wire id_8;
  end
  module_0(
      id_2, id_1, id_2, id_4, id_2, id_1
  );
  assign id_1 = id_4;
  always @(posedge id_4 or 1) begin
    #(id_2) @(1 ? 1 : id_4 & id_0 or 1) id_6 <= 1'b0;
  end
  id_9 :
  assert property (@(posedge 1) 1)
  else id_1 = 1;
  if (1'b0) begin : id_10
    tri0 id_11 = 1;
    assign id_6 = id_0;
    always #1 id_9 = id_11;
  end else if (id_6) begin
    wire id_12 = 1;
  end
  tri1 id_13 = 1;
  always @((1) or posedge id_2) forever id_3 <= 1'b0;
  timeunit 1ps;
endmodule
