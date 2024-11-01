// Seed: 926635645
module module_0 (
    input  tri0 id_0,
    input  wor  id_1,
    input  tri1 id_2,
    output wand id_3
);
  tri0 id_5 = 1;
  reg  id_6;
  always begin
    id_6 <= 1'd0;
  end
  assign id_3 = id_2;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output uwire id_6,
    input supply1 id_7,
    output supply0 id_8,
    inout uwire id_9,
    input tri id_10,
    input wor id_11,
    input wand id_12,
    input supply0 id_13,
    input wor id_14,
    input logic id_15,
    input wand id_16,
    input supply1 id_17
);
  always begin
    #1
    @(posedge id_15) begin : id_19
      id_19 <= ~id_13 ? 1 : id_14 ==? 1;
    end
  end
  module_0(
      id_4, id_16, id_17, id_9
  );
endmodule
