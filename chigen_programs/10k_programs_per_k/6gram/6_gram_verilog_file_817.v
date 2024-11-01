// Seed: 2395765736
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    input wor id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri id_5,
    output wor id_6,
    output wor id_7
);
  uwire id_9;
  wor   id_10 = 1;
  always @(negedge id_2 - 1) begin
    $display;
  end
  assign id_9 = id_10;
endmodule
module module_1 (
    input  logic id_0,
    input  tri1  id_1,
    output uwire id_2,
    input  wand  id_3,
    input  tri1  id_4,
    input  logic id_5,
    input  wor   id_6,
    output logic id_7
);
  assign id_7 = 1 ? id_0 : id_5;
  module_0(
      id_2, id_2, id_4, id_1, id_6, id_4, id_2, id_2
  );
  always @(negedge 1) begin
    id_7 <= 1 + 1;
  end
endmodule
