// Seed: 4082874640
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3,
    input wand id_4,
    output wand id_5,
    input tri id_6,
    input tri id_7,
    output wire id_8,
    output uwire id_9,
    input tri0 id_10
);
  always @(id_1 or posedge id_2) begin
    assign id_3 = 1;
    fork
      wait (1);
      id_12;
    join
    $display(1'h0, ~id_1);
  end
  static integer id_13;
  assign id_5 = id_1 ? {id_7{1'b0}} : id_7;
endmodule
module module_1 (
    output wire id_0,
    output uwire id_1,
    output wand id_2,
    input tri id_3,
    output uwire id_4,
    output supply0 id_5
);
  wire id_7;
  module_0(
      id_0, id_3, id_3, id_2, id_3, id_0, id_3, id_3, id_2, id_5, id_3
  );
  assign id_5 = 1 && 1;
  assign id_4 = 1;
endmodule
