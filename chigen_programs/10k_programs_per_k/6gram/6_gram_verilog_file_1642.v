// Seed: 3115661311
module module_0 (
    input wand id_0,
    output wire id_1,
    output uwire id_2,
    input tri0 id_3,
    input supply1 id_4,
    output supply1 id_5,
    output supply1 id_6,
    input tri id_7,
    input wor id_8,
    input uwire id_9,
    input wand id_10,
    input supply1 id_11,
    input wire id_12,
    output wire id_13,
    input wand id_14,
    output supply0 id_15,
    output supply1 id_16,
    input tri id_17,
    output uwire id_18
);
  wire id_20 = id_9;
  assign id_18 = 1;
  assign id_20 = id_10;
endmodule
module module_1 (
    output logic id_0,
    output wire  id_1,
    input  logic id_2,
    output logic id_3,
    input  wand  id_4,
    output tri   id_5
);
  always @(posedge 1 or negedge 1'd0) begin
    if (id_4 || id_2 || 1) #0 id_3 <= #id_4 id_2;
    else id_0 <= 1;
  end
  module_0(
      id_4,
      id_5,
      id_1,
      id_4,
      id_4,
      id_1,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_5,
      id_5,
      id_4,
      id_5
  );
endmodule
