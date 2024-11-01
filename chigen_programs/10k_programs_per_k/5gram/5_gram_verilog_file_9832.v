// Seed: 4076006857
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    input supply0 id_4,
    output uwire id_5,
    output tri id_6,
    input wand id_7,
    output supply1 id_8,
    input wire id_9,
    input tri id_10,
    output wire id_11
);
  wire id_13;
endmodule
module module_1 (
    output logic id_0,
    output tri1 id_1,
    input supply1 id_2,
    input uwire id_3,
    input wire id_4,
    inout uwire id_5,
    input uwire id_6,
    input supply1 id_7,
    output tri1 id_8
);
  wire id_10;
  assign id_8 = id_7 == id_5;
  module_0(
      id_6, id_5, id_4, id_6, id_4, id_5, id_1, id_4, id_1, id_2, id_7, id_8
  );
  always_latch @(posedge id_10++
  or posedge id_5 == {id_7, id_7 == 1})
  begin
    if (id_4) begin
      id_0 <= 1;
    end
  end
endmodule
