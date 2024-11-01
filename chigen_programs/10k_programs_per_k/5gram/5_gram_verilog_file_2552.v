// Seed: 1357867851
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input supply0 id_2,
    output tri0 id_3
    , id_18,
    input tri0 id_4,
    output wire id_5,
    output supply1 id_6,
    input supply1 id_7,
    input wor id_8,
    input wor id_9,
    input supply1 id_10,
    output tri1 id_11,
    input uwire id_12,
    output wor id_13,
    input wor id_14,
    output tri1 id_15,
    input tri1 id_16
);
  assign id_13 = 1;
endmodule
module module_1 (
    output wor   id_0,
    input  logic id_1,
    output logic id_2,
    input  logic id_3,
    inout  logic id_4,
    input  logic id_5,
    input  tri1  id_6
);
  if (1) begin
    always @(*) begin
      fork
        id_8;
        begin
          id_2 = !id_8;
          id_2 = #id_9 1;
          id_8 <= id_5;
        end
      join_any
      id_2 <= 1 == id_1;
    end
  end
  always_latch @(id_3 or posedge id_1) id_4 <= id_1;
  module_0(
      id_6,
      id_6,
      id_6,
      id_0,
      id_6,
      id_0,
      id_0,
      id_6,
      id_6,
      id_6,
      id_6,
      id_0,
      id_6,
      id_0,
      id_6,
      id_0,
      id_6
  );
endmodule
