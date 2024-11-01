// Seed: 1593808517
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_4 = 1;
  module_2();
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    input supply1 id_2,
    input wand id_3
);
  wire id_5;
  module_0(
      id_5, id_5, id_5
  );
endmodule
module module_2 ();
  assign id_1 = 1;
endmodule
module module_3 (
    input  logic id_0,
    output logic id_1,
    input  logic id_2,
    output logic id_3,
    input  logic id_4
);
  assign id_1 = id_2;
  always @(1 or posedge id_0) begin
    if (1) id_1 <= #1{1'b0, id_4};
  end
  always_ff @(*) begin
    id_3 <= 1;
    if (id_0) id_1 <= 1;
    else id_1 <= id_0;
  end
  module_2();
  assign id_1 = id_4;
endmodule
