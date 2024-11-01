// Seed: 5132288
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri0 id_5
);
  assign id_5 = 1;
endmodule
module module_1 (
    input wand id_0
    , id_9,
    input supply0 id_1,
    input tri id_2,
    output logic id_3,
    input wor id_4,
    input supply1 id_5,
    input uwire id_6,
    output tri0 id_7
);
  always @(1) begin
    id_3 <= #1 1;
  end
  supply1 id_10 = 1'b0;
  module_0(
      id_6, id_5, id_4, id_1, id_4, id_7
  );
  always @(posedge 1) begin
    id_9 = 1;
  end
  always @(posedge id_1 or negedge 1) begin
    if (id_10) begin
      if (id_5) disable id_11;
      else id_11 <= 1;
    end
  end
  or (id_7, id_2, id_9, id_1, id_6, id_10, id_4);
  event id_12;
endmodule
