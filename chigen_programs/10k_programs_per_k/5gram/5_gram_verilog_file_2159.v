// Seed: 3337190386
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input uwire id_4,
    input supply1 id_5,
    output tri id_6,
    input tri0 id_7,
    input wire id_8,
    output tri0 id_9,
    input wire id_10,
    input wor id_11
);
  wire id_13 = id_5 != id_4 || 1'b0;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    output logic id_2,
    output logic id_3,
    input wand id_4,
    output supply1 id_5
);
  supply0 id_7;
  module_0(
      id_4, id_5, id_4, id_5, id_1, id_1, id_5, id_1, id_1, id_5, id_1, id_4
  );
  always_latch @(posedge 1 or posedge 1)
    if (1 == !id_1 || 1 || id_1) begin
      $display(id_7);
      #1
      #1 begin
        if (id_1) id_3 <= #1 -id_1 == 1;
        if (1'b0)
          if (1) id_0 <= id_7 + id_7;
          else begin
            id_0 <= 1;
          end
      end
    end else id_2 <= 1;
endmodule
