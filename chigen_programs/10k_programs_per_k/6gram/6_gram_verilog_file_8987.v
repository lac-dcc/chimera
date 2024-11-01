// Seed: 885196772
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input wand id_2,
    input tri1 id_3,
    output uwire id_4
);
  wire id_6;
  wire id_7;
  wor  id_8;
  wire id_9;
  id_10(
      .id_0(1 + id_8), .id_1(1)
  );
  tri1 id_11 = 1'b0;
endmodule
module module_1 (
    input tri1 id_0,
    input logic id_1,
    output logic id_2,
    input logic id_3,
    input supply1 id_4,
    input tri0 id_5,
    output supply0 id_6,
    output supply0 id_7,
    input wor id_8
);
  logic id_10;
  wire  id_11;
  module_0(
      id_0, id_5, id_0, id_8, id_6
  );
  assign id_10 = id_3;
  logic [7:0] id_12;
  always @* begin
    if (id_4)
      if (1)
        if (id_5)
          if (1 && 1) id_10 <= id_12[1] ? 1 : 1;
          else if (id_4) id_12[1] <= id_1;
          else id_2 <= 1;
  end
endmodule
