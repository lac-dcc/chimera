// Seed: 678391328
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wire id_2,
    input tri1 id_3,
    input wand id_4,
    input wand id_5,
    output uwire id_6,
    output wire id_7
);
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output logic id_2,
    output wor id_3,
    output wire id_4,
    input wand id_5,
    output logic id_6
);
  assign id_2 = id_1;
  always @(id_1 or -1) begin : LABEL_0
    if (1'd0 ** 1) id_2 <= id_5;
  end
  parameter id_8 = 1;
  localparam id_9 = id_8;
  assign id_6 = ~id_9 == id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_5,
      id_5,
      id_3,
      id_3
  );
  parameter id_10 = id_8;
  always @(posedge 1 or negedge |id_8) id_6 <= 1'd0;
endmodule
