// Seed: 3945674661
module module_0 (
    input tri id_0,
    input wand id_1,
    input tri1 id_2,
    input wand id_3,
    input supply0 id_4,
    output uwire id_5,
    input uwire id_6,
    input uwire id_7,
    input wire id_8,
    input uwire id_9,
    input supply0 id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    input wire id_14,
    input tri1 id_15,
    output wire id_16,
    output wand id_17,
    input wire id_18,
    output uwire id_19,
    output uwire id_20
);
  wire id_22;
  assign id_19 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output logic id_2,
    input tri0 id_3,
    input supply1 id_4,
    output wire id_5
    , id_8,
    output supply1 id_6
);
  module_0(
      id_1,
      id_0,
      id_4,
      id_0,
      id_3,
      id_6,
      id_1,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_3,
      id_4,
      id_5,
      id_6,
      id_3,
      id_6,
      id_6
  );
  always @(posedge 1) begin
    id_6 = 1 ? 1 : 1;
    id_6 = 1'b0;
    id_2 <= #1 1;
  end
endmodule
