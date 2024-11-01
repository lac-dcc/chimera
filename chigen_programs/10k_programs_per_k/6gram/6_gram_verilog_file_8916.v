// Seed: 1214215978
module module_0 (
    output wor   id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  uwire id_3,
    input  wire  id_4,
    output uwire id_5,
    output tri0  id_6,
    input  tri1  id_7,
    input  wor   id_8,
    output uwire id_9
);
  wire id_11;
  wire id_12;
  always @(posedge 1'b0 or posedge id_8) begin
    id_5 = 1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input logic id_5,
    input supply1 id_6,
    input tri0 id_7,
    output logic id_8,
    output wire id_9
);
  assign id_3 = id_2 ? id_7 : id_5 ? 1'b0 - id_5 : 1 - id_6;
  module_0(
      id_1, id_6, id_6, id_7, id_6, id_0, id_1, id_2, id_2, id_1
  );
  wire id_11;
  assign id_0 = id_6 ? "" > 1 : id_2;
  initial begin
    id_8 <= id_5;
    $display(id_5);
  end
endmodule
