// Seed: 3517293282
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    output tri1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input tri0 id_5
    , id_27,
    input tri1 id_6,
    input wor id_7,
    input logic id_8,
    input tri1 id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri0 id_12,
    input uwire id_13,
    input tri1 id_14,
    input tri id_15,
    output logic id_16,
    output tri1 id_17,
    output supply1 id_18,
    input wire id_19,
    input supply1 id_20,
    input tri0 id_21,
    input supply0 id_22,
    output supply1 id_23,
    input wand id_24
    , id_28,
    output wor id_25
);
  logic [7:0] id_29;
  module_0(
      id_28, id_27, id_27, id_28, id_27
  );
  initial begin
    case ($display(
        id_6 !== id_13
    ))
      "" ==? 1'b0: id_16 = 1;
      1: id_29[1 : 1-(1)] = id_2;
      default: begin
        $display(1, 1, 1, 1'b0);
      end
    endcase
  end
  always @(id_6) id_16 = #1 id_8;
endmodule
