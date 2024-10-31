// Seed: 1356336956
module module_0 (
    output tri1 id_0,
    input  wand id_1
);
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    input wor id_3,
    input tri1 id_4,
    input tri id_5,
    input tri0 id_6,
    output logic id_7,
    output supply1 id_8,
    input wire id_9,
    input supply1 id_10,
    output tri1 id_11,
    input tri id_12,
    output tri0 id_13,
    output supply0 id_14,
    input supply1 id_15
);
  always @(negedge 1)
    if (id_9) begin
      wait (id_4);
    end else begin
      id_14 = id_15;
      do
      @(posedge 1) begin
        id_7 <= 1;
        id_11 = id_1;
        id_7  = 1;
      end
      while (id_12);
    end
  module_0(
      id_14, id_10
  );
  assign id_14 = id_9;
endmodule
