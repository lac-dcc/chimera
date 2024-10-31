// Seed: 2258852877
module module_0 (
    output tri0 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wand id_3,
    input wand id_4,
    output logic id_5,
    input supply0 id_6,
    output wand id_7,
    input wand id_8,
    output tri id_9
);
  assign id_7 = id_6 == 1;
  wire id_11;
  always #(1'b0) #1;
  always @(posedge 1)
    if (id_4) deassign id_11;
    else id_5 <= (id_3 && 1);
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input uwire id_2,
    output tri id_3,
    input tri1 id_4,
    input uwire id_5,
    input wand id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri id_9,
    input uwire id_10,
    output tri0 id_11,
    output supply0 id_12,
    input wand id_13,
    output logic id_14
);
  always @(id_7 or posedge 1) begin
    fork
      for (id_11 = 1; 'b0 | id_5; id_14 = 1) begin
        id_14 = 1'b0 < id_13(1);
      end
      begin
        id_14 <= 1;
      end
    join
  end
  module_0(
      id_3, id_11, id_4, id_4, id_9, id_14, id_7, id_11, id_1, id_12
  );
endmodule
