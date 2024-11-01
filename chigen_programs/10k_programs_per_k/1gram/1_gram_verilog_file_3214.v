// Seed: 128742029
module module_0 (
    input  tri   id_0,
    input  wor   id_1,
    output tri0  id_2,
    output tri   id_3,
    output uwire id_4,
    input  tri1  id_5,
    output wor   id_6,
    output tri   id_7,
    input  tri   id_8
);
  always id_6 = 1;
  wire id_10;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input supply1 id_2,
    input supply1 id_3,
    input logic id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    output logic id_8,
    output logic id_9,
    output uwire id_10,
    output tri0 id_11,
    input wor id_12,
    output tri1 id_13
);
  assign id_8 = 1 != id_7;
  module_0(
      id_3, id_12, id_1, id_11, id_13, id_2, id_13, id_13, id_12
  );
  always_ff
    if (id_4 ? id_12 : 1) begin
      if ("") begin
        cover (1) begin
          id_8 <= |id_5;
          if (1'b0) id_8 <= id_4;
        end
        begin
          @(posedge id_4 or posedge 1) id_8 <= 1;
        end
      end
      casez (id_6)
        id_7:
        forever
        if (id_5) begin : id_15
          id_9 <= 1;
          begin
            id_8 <= 1 * id_0;
          end
        end
      endcase
    end
endmodule
