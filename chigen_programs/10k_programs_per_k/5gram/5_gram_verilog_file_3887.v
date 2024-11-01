// Seed: 2626336072
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wor id_2,
    input uwire sample,
    input wand id_4,
    output tri1 id_5,
    input tri1 id_6,
    input supply0 module_0,
    output wand id_8,
    input wor id_9,
    input tri id_10,
    input uwire id_11,
    output supply0 id_12,
    input supply0 id_13,
    input supply1 id_14
);
  assign id_2  = 1 ? id_4 : id_11;
  assign id_12 = id_6#(.id_13(1));
  timeprecision 1ps;
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    input wand id_2,
    input supply0 id_3,
    output wand id_4,
    output wor id_5,
    output logic id_6,
    input supply1 id_7
);
  tri1 id_9;
  reg  id_10;
  assign id_0 = 1;
  wire id_11, id_12, id_13;
  assign id_6 = 1;
  module_0(
      id_0, id_9, id_5, id_2, id_7, id_9, id_9, id_9, id_5, id_7, id_1, id_1, id_5, id_7, id_7
  );
  wire id_14;
  always @(posedge id_12 or posedge 1) begin
    if (id_11) begin
      id_4 = id_9;
      id_6 <= 1;
    end else begin
      fork
        disable id_15;
        #id_16 id_10 <= 1 < 'b0;
      join_none
    end
  end
endmodule
