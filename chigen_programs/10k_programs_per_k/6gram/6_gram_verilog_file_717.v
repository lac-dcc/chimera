// Seed: 823786932
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input wor id_2,
    output supply1 id_3,
    output supply1 id_4,
    input wire id_5,
    output tri0 id_6
);
  assign id_6 = id_2;
endmodule
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    output wand id_3,
    output supply1 id_4,
    output logic id_5
);
  wire id_7;
  initial begin
    #1;
    disable id_8;
  end
  module_0(
      id_0, id_0, id_0, id_2, id_3, id_0, id_1
  );
  always @(negedge 1)
    #1 begin
      id_2 = 1;
      id_5 <= id_0 == id_0;
      $display;
    end
endmodule
