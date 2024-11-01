// Seed: 2896779459
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    input wand id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wire id_5,
    input supply1 id_6,
    input supply0 id_7,
    output wor id_8,
    output wand id_9,
    input wor id_10,
    output tri0 id_11,
    input uwire id_12,
    output wor id_13,
    output uwire id_14,
    output wor id_15
);
  wire id_17;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    output wor id_2,
    input wire id_3
    , id_6,
    input wand id_4
);
  reg id_7;
  reg id_8, id_9, id_10, id_11, id_12, id_13, id_14 = 1;
  always @(posedge id_3) begin
    id_8  <= id_7;
    id_13 <= id_7;
    #1 begin
      id_14 <= 1;
    end
    assume (1)
    else;
    id_8 <= 1;
    id_11 = id_13;
    if (1'b0) begin
      if (id_12)
        if (id_7) id_9 <= #1 1;
        else begin
          wait (1'b0);
        end
      else id_11 <= 1;
    end
  end
  module_0(
      id_2, id_3, id_4, id_3, id_4, id_0, id_3, id_4, id_2, id_2, id_4, id_2, id_3, id_2, id_2, id_2
  );
endmodule
