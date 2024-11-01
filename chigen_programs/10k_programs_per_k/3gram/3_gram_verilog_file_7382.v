// Seed: 273734117
module module_0 (
    output wor id_0,
    output tri id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri id_4,
    output wand id_5
);
  wire id_7, id_8;
endmodule
module module_1 (
    input  wand  id_0,
    input  logic id_1,
    input  tri0  id_2,
    input  logic id_3,
    output logic id_4,
    output uwire id_5,
    input  tri   id_6
);
  logic id_8;
  assign id_8 = id_3;
  reg id_9 = 1;
  always
    case (1)
      !id_1: begin
        id_4 <= ~1;
      end
      id_8: begin
        if (id_3) assign id_8 = 1;
      end
      default:
      if (1) begin
        id_4 <= id_1;
      end else id_9 <= id_6 ? 1 : id_8;
    endcase
  module_0(
      id_5, id_5, id_0, id_0, id_6, id_5
  );
endmodule
