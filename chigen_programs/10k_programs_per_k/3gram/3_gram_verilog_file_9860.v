// Seed: 1306984202
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output uwire id_2,
    input supply1 id_3,
    input uwire id_4
);
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output supply0 id_2,
    output logic id_3,
    input logic id_4,
    input supply0 id_5
);
  for (id_7 = id_1; id_7; id_2 = id_5) begin : id_8
    supply1 id_9;
    assign id_9 = id_0;
  end
  reg id_10;
  module_0(
      id_7, id_0, id_2, id_0, id_5
  );
  assign id_3 = id_4;
  initial
    @(posedge "") begin
      id_3 <= id_10;
    end
endmodule
