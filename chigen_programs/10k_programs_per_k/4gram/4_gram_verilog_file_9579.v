// Seed: 681578092
module module_0 (
    input wor id_0,
    input tri0 id_1,
    output wire id_2,
    input supply0 id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri1 id_6
);
  assign id_4 = 1;
  wire id_8;
  assign id_4 = 1'b0;
  assign id_2 = id_0;
  wire id_9;
endmodule
module module_1 (
    input logic id_0,
    input wand id_1,
    output supply1 id_2,
    input logic id_3,
    input supply0 id_4
);
  for (id_6 = 1; id_3; id_6 = 1) begin : id_7
    for (id_8 = 1; {id_6, id_3}; id_7 = id_0) begin
      always @(posedge (id_0) or posedge 1) begin
        if (1) begin
          id_8 <= id_7;
        end else id_7 <= id_6;
      end
    end
  end
  module_0(
      id_1, id_4, id_2, id_1, id_2, id_1, id_4
  );
endmodule
