// Seed: 3994914649
module module_0 (
    output tri   id_0,
    output tri1  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output tri1  id_4,
    input  tri0  id_5,
    output wire  id_6
);
  wire id_8;
  wire id_9;
  id_10(
      .id_0(), .id_1(1), .id_2(1)
  );
endmodule
module module_1 (
    output tri id_0,
    output logic id_1,
    input logic id_2,
    input supply1 id_3,
    output logic id_4,
    input tri id_5
);
  assign id_4 = 1'b0 == id_3;
  module_0(
      id_0, id_0, id_3, id_3, id_0, id_3, id_0
  );
  always
    case (1)
      1'b0 == 1: id_0 = 'h0;
      1'b0: id_0 = 1 & id_5;
      1 !=? id_5: begin
        if (1) id_1 <= 1;
        else id_4 = id_2;
      end
      default: begin
        if (1'b0)
          if (1) id_1 = 1;
          else if (id_5) id_4 <= 1;
          else id_1 <= id_5 ? {1'b0, (id_5) == 1} : 1;
      end
    endcase
  wire id_7;
endmodule
