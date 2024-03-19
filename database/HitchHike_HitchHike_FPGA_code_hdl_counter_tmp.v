module counter_tmp( clock, reset, output_port);
input clock, reset;
output[1:0] output_port;

reg[1:0] counter_reg;

always @ (posedge clock)
begin
    if (!reset)
        counter_reg <= 2'b00;
    else
        counter_reg <= counter_reg+1;
end 

assign output_port = counter_reg;

endmodule

