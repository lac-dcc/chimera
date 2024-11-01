// Seed: 3978948435
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    input tri id_6,
    input supply0 id_7,
    input uwire id_8,
    output supply0 id_9,
    input wor id_10,
    output tri0 id_11,
    input tri id_12,
    input supply1 id_13,
    input tri0 id_14
);
  wire id_16;
  wire id_17;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    input wand id_2,
    input wire id_3,
    input supply0 id_4,
    output logic id_5,
    input wand id_6,
    output logic id_7,
    input wor id_8,
    input tri0 id_9,
    output logic id_10,
    output wand id_11,
    output wire id_12,
    input uwire id_13,
    output uwire id_14,
    input supply0 id_15,
    output logic id_16,
    input logic id_17
);
  assign id_5 = ~1;
  module_0(
      id_14,
      id_2,
      id_6,
      id_14,
      id_2,
      id_13,
      id_4,
      id_13,
      id_6,
      id_11,
      id_2,
      id_11,
      id_15,
      id_2,
      id_4
  );
  always
    case (1)
      ($display(
          id_9, id_3
      )): begin
        id_5 <= 1;
      end
      1: id_10 <= 1'b0;
      1'b0 && 1: begin
        id_16 += 1;
      end
      default: id_16 <= id_17;
    endcase
  supply0 id_19;
  assign id_19 = {id_2, id_2};
  assign id_7  = 1 - id_17 | id_4;
  assign id_7  = id_17;
  wire id_20;
endmodule
