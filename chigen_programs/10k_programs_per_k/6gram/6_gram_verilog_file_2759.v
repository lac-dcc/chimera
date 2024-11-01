// Seed: 4231165453
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input tri1 id_2,
    input supply1 id_3,
    output tri id_4,
    input wor id_5,
    input tri1 id_6,
    output wand id_7,
    output uwire id_8,
    input wand id_9,
    input tri1 id_10,
    input wand id_11,
    input wor id_12,
    output tri1 id_13,
    input supply1 id_14,
    output supply0 id_15,
    input tri0 id_16,
    input wand id_17
    , id_21,
    input wire id_18,
    output tri1 id_19
);
  always @* begin
    if (id_1) id_7 = id_18 * 1'h0;
  end
endmodule
module module_1 (
    output logic id_0,
    output wire id_1,
    output logic id_2,
    input supply0 id_3,
    input logic id_4,
    input tri1 id_5,
    input tri0 id_6,
    input logic id_7
);
  assign id_0 = 1;
  assign id_2 = id_7;
  module_0(
      id_6,
      id_5,
      id_5,
      id_5,
      id_1,
      id_6,
      id_5,
      id_1,
      id_1,
      id_3,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1
  );
  always @(posedge 1'd0) begin
    id_2 = 1;
    assert (id_3);
    fork
      #1;
      begin
        if (1) begin
          id_0 <= id_4;
          id_1 = id_5;
        end
      end
    join
    id_2 <= ~id_4;
  end
endmodule
