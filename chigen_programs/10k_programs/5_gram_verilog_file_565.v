// Seed: 1346572409
module module_0 (
    input  logic id_0,
    output logic id_1,
    output tri0  id_2,
    output tri0  id_3,
    output wire  id_4,
    output logic id_5
);
  always_ff @(posedge id_0) begin
    id_5 <= id_0;
  end
  assign id_1 = (id_0);
  wire id_7;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    output logic id_2,
    output tri1 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wor id_7,
    input logic id_8,
    input wire id_9,
    input uwire id_10,
    output logic id_11
);
  always @(posedge ~id_1 or posedge id_7)
    if (1'b0 + 1'b0) begin
      id_11 <= 1;
      if (id_9) assert (id_5);
    end else id_2 <= id_8;
  assign id_11 = 1;
  module_0(
      id_8, id_11, id_3, id_0, id_0, id_11
  );
  always @(1'b0 or posedge id_10) id_3 = 1;
endmodule
