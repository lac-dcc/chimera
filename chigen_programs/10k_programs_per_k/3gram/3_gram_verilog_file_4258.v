// Seed: 2483559981
module module_0 (
    input  tri1 id_0,
    input  wor  id_1,
    output tri  id_2
);
  uwire id_4 = 1, id_5;
  wire  id_6;
  wire  id_7;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    output logic id_4,
    output tri0 id_5,
    input wand id_6,
    output tri1 id_7,
    input supply1 id_8,
    output supply0 id_9,
    input wand id_10,
    input supply0 id_11
    , id_26,
    output logic id_12,
    input logic id_13
    , id_27,
    input wire id_14,
    output logic id_15,
    output wire id_16,
    input tri1 id_17,
    output uwire id_18,
    input wand id_19,
    input logic id_20,
    input supply1 id_21,
    input tri0 id_22,
    output uwire id_23,
    input logic id_24
);
  always @(1) id_15 <= id_20;
  module_0(
      id_0, id_11, id_9
  );
  logic id_28 = 1'b0;
  final begin
    if (id_11)
      case (1)
        id_26 + id_21, 1'b0, id_13: begin
          if (1) begin
            id_28 <= 1;
          end else id_28 = 1;
          id_4 <= 1;
        end
        id_28: begin
          #1;
        end
      endcase
    id_12 <= id_24;
  end
endmodule
