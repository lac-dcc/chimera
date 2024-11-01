// Seed: 3065229475
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input supply0 id_2,
    input wand id_3,
    input wire id_4
);
  always @(posedge id_4 or posedge 1) id_1 = id_2;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output tri id_2,
    output uwire id_3,
    output supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    input wand id_7,
    input logic id_8,
    output supply1 id_9,
    input uwire id_10,
    output logic id_11,
    output wand id_12
);
  always @(posedge id_10) begin
    if (1'b0) begin
      $display(id_7);
      if (1) #1 release id_3;
    end else if (1) begin
      id_11 <= (id_8);
    end
  end
  module_0(
      id_0, id_9, id_1, id_5, id_1
  );
endmodule
