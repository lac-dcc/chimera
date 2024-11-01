// Seed: 271763564
module module_0 (
    output logic id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri id_3,
    input tri1 id_4
);
  reg id_6;
  always id_6 = #1 1;
  id_7(
      .id_0(1 == id_6), .id_1(1), .id_2(1)
  );
  wire id_8;
  always @(posedge id_8) id_0 = #1 1;
endmodule
module module_1 (
    input uwire id_0,
    output uwire id_1,
    input tri0 id_2,
    output wire id_3,
    input wand id_4,
    input supply1 id_5,
    input supply1 id_6,
    output supply1 id_7,
    input wor id_8,
    output logic id_9,
    input tri1 id_10
);
  always begin
    id_9 <= 1;
    if (id_8) id_9 <= 1'b0;
    else $display(id_8);
  end
  module_0(
      id_9, id_2, id_0, id_2, id_8
  );
endmodule
