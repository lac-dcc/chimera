// Seed: 621372217
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    output logic id_2
);
  always @(posedge (id_0)) if (1'b0) id_1 = 1;
  logic id_4;
  always @(negedge id_0) begin
    $display(1);
    id_2 <= id_4;
  end
  assign id_1 = id_0;
  assign id_2 = id_4 ? id_4 : 1;
  id_5(
      .id_0(id_2), .id_1(1)
  );
  wire id_6;
endmodule
module module_1 (
    input wand id_0,
    output wand id_1,
    output logic id_2,
    input logic id_3,
    input supply1 id_4,
    input supply0 id_5
);
  always @(posedge 1 or posedge id_4) begin
    id_2 <= id_3;
  end
  module_0(
      id_4, id_1, id_2
  );
  wire id_7;
endmodule
