// Seed: 3047070121
module module_0 (
    input supply0 id_0,
    output tri0 id_1
    , id_9,
    output supply1 id_2,
    input uwire id_3,
    input tri1 id_4,
    input wire id_5,
    output tri1 id_6,
    input wand id_7
);
  id_10(
      .id_0(id_7), .id_1(1), .id_2(1), .id_3(1), .id_4(id_0), .id_5(id_0), .id_6(1'b0), .id_7(!id_2)
  );
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    output logic id_6
);
  always begin
    `define pp_8 0
  end
  assign id_3 = id_4;
  initial begin
    if (id_2) repeat (id_5) id_6 <= 1;
    else;
    @(posedge 1 or 1) begin
      $display(id_5, 1);
    end
  end
  initial begin
    if (id_4) $display(1);
    else @(1) id_1 = 1'h0;
  end
  module_0(
      id_0, id_1, id_3, id_2, id_5, id_0, id_1, id_0
  );
  wire id_9;
  always begin
    id_3 = 1;
  end
endmodule
