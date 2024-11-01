// Seed: 2709465325
module module_0 (
    input  uwire id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    output tri1  id_3,
    output tri0  id_4,
    input  wire  id_5,
    input  wire  id_6,
    input  wand  id_7,
    input  tri   id_8
);
  wire id_10;
  wire id_11;
  tri0 id_12 = id_7;
endmodule
module module_1 (
    input wor id_0
    , id_12,
    input supply1 id_1,
    output logic id_2,
    input wor id_3,
    input wand id_4,
    output logic id_5,
    output wor id_6,
    input supply1 id_7,
    input tri0 id_8,
    output logic id_9,
    output wor id_10
);
  tri0 id_13;
  module_0(
      id_0, id_7, id_8, id_13, id_10, id_13, id_7, id_13, id_4
  );
  initial begin
    if (1) begin
      id_9 <= !id_13;
    end else if (1)
      case (id_12)
        1'd0: id_9 <= id_12;
        1: begin
          #1 id_5 = 1;
        end
        default: id_13 = id_3;
      endcase
    else id_5 <= 1'b0;
    id_2 <= id_12;
  end
endmodule
