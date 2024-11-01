// Seed: 1592405885
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input wire id_2,
    input supply0 id_3,
    input uwire id_4,
    output uwire id_5,
    input wand id_6,
    input tri0 id_7,
    input tri0 id_8,
    input supply1 id_9,
    output tri0 id_10
    , id_17,
    output tri0 id_11,
    output tri1 id_12,
    input tri0 id_13,
    input uwire id_14,
    output wire id_15
);
  wire id_18;
  id_19(
      .id_0(1), .id_1(id_2), .id_2(id_11), .id_3(id_3), .id_4(1), .id_5(1'b0), .id_6(id_17)
  );
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    input  logic id_2,
    output wand  id_3,
    output logic id_4,
    output tri1  id_5,
    input  tri0  id_6,
    output wand  id_7
);
  assign id_7 = 1;
  assign id_4 = id_2;
  always_comb @(*) begin
    case (1)
      id_2: id_0 = id_2;
      1'b0 & id_6: id_4 = 1;
      default: begin
        id_1 <= ("" > 1);
      end
    endcase
  end
  module_0(
      id_6, id_6, id_6, id_6, id_6, id_3, id_6, id_6, id_6, id_6, id_3, id_7, id_5, id_6, id_6, id_5
  );
  assign id_5 = 1;
  reg id_9;
  always @* id_0 <= id_9;
endmodule
