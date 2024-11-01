// Seed: 3274635733
module module_0 (
    input wand id_0,
    output tri id_1,
    input wand id_2,
    input supply0 id_3,
    input uwire id_4,
    output uwire id_5,
    input supply0 id_6,
    input tri1 id_7,
    input wire id_8,
    output tri0 id_9,
    output supply0 id_10,
    output tri1 id_11,
    input wire id_12,
    input tri1 id_13,
    input wire id_14,
    output uwire id_15,
    input uwire id_16,
    input wire id_17,
    output uwire id_18
    , id_23,
    input uwire id_19,
    input tri id_20,
    input wire id_21
);
  id_24(
      .id_0(id_12), .id_1(), .id_2(id_1), .id_3(id_10), .id_4(1), .id_5(1), .id_6(1), .id_7(id_17)
  );
  wand id_25 = 1'd0;
endmodule
module module_1 (
    input tri id_0,
    output tri1 id_1,
    output wand id_2,
    input supply1 id_3,
    output logic id_4,
    input wand id_5,
    output wire id_6
);
  always @(posedge 1) begin
    id_6 = 1'b0;
    #1 id_4 <= 1;
  end
  module_0(
      id_3,
      id_1,
      id_5,
      id_0,
      id_5,
      id_2,
      id_5,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_3,
      id_6,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3
  );
endmodule
