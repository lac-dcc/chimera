// Seed: 1900387405
module module_0 (
    input supply0 id_0,
    output tri1 id_1
);
  reg id_3;
  initial begin
    if (1)
      if (id_3) id_3 <= 1;
      else assign id_3 = id_3 & id_3;
    else begin
      id_3 = ~id_3;
      id_3 <= id_3 == 1 + 'b0;
      if (id_0) id_1 = 1'b0 / id_3;
    end
  end
endmodule
module module_1 (
    input  tri   id_0,
    input  tri   id_1,
    input  wire  id_2,
    input  wand  id_3,
    output logic id_4,
    input  wire  id_5,
    input  tri1  id_6,
    output tri0  id_7
);
  initial begin
    id_4 <= 1 != 1;
    if (~id_0) id_4 <= 1;
    else begin
      fork
        id_9;
      join
    end
  end
  module_0(
      id_2, id_7
  );
endmodule
