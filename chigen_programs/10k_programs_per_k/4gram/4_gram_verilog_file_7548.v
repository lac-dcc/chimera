// Seed: 3699043029
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input wand id_2,
    input tri id_3,
    output tri0 id_4
);
  wire id_6;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    output wand id_2,
    input supply0 id_3,
    input wire id_4,
    output supply0 id_5,
    inout tri id_6,
    input wor id_7
);
  reg id_9;
  always @(negedge id_0 or id_4) begin
    if (id_3) begin
      if (id_1)
        if (1'b0) begin
          if (id_9)
            #1 begin
              id_5 = 1;
            end
          else id_9 <= 1;
        end else begin
          assert (id_0 == 1'b0);
          if (id_9) begin
            id_6 = 1;
            wait (1);
          end else id_9 <= 1;
        end
    end else begin
      if (id_3) begin
        id_6 = id_6;
      end
    end
  end
  assign id_9 = id_9;
  wire id_10;
  wire id_11;
  module_0(
      id_0, id_6, id_1, id_6, id_6
  );
endmodule
