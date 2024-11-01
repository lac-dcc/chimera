// Seed: 1995108695
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input uwire id_2,
    output tri1 id_3,
    input tri id_4,
    output wand id_5,
    output uwire id_6,
    output wire id_7,
    input tri0 id_8,
    output wor id_9,
    input uwire id_10,
    input tri1 id_11,
    input tri0 id_12,
    input supply1 id_13
);
  assign id_6 = id_0 ? 1'b0 : id_13;
endmodule
module module_1 (
    input  uwire   id_0,
    output logic   id_1,
    output supply1 id_2
);
  always @(negedge 1 - 1'b0 or posedge id_0) begin
    id_1 <= 1'b0;
    fork
      id_4;
      id_5.id_6(id_0, 1'b0);
    join
  end
  wire id_7;
  wire id_8;
  wire id_9;
  module_0(
      id_0, id_0, id_0, id_2, id_0, id_2, id_2, id_2, id_0, id_2, id_0, id_0, id_0, id_0
  );
  assign id_1 = 1'd0;
endmodule
